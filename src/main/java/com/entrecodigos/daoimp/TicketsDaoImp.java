/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import com.entrecodigos.repositorios.Detalle_Tickets;
import com.entrecodigos.repositorios.Productos;
import com.entrecodigos.repositorios.Promociones;
import com.entrecodigos.repositorios.Tickets;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Transactional
@Component("objTicketsDao")
public class TicketsDaoImp {

    @Autowired
    JdbcTemplate jdbcTemplate;

    private int notificar = 0;

    public TicketsDaoImp() {
        System.out.println("este es el contrusctor");
    }

    public Object getTicketSucursal(String id) {
        String query = "select * from tickets where id_sucursal = " + id;
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;
    }

    public Object getTicketEspecifico(int idSucursal, int idMesa) {
        String query = "select * from tickets where id_sucursal = ? and id_mesa = ?";
        Map<String, Object> resultado = jdbcTemplate.queryForMap(query, new Object[]{idSucursal, idMesa});
        return resultado;
    }

    public Object insertar(Tickets p, boolean unir) {

        Object resultado = null;
        try {

            int id_user = p.getIdUser();
            int id_sucursal = p.getIdSucursal();
            int id_mesa = p.getIdMesa();
            String nombre = p.getNombre();

            String query = "select COALESCE(max(id_folio),0)  as folio from historico_tickets where id_sucursal=?";
            Map<String, Object> maximo = this.jdbcTemplate.queryForMap(query, new Object[]{id_sucursal});

            String maximoFolio = maximo.get("folio").toString();
            int intfolio = Integer.parseInt(maximoFolio);

            query = "select COALESCE(max(id_folio),0)  as folio from tickets where id_sucursal=?";
            maximo = this.jdbcTemplate.queryForMap(query, new Object[]{id_sucursal});

            maximoFolio = maximo.get("folio").toString();

            int intfolio2 = Integer.parseInt(maximoFolio);

            intfolio = (intfolio >= intfolio2) ? intfolio : intfolio2;

            intfolio++;

            query = "insert into tickets (id_user,fecha,id_folio,id_sucursal,id_mesa,nombre,hora,cortesia,efectivo_porcentaje) values (" + id_user + ",(now() AT TIME ZONE 'America/Mexico_City')," + intfolio + "," + id_sucursal + "," + id_mesa + ",'" + nombre + "',((now() AT TIME ZONE 'America/Mexico_City')::TIME),0,0) returning *;";
            Map<String, Object> respu = jdbcTemplate.queryForMap(query);
            String id_tiket = String.valueOf(respu.get("id_ticket"));
            String nombreTicket = String.valueOf(respu.get("nombre"));

            if (!unir) {
                query = String.format("update mesas set ocupada = true where id_sucursal = %1$s and id_mesa = %2$s", id_sucursal, id_mesa);
            } else {
                query = "";
                List<Integer> mesasAfectadas = p.getMesasAfectadas();
                for (Integer item : mesasAfectadas) {
                    query += String.format("update mesas set ocupada = true,mesafusionada = %3$s where id_sucursal = %1$s and id_mesa = %2$s;", id_sucursal, item, id_mesa);
                }

            }

            jdbcTemplate.update(query);

            Map<String, Object> r1 = new HashMap<String, Object>();
            r1.put("respuesta", "Ticket Ingresado Correctamente");
            r1.put("id_ticket", id_tiket);
            r1.put("id_mesa", id_mesa);
            r1.put("nombre", nombreTicket);

            resultado = r1;

        } catch (Exception e) {

            Map<String, Object> r1 = new HashMap<String, Object>();
            r1.put("respuesta", "Error al ingresar un ticket nuevo");
            resultado = r1;

        }

        return resultado;
    }

    public Object CancelarTicket(String id) {
        String query = "select * from tickets where id_ticket = " + id;
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {

            resultado = this.jdbcTemplate.queryForMap(query);
            int id_ticket = Integer.parseInt(String.valueOf(resultado.get("id_ticket")));
            int id_user = Integer.parseInt(String.valueOf(resultado.get("id_user")));
            String fecha = String.valueOf(resultado.get("fecha"));
            int id_folio = Integer.parseInt(String.valueOf(resultado.get("id_folio")));
            int id_sucursal = Integer.parseInt(String.valueOf(resultado.get("id_sucursal")));
            String hora = String.valueOf(resultado.get("hora"));
            int id_mesa = Integer.parseInt(String.valueOf(resultado.get("id_mesa")));
            String nombre = String.valueOf(resultado.get("nombre"));

            query = String.format("insert into historico_tickets(id_ticket,id_user,fecha,id_folio,id_sucursal,id_mesa,total,cancelado,nombre,hora) values(%1$s,%2$s,'%3$s',%4$s,%5$s,%6$s,%7$s,%8$s,'%9$s',((now() AT TIME ZONE 'America/Mexico_City')::TIME))",
                    id_ticket, id_user, fecha, id_folio, id_sucursal, id_mesa, 0, true, nombre);

            this.jdbcTemplate.update(query);

            query = "select d.*,(p.precio*d.cantidad) as total from detalle_ticket d inner join productos p on p.id_producto = d.id_producto where id_ticket = " + id;
            List<Map<String, Object>> aux = this.jdbcTemplate.queryForList(query);
            query = "";
            for (Map<String, Object> item : aux) {
                id_ticket = Integer.parseInt(String.valueOf(item.get("id_ticket")));
                int id_producto = Integer.parseInt(String.valueOf(item.get("id_producto")));
                int cantidad = Integer.parseInt(String.valueOf(item.get("cantidad")));
                String observaciones = String.valueOf(item.get("observaciones"));
                boolean cancelado = Boolean.parseBoolean(String.valueOf(item.get("cancelado")));
                double total = Double.parseDouble(String.valueOf(item.get("total")));
                query += String.format("insert into historico_detalletickets values (%1$s,%2$s,%3$s,'%4$s',%5$s,%6$s);",
                        id_ticket, id_producto, cantidad, observaciones, cancelado, total);
            }

            jdbcTemplate.update(query);

            query = "delete from tickets where id_ticket = " + id;
            this.jdbcTemplate.update(query);

            query = " delete from detalle_ticket where id_ticket = " + id;
            this.jdbcTemplate.update(query);

            query = " update mesas set ocupada = false where id_mesa = ? and id_sucursal = ? ";
            this.jdbcTemplate.update(query, new Object[]{
                id_mesa, id_sucursal
            });

            query = " update mesas set ocupada = false,mesafusionada = null where mesafusionada = ? and id_sucursal = ? ";
            this.jdbcTemplate.update(query, new Object[]{
                id_mesa, id_sucursal
            });

        } catch (Exception e) {
            resultado.put("respuesta", "Registro  no cancelado");

        }

        return resultado;
    }

    public Object insertarDetalleTickets(Detalle_Tickets detalle) {
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            String query = "insert into detalle_ticket (id_ticket,id_producto,cantidad,servido,observaciones,tipo_producto,fecharegistro,cancelado) values("
                    + detalle.getId_ticket() + "," + detalle.getId_producto() + "," + detalle.getCantidad() + ",false,'" + detalle.getObservaciones() + "'," + detalle.getTipo_producto() + ",(now() AT TIME ZONE 'America/Mexico_City'),false);";

            jdbcTemplate.update(query);
            this.notificar++;
            this.notificar = (this.notificar > 10000) ? 0 : this.notificar;
            resultado.put("respuesta", "Productos Insertados a la Orden");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al insertar productos a la orden");
        }
        return resultado;
    }

    public Object insertarDetalleTicketsLista(List<Detalle_Tickets> lista) throws Exception {
        System.err.println("si entra al detalle");
        Map<String, Object> resultado = new HashMap<String, Object>();
        for (Detalle_Tickets item : lista) {
            int id_pruducto = item.getId_producto();
            String queryInsumos = "select * from insumos where id_producto = " + id_pruducto;
            List<Map<String, Object>> resultadoinsumos = jdbcTemplate.queryForList(queryInsumos);
            for (Map<String, Object> insumo : resultadoinsumos) {
                int id_inventario = Integer.parseInt(String.valueOf(insumo.get("id_inventario")));
                double cantidad = Double.parseDouble(String.valueOf(insumo.get("cantidad")));

                String queryInventario = String.format("select  (cantidad - (%1$s * %2$s)) as cantidad , descripcion from inventario  where id_inventario = %3$s ", cantidad, item.getCantidad(), id_inventario);

                Map<String, Object> mapaInventario = jdbcTemplate.queryForMap(queryInventario);
                double cantidadNeto = Double.parseDouble(String.valueOf(mapaInventario.get("cantidad")));
                String nombreInventario = String.valueOf(mapaInventario.get("descripcion"));
                if (cantidadNeto <= 0) {
                    throw new Exception("Ya no existen " + nombreInventario + " en el inventario.");
                }
            }
        }
System.err.println("Se prepara para insertar");
        String aux = "";
        for (Detalle_Tickets detalle : lista) {
            String query = "insert into detalle_ticket (id_ticket,id_producto,cantidad,servido,observaciones,tipo_producto,fecharegistro,cancelado) values("
                    + detalle.getId_ticket() + "," + detalle.getId_producto() + "," + detalle.getCantidad() + "," + detalle.isServido() + ",'" + detalle.getObservaciones() + "'," + detalle.getTipo_producto() + ",(now() AT TIME ZONE 'America/Mexico_City'),false);";
            aux += query;
        }
System.err.println("Ya inserto");
        if (!aux.equalsIgnoreCase("")) {
System.err.println(aux);            
            jdbcTemplate.update(aux);
System.err.println("continua el proceso");
            aux = "";

            for (Detalle_Tickets item : lista) {
                int id_pruducto = item.getId_producto();
                String queryInsumos = "select * from insumos where id_producto = " + id_pruducto;
                List<Map<String, Object>> resultadoinsumos = jdbcTemplate.queryForList(queryInsumos);
                for (Map<String, Object> insumo : resultadoinsumos) {
                    int id_inventario = Integer.parseInt(String.valueOf(insumo.get("id_inventario")));
                    double cantidad = Double.parseDouble(String.valueOf(insumo.get("cantidad")));

                    String queryInventario = String.format("update inventario set cantidad = cantidad - (%1$s * %2$s) where id_inventario = %3$s ", cantidad, item.getCantidad(), id_inventario);
                    jdbcTemplate.update(queryInventario);
                }
            }

            this.notificar++;
            this.notificar = (this.notificar > 10000) ? 0 : this.notificar;
        }
        resultado.put("respuesta", "Productos Insertados a la Orden");

        return resultado;
    }

    public Object obtenerDetalleTickets(int id) {
        String query = " SELECT	d.*, P .nombre, (case when  d.cortesia is null then p.precio * d.cantidad when d.cortesia = 1 then ((p.precio * d.cantidad) - d.efectivo_porcentaje) when d.cortesia = 2 then ((p.precio * d.cantidad)-(((p.precio * d.cantidad) * d.efectivo_porcentaje) / 100)) when d.cortesia = 3 then 0 END) as precio,d.cortesia FROM	detalle_ticket d INNER JOIN productos P ON P .id_producto = d.id_producto WHERE "
                + " id_ticket = ? ORDER BY	ID ASC ";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query, new Object[]{id});
        return resultado;
    }

    public Object obtenerDetalleTicketsAgrupados(String id) {
        String query = "select id_ticket,id_folio,cortesia_ticket,descontar_ticket, id_folio,id_producto,cortesia,nombre,unitario,sum(cantidad) as cantidad,sum(precio_total) as precio_total from productosView where id_ticket = %1$s group  by id_ticket,id_producto,nombre,unitario,id_folio,cortesia,cortesia_ticket,descontar_ticket";
        query = String.format(query, id);

        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);

        query = "select  (case "
                + " when (to_char((now() AT TIME ZONE 'America/Mexico_City'), 'Dy')) = 'Sun' then 'do' "
                + " when (to_char((now() AT TIME ZONE 'America/Mexico_City'), 'Dy')) = 'Mon' then 'lu' "
                + " when (to_char((now() AT TIME ZONE 'America/Mexico_City'), 'Dy')) = 'Tue' then 'ma' "
                + " when (to_char((now() AT TIME ZONE 'America/Mexico_City'), 'Dy')) = 'Wed' then 'mi' "
                + " when (to_char((now() AT TIME ZONE 'America/Mexico_City'), 'Dy')) = 'Thu' then 'ju' "
                + " when (to_char((now() AT TIME ZONE 'America/Mexico_City'), 'Dy')) = 'Fri' then 'vi' "
                + " when (to_char((now() AT TIME ZONE 'America/Mexico_City'), 'Dy')) = 'Sat' then 'sa' "
                + " end) as dia ";

        Map<String, Object> queryDia = this.jdbcTemplate.queryForMap(query);
        String dia = String.valueOf(queryDia.get("dia"));

        query = "select * from promociones where dias like '%" + dia + "%' and (inicia::time) <= ((now() AT TIME ZONE 'America/Mexico_City')::time) and (termina::time) >= ((now() AT TIME ZONE 'America/Mexico_City')::time)";

        List<Map<String, Object>> promociones = jdbcTemplate.queryForList(query);

        List<Map<String, Object>> promocionesFinal = (List<Map<String, Object>>) new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> objetoEnlaPromocion = (List<Map<String, Object>>) new ArrayList<Map<String, Object>>();

        for (Map<String, Object> item : promociones) {
            String productosCodificado = String.valueOf(item.get("productoscodificado"));
            String[] split1 = productosCodificado.split("-");
            int totalPromociones = 0;
            boolean hayPromocion = false;
            int[][] promocion = new int[split1.length][2];
            int[][] productoPromocion = new int[split1.length][2];
            int x = 0;
            for (String i : split1) {
                String[] split2 = i.split(":");
                int id_producto = Integer.parseInt(split2[0]);
                int cantidad = Integer.parseInt(split2[1]);

                promocion[x][0] = id_producto;
                promocion[x][1] = cantidad;

                for (Map<String, Object> productos : resultado) {
                    int id_productoAux = Integer.parseInt(String.valueOf(productos.get("id_producto")));
                    if (id_productoAux == id_producto) {
                        hayPromocion = true;
                        int cantidadAux = Integer.parseInt(String.valueOf(productos.get("cantidad")));
                        productoPromocion[x][0] = id_productoAux;
                        productoPromocion[x][1] = cantidadAux;
                        Map<String, Object> mapaProducto = new HashMap<String, Object>();
                        mapaProducto.put("id", id_productoAux);
                        mapaProducto.put("nombre", productos.get("nombre"));
                        mapaProducto.put("cantidad", promocion[x][1]);
                        mapaProducto.put("total", productos.get("unitario"));
                        objetoEnlaPromocion.add(mapaProducto);
                        break;
                    }

                    hayPromocion = false;
                }

                x++;
            }
            if (hayPromocion) {
                int auxX = 0;
                while (true) {
                    boolean aplicaPromocion = false;
                    for (int auxX2 = 0; auxX2 < promocion.length; auxX2++) {
                        productoPromocion[auxX2][1] -= promocion[auxX2][1];
                        if (productoPromocion[auxX2][1] < 0) {
                            aplicaPromocion = false;
                            break;
                        }
                        aplicaPromocion = true;
                    }
                    if (aplicaPromocion) {
                        auxX++;
                    } else {
                        totalPromociones = auxX;
                        Map<String, Object> mapa = new HashMap<>();
                        mapa.put("promocion", item.get("nombre"));
                        mapa.put("totalPromocion", totalPromociones);
                        mapa.put("nombre", item.get("nombre"));
                        mapa.put("precio", item.get("precio"));
                        mapa.put("id_promocion", item.get("id"));

                        for (Map<String, Object> objAux : objetoEnlaPromocion) {
                            double total = Double.parseDouble(String.valueOf(objAux.get("total")));
                            int cantidad = Integer.parseInt(String.valueOf(objAux.get("cantidad")));

                            total = total * totalPromociones * cantidad;
                            cantidad = cantidad * totalPromociones;

                            objAux.remove("total");
                            objAux.remove("cantidad");

                            objAux.put("total", total);
                            objAux.put("cantidad", cantidad);
                        }

                        mapa.put("productos", objetoEnlaPromocion);
                        promocionesFinal.add(mapa);

                        objetoEnlaPromocion = (List<Map<String, Object>>) new ArrayList<Map<String, Object>>();
                        break;
                    }
                }

            }
        }

        Map<String, Object> resultadoFinal = new HashMap<String, Object>();
        resultadoFinal.put("resultado", resultado);
        resultadoFinal.put("promociones", promocionesFinal);

        return resultadoFinal;
    }

    public Object obtenerDetalleAgrupadoticketfinal(String id) {
        String query = " SELECT	d.id_ticket,t.id_mesa,t.cortesia as cortesia_ticket,t.efectivo_porcentaje as descuento_ticket, t.id_folio,t.total,d.id_producto,d.id_producto,d.cortesia,d.efectivo_porcentaje,SUM (cantidad) AS cantidad,sum(d.total) AS precio_total,P.nombre,(sum(d.total)/SUM (cantidad)) as unitario FROM  "
                + " historico_detalletickets d INNER JOIN productos P ON P .id_producto = d.id_producto inner join historico_tickets t on t.id_ticket = d.id_ticket WHERE	d.id_ticket =  " + id
                + " and d.cancelado = false group by d.id_ticket,d.id_producto,p.nombre,p.precio,t.id_folio,t.id_mesa,t.total,t.cortesia,t.efectivo_porcentaje,d.id_producto,d.cortesia,d.efectivo_porcentaje  ";

        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);

        Map<String, Object> resultadoFinal = new HashMap<String, Object>();
        resultadoFinal.put("resultado", resultado);

        query = "select * from historico_promocion_ticket where id_ticket = " + id;
        List<Map<String, Object>> promociones = jdbcTemplate.queryForList(query);
        for (Map<String, Object> item : promociones) {
            int id_promocion = Integer.parseInt(String.valueOf(item.get("id_promocion")));
            query = String.format("select * from historico_promocion_productos where id_ticket = %1$s and id_promocion = %2$s", id, id_promocion);
            List<Map<String, Object>> objProductoPromocion = jdbcTemplate.queryForList(query);
            item.put("productos", objProductoPromocion);
        }

        resultadoFinal.put("promociones", promociones);

        return resultadoFinal;
    }

    public Object cobrarTicket(Tickets ticket) {
        String query = "select * from tickets where id_ticket = " + ticket.getIdTicket();
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {

            resultado = this.jdbcTemplate.queryForMap(query);
            int id_ticket = Integer.parseInt(String.valueOf(resultado.get("id_ticket")));
            int id_user = Integer.parseInt(String.valueOf(resultado.get("id_user")));
            String fecha = String.valueOf(resultado.get("fecha"));
            int id_folio = Integer.parseInt(String.valueOf(resultado.get("id_folio")));
            int id_sucursal = Integer.parseInt(String.valueOf(resultado.get("id_sucursal")));
            String hora = String.valueOf(resultado.get("hora"));
            int id_mesa = Integer.parseInt(String.valueOf(resultado.get("id_mesa")));
            String nombre = String.valueOf(resultado.get("nombre"));
            int cortesiaTicket = Integer.parseInt(String.valueOf(resultado.get("cortesia")));
            double descontarTicket = Double.parseDouble(String.valueOf(resultado.get("efectivo_porcentaje")));

            query = String.format("insert into historico_tickets(id_ticket,id_user,fecha,id_folio,id_sucursal,id_mesa,total,cancelado,nombre,hora,cortesia,efectivo_porcentaje) values(%1$s,%2$s,'%3$s',%4$s,%5$s,%6$s,%7$s,%8$s,'%9$s',((now() AT TIME ZONE 'America/Mexico_City')::TIME),%10$s,%11$s)",
                    id_ticket, id_user, fecha, id_folio, id_sucursal, id_mesa, 0, false, nombre,cortesiaTicket,descontarTicket);

            this.jdbcTemplate.update(query);

            query = "select d.*,(p.precio*d.cantidad) as total from detalle_ticket d inner join productos p on p.id_producto = d.id_producto where id_ticket = " + ticket.getIdTicket();
            List<Map<String, Object>> aux = this.jdbcTemplate.queryForList(query);
            query = "";

            double ticketTotal = 0;
            for (Map<String, Object> item : aux) {
                id_ticket = Integer.parseInt(String.valueOf(item.get("id_ticket")));
                int id_producto = Integer.parseInt(String.valueOf(item.get("id_producto")));
                int cantidad = Integer.parseInt(String.valueOf(item.get("cantidad")));
                String observaciones = String.valueOf(item.get("observaciones"));
                boolean cancelado = Boolean.parseBoolean(String.valueOf(item.get("cancelado")));
                double total = cancelado ? 0 : Double.parseDouble(String.valueOf(item.get("total")));
                String cortesia = String.valueOf(item.get("cortesia"));
                String efectivo = String.valueOf(item.get("efectivo_porcentaje"));

                if (cortesia.equals("1")) {

                    double efectivodbl = Double.parseDouble(efectivo);
                    total = total - efectivodbl;

                    query += String.format("insert into historico_detalletickets values (%1$s,%2$s,%3$s,'%4$s',%5$s,%6$s,%7$s,%8$s);",
                            id_ticket, id_producto, cantidad, observaciones, cancelado, total, cortesia, efectivodbl);

                } else if (cortesia.equals("2")) {

                    double efectivodbl = Double.parseDouble(efectivo);
                    total = total - ((efectivodbl * total) / 100);

                    query += String.format("insert into historico_detalletickets values (%1$s,%2$s,%3$s,'%4$s',%5$s,%6$s,%7$s,%8$s);",
                            id_ticket, id_producto, cantidad, observaciones, cancelado, total, cortesia, efectivodbl);

                } else if (cortesia.equals("3")) {

                    total = 0;
                    query += String.format("insert into historico_detalletickets values (%1$s,%2$s,%3$s,'%4$s',%5$s,%6$s,%7$s,null);",
                            id_ticket, id_producto, cantidad, observaciones, cancelado, total, cortesia);
                } else {
                    query += String.format("insert into historico_detalletickets values (%1$s,%2$s,%3$s,'%4$s',%5$s,%6$s,null,null);",
                            id_ticket, id_producto, cantidad, observaciones, cancelado, total);
                }

                ticketTotal += total;
            }
            
            if(cortesiaTicket == 1){
                ticketTotal -= descontarTicket;
            }else if(cortesiaTicket == 2){
                ticketTotal -= (ticketTotal * descontarTicket) / 100;
            }else if(cortesiaTicket == 3){
                ticketTotal = 0;
            }

            jdbcTemplate.update(query);

            query = "delete from tickets where id_ticket = " + ticket.getIdTicket();
            this.jdbcTemplate.update(query);

            query = " delete from detalle_ticket where id_ticket = " + ticket.getIdTicket();
            this.jdbcTemplate.update(query);

            query = " update historico_tickets set total = ?,tipo_pago = ? where id_ticket = " + ticket.getIdTicket();
            this.jdbcTemplate.update(query, new Object[]{ticketTotal, ticket.getTipoPago()});

            query = " update mesas set ocupada = false where id_mesa = ? and id_sucursal = ? ";
            this.jdbcTemplate.update(query, new Object[]{
                id_mesa, id_sucursal
            });

            query = " update mesas set ocupada = false,mesafusionada = null where mesafusionada = ? and id_sucursal = ? ";
            this.jdbcTemplate.update(query, new Object[]{
                id_mesa, id_sucursal
            });

            //Insertando el historico de promociones
            query = "";
            List<Promociones> promociones = ticket.getPromociones();
            if (promociones != null) {

                for (Promociones item : promociones) {
                    int id_promocion = item.getId();
                    nombre = item.getNombre();
                    int cantidad = item.getCantidad();
                    double total = item.getPrecio();

                    query += String.format("insert into historico_promocion_ticket values (%1$s,%2$s,'%3$s',%4$s,%5$s);", id_ticket, id_promocion, nombre, cantidad, total);
                    for (Productos producto : item.getListaProductos()) {
                        int id_producto = producto.getId_producto();
                        String nombreProducto = producto.getNombre();
                        int cantidadProducto = producto.getCantidad();
                        double totalProducto = producto.getTotal();
                        query += String.format("insert into historico_promocion_productos values(%1$s,%2$s,%3$s,'%4$s',%5$s,%6$s);", id_ticket, id_promocion, id_producto, nombreProducto, cantidadProducto, totalProducto);
                    }
                }

                jdbcTemplate.update(query);
            }

        } catch (Exception e) {
            resultado.put("respuesta", "Registro  no cancelado");

        }

        return resultado;
    }

    public Object obtenerdetallecocinero(int id_sucursal, int lugar) {

        /*
         lugar = 1 (cocina)
         lugar = 2 (Barra)
         lugar = 3 (Barra y Cocina)
         */
        String query = " select u.nombre, t.id_ticket,d.id_producto,d.cantidad,t.id_mesa,t.id_user,d.id,p.nombre as producto,cate.nombre as categoria ,d.observaciones,p.notificacion, "
                + " (extract('hour' from (now() AT TIME ZONE 'America/Mexico_City')-fecharegistro)*60)+extract('minute' from (now() AT TIME ZONE 'America/Mexico_City')-fecharegistro) as minutos_transcurridos   "
                + " from tickets t inner join detalle_ticket d on d.id_ticket = t.id_ticket "
                + " inner join productos p on d.id_producto = p.id_producto "
                + " inner join categoria cate on p.id_categoria = cate.id "
                + " inner join users u on u.id = t.id_user "
                + " where t.id_sucursal = ? and (p.notificacion = ? or p.notificacion = 3) and d.servido = false order by minutos_transcurridos desc";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query, new Object[]{id_sucursal, lugar});
        return resultado;
    }

    public Object actualizardetallecocinero(Detalle_Tickets obj) {
        Map<String, Object> resultado = new HashMap<String, Object>();

        try {

            int id_ticket = obj.getId_ticket();
            int id_producto = obj.getId_producto();
            double cantidad = obj.getCantidad();
            boolean servido = obj.isServido();
            int id = obj.getId();

            String query = "update detalle_ticket set cantidad = " + cantidad + ", servido = " + servido + " where id_ticket = " + id_ticket + " and id_producto = " + id_producto + " and id =  " + id;

            jdbcTemplate.update(query);
            this.notificar++;
            this.notificar = (this.notificar > 10000) ? 0 : this.notificar;
            resultado.put("respuesta", "Producto servido");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al insertar productos a la orden");
        }
        return resultado;
    }

    public Object getNotificaciones() {
        Map<String, Object> respuesta = new HashMap<String, Object>();
        respuesta.put("notificar", this.notificar);
        return respuesta;
    }

    public Object actualizarDetalleTicket(Detalle_Tickets p) {
        Map<String, Object> resultado = new HashMap<String, Object>();
        if (p.isCancelado()) {
            int id_pruducto = p.getId_producto();

            String queryInsumos = "select * from insumos where id_producto = " + id_pruducto;
            List<Map<String, Object>> resultadoinsumos = jdbcTemplate.queryForList(queryInsumos);
            for (Map<String, Object> insumo : resultadoinsumos) {
                int id_inventario = Integer.parseInt(String.valueOf(insumo.get("id_inventario")));
                double cantidad = Double.parseDouble(String.valueOf(insumo.get("cantidad")));

                String queryInventario = String.format("update inventario set cantidad = cantidad + (%1$s * %2$s) where id_inventario = %3$s ", cantidad, p.getCantidad(), id_inventario);
                jdbcTemplate.update(queryInventario);
            }
        }

        if (p.getCortesia() == 1 || p.getCortesia() == 2) {//efectivo

            String update = "update detalle_ticket set cortesia = %1$s,efectivo_porcentaje=%2$s where id = %3$s ";
            update = String.format(update, p.getCortesia(), p.getEfectivo_porcentaje(), p.getId());
            try {
                jdbcTemplate.update(update);
                resultado.put("respuesta", "Descuento aplicado al producto");
            } catch (Exception e) {
                resultado.put("respuesta", "Error al actualizar el producto");

            }

        } else if (p.getCortesia() == 3) {//cortesía
            String update = "update detalle_ticket set cortesia = %1$s where id = %2$s ";
            update = String.format(update, p.getCortesia(), p.getId());
            try {
                jdbcTemplate.update(update);
                resultado.put("respuesta", "Descuento aplicado al producto");
            } catch (Exception e) {
                resultado.put("respuesta", "Error al actualizar el producto");

            }
        } else {
            String query = "update detalle_ticket set cantidad = " + p.getCantidad() + ",cancelado=" + p.isCancelado() + " where id = " + p.getId();
            try {
                jdbcTemplate.update(query);
                resultado.put("respuesta", "Producto actualizado");
            } catch (Exception e) {
                resultado.put("respuesta", "Error al actualizar el producto");

            }
        }

        return resultado;
    }

    public Object eliminarDetalleTicket(String id) {
        String query = "delete from detalle_ticket where id = " + id;
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query);
            resultado.put("respuesta", "Producto eliminado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al eliminar el producto");

        }

        return resultado;
    }

    public Object getCanceladosTickets(String id_sucursal, String fecha) {

        String query = "select * from historico_tickets where id_sucursal=" + id_sucursal + "   and fecha = '" + fecha + "' order by id_ticket desc;";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;
    }

    public Object getMesasTickets(int idSucursal, int id_mesero) {

        String query = "";

        if (id_mesero == 0) {
            query = String.format("select id_ticket,nombre,id_mesa from tickets where  id_sucursal = %1$s order by id_ticket asc", idSucursal);
        } else {
            query = String.format("select id_ticket,nombre,id_mesa from tickets where id_user = %1$s and id_sucursal = %2$s order by id_ticket asc", id_mesero, idSucursal);
        }

        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;
    }

    public Object GetDesgloseCajaEspecial(int id_sucursal, String fecha) {
        String query = "SELECT id_ticket,id_folio,total,tipo_pago FROM historico_tickets where id_sucursal=" + id_sucursal + "and fecha='" + fecha + "' and cancelado <> 't'";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;
    }

    public Object CierraCorteEspecial(Tickets p) {

        Map<String, Object> resultado = new HashMap<String, Object>();
        String conjunto = p.getCancelados();
        String nuevo = conjunto.replace(",undefined", "");

        String query = "INSERT INTO historico_corte_especial  ( SELECT * FROM historico_tickets where id_ticket not in (" + nuevo + ") and id_sucursal=" + p.getId_sucursal() + " and fecha='" + p.getFechainserta() + "' and cancelado <> 't')";
        try {
            jdbcTemplate.update(query);

            resultado.put("respuesta", "Producto eliminado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al eliminar el producto");

            return null;

        }

        String query1 = "select min(id_folio) as minimo,count(id_folio) as numero ,min(secuencia) as mintcik from historico_corte_especial where fecha='" + p.getFechainserta() + "' and id_sucursal=" + p.getId_sucursal();
        Map<String, Object> min = jdbcTemplate.queryForMap(query1);
        String inicial = min.get("minimo").toString();
        String numero = min.get("numero").toString();
        String id_ticket = min.get("mintcik").toString();
        int consecutivo_folio = Integer.parseInt(id_ticket);

        for (int contador = 0; contador < Integer.parseInt(numero); contador++) {
            String query3 = "update historico_corte_especial set id_folio=" + inicial + " + " + contador + " where secuencia =" + consecutivo_folio + " and id_sucursal=" + p.getId_sucursal();
            consecutivo_folio++;
            jdbcTemplate.update(query3);
        }

        return resultado;
    }

    public Object cambiarMeseroTicket(int id_ticket, int id_mesero) {
        String query = "update tickets set id_user = %1$s where id_ticket = %2$s";
        query = String.format(query, id_mesero, id_ticket);
        jdbcTemplate.update(query);
        Map<String, Object> resultado = new HashMap<String, Object>();
        resultado.put("respuesta", "Registro actualizado con exito");
        return resultado;
    }

    public Object cambiarMesaTicket(Tickets obj, boolean unir) {

        String query = "select id_mesa,id_sucursal from tickets where id_ticket = " + obj.getIdTicket();
        Map<String, Object> diccionario = jdbcTemplate.queryForMap(query);
        String id_mesa = String.valueOf(diccionario.get("id_mesa"));
        String id_sucursal = String.valueOf(diccionario.get("id_sucursal"));
        query = "update mesas set ocupada = false,mesafusionada = null where id_mesa = " + id_mesa;
        jdbcTemplate.update(query);
        query = " update mesas set ocupada = false,mesafusionada = null where mesafusionada = %1$s and id_sucursal = %2$s ";
        query = String.format(query, id_mesa, id_sucursal);
        this.jdbcTemplate.update(query);
        if (!unir) {
            query = "update mesas set ocupada = true where id_mesa = " + obj.getIdMesa();
            jdbcTemplate.update(query);
            query = "update tickets set id_mesa = %1$s,nombre = '%2$s' where id_ticket = " + obj.getIdTicket();
            query = String.format(query, obj.getIdMesa(), obj.getNombre());
            jdbcTemplate.update(query);
        } else {

        }
        Map<String, Object> resultado = new HashMap<String, Object>();
        resultado.put("respuesta", "Mesa cambiada correctamente");
        return resultado;
    }

    public Object aplicandoDescuentos(Tickets obj) {
        String query = "update tickets set cortesia = " + obj.getCortesia();

        if (obj.getCortesia() == 1 || obj.getCortesia() == 2) {
            query += " , efectivo_porcentaje = %1$s where id_ticket = " + obj.getIdTicket();
            query = String.format(query, obj.getEfectivo_porcentaje());
        } else {
            query += " , efectivo_porcentaje = null where id_ticket = " + obj.getIdTicket();;
        }

        Map<String, Object> resultado = new HashMap<String, Object>();
        resultado.put("respuesta", "Porcentaje aplicado");
        jdbcTemplate.update(query);
        return resultado;
    }
    

}
