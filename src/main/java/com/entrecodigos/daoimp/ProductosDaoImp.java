/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import com.entrecodigos.funciones.archivos;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.entrecodigos.repositorios.Productos;
import com.entrecodigos.repositorios.subcategoria;
import java.awt.image.BufferedImage;
import java.util.ArrayList;

/**
 *
 * @author i7
 */
@Transactional
@Component("objProductos")
public class ProductosDaoImp {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public Object getProductos() {
        String query = "select p.*,c.nombre AS nombre_categoria from productos p inner join categoria c on c.id = p.id_categoria";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;

    }

    public Object seleccionaProducto(String id) {
        Object resultado;
        try {
            int idInt = Integer.parseInt(id);
            String query = " select * from productos where id_categoria=? order by id_producto asc ";
            resultado = jdbcTemplate.queryForList(query, new Object[]{idInt});
        } catch (Exception e) {
            Map<String, Object> mensaje = new HashMap<String, Object>();
            mensaje.put("respuesta", "Valor no encontrado en la base de datos");
            resultado = mensaje;
        }
        return resultado;
    }

    public Object elimnarProducto(String id_producto) {
        String query = "delete from productos where id_producto=" + id_producto;
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query);
            resultado.put("respuesta", "Registro Eliminado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al eliminar registro");
        }
        return resultado;
    }

    public Object ActualizaProducto(Productos p) {
        String query = "update productos set nombre=? , descripcion=? , precio=? , id_categoria=?,id_video=?,nombre_video=?,notificacion=? where id_producto=?";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            creacionArchivo(p);
            jdbcTemplate.update(query, new Object[]{p.getNombre(), p.getDescripcion(), p.getPrecio(), p.getId_categoria(), p.getId_video(), p.getNombre_video(), p.getNotificacion(), p.getId_producto()});
            resultado.put("respuesta", "Registro Actualizado");
        } catch (Exception e) {
            resultado.put("respuesta", "Registro  No Actualizado");

        }

        return resultado;
    }

    public Object InsertarProducto(Productos p) {
        String query = "Insert into productos (nombre,descripcion,precio,id_categoria,id_video,nombre_video,notificacion,subcategoria) values (?,?,?,?,?,?,?,?) returning id_producto";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {

            Map<String, Object> aux = jdbcTemplate.queryForMap(query, new Object[]{p.getNombre(), p.getDescripcion(), p.getPrecio(), p.getId_categoria(), p.getId_video(), p.getNombre_video(), p.getNotificacion(), p.getSubcategoria()});
            p.setId_producto(Integer.parseInt(String.valueOf(aux.get("id_producto"))));
            creacionArchivo(p);
            resultado.put("respuesta", "Registro insertado");

        } catch (Exception e) {
            resultado.put("respuesta", "Error al insertar");
        }

        return resultado;
    }

    public Object seleccionarListaPorCategorias() {
        String query = "select * from categoria order by id";
        List<Map<String, Object>> resultado = this.jdbcTemplate.queryForList(query);

        for (Map<String, Object> item : resultado) {
            boolean submenu = Boolean.valueOf(String.valueOf(item.get("submenu")));
            if (submenu) {
                query = "select * from subcategoria where id_categoria = " + item.get("id") + " order by id_subcategoria,id ";
                List<Map<String, Object>> resultadoSub = jdbcTemplate.queryForList(query);

                resultadoSub = resultadosMapeo(resultadoSub);

                resultadoSub = agregarProductos(resultadoSub, item.get("id").toString());

                item.put("submenu_array", resultadoSub);

            } else {
                query = "select * from productos where id_categoria = " + item.get("id").toString() + " order by id_producto asc";
                List<Map<String, Object>> productos = this.jdbcTemplate.queryForList(query);
                item.put("productos", productos);
            }
        }

        return resultado;
    }

    public List<Map<String, Object>> agregarProductos(List<Map<String, Object>> lista, String id_categoria) {

        String query = "";
        for (Map<String, Object> item : lista) {
            boolean submenu = Boolean.valueOf(String.valueOf(item.get("submenu")));
            if (submenu) {
                
                item.put("submenu_array", this.agregarProductos((List<Map<String, Object>> )item.get("submenu_array"), id_categoria));
                
            } else {
                    String id_subcategoria = String.valueOf(item.get("id_subcategoria"));

                    query = "select * from productos where id_categoria = " + id_categoria + "  and subcategoria = '%1$s' order by id_producto asc";
                    query = String.format(query, item.get("id").toString());
                    List<Map<String, Object>> productos = this.jdbcTemplate.queryForList(query);
                    item.put("productos", productos);
                
            }
        }
        return lista;
    }

    public List<Map<String, Object>> resultadosMapeo(List<Map<String, Object>> lista) {

        String primeroStr = "";
        String primeroStrenlazado = "";
        boolean primeroBool = false;
        boolean conquery = false;

        List<Map<String, Object>> borrar = (List<Map<String, Object>>) new ArrayList<Map<String, Object>>();

        Map<String, Object> SubcategoriaObtenida = null;

        for (int x = 0; x < lista.size(); x++) {
            Map<String, Object> item = lista.get(x);

            String id = String.valueOf(item.get("submenu_enlazado"));
            if (id != "null") {
                String id_categoria = String.valueOf(item.get("id_categoria"));
                String id_subcategoria = String.valueOf(item.get("id_subcategoria"));

                String auxid_cate_sub = id_categoria + id_subcategoria;
                String aux_idEnlazado_cate_sub = id_categoria + id_subcategoria + id;

                if (!primeroBool) {
                    primeroStr = auxid_cate_sub;
                    primeroStrenlazado = aux_idEnlazado_cate_sub;
                    primeroBool = true;
                }
                boolean esTrue = true;
                while (esTrue) {
                    if (primeroStr.equals(auxid_cate_sub)) {

                        if (primeroStrenlazado.equals(aux_idEnlazado_cate_sub)) {
                            if (!conquery) {
                                String query = "select * from subcategoria where id_categoria = %1$s and id_subcategoria = %2$s and submenu_enlazado = %3$s order by id";
                                query = String.format(query, id_categoria, id_subcategoria, id);

                                List<Map<String, Object>> listaSubCategorias = jdbcTemplate.queryForList(query);
                                conquery = true;

                                for (Map<String, Object> aa : listaSubCategorias) {
                                    aa.put("submenu", false);
                                    aa.remove("submenu_enlazado");
                                }

                                for (Map<String, Object> iaux : lista) {
                                    String idiaux = String.valueOf(iaux.get("id"));
                                    if (idiaux.equals(id)) {
                                        iaux.put("submenu_array", listaSubCategorias);
                                        iaux.put("submenu", true);
                                        iaux.remove("submenu_enlazado");
                                        borrar.add(item);
                                        SubcategoriaObtenida = iaux;
                                        break;
                                    }
                                }

                            } else {
                                borrar.add(item);
                            }
                        } else {

                            List<Map<String, Object>> array = (List<Map<String, Object>>) SubcategoriaObtenida.get("submenu_array");
                            array.add(item);
                            array.get(0).put("submenu_enlazado", null);
                            SubcategoriaObtenida.put("submenu_array", resultadosMapeo(array));
                            primeroStrenlazado = aux_idEnlazado_cate_sub;
                        }
                        esTrue = false;
                    } else {
                        primeroStr = auxid_cate_sub;
                        primeroStrenlazado = aux_idEnlazado_cate_sub;
                        conquery = false;
                    }
                }
            } else {
                item.put("submenu", false);
                item.remove("submenu_enlazado");
                conquery = false;
            }

            String variable = "";
        }

        for (Map<String, Object> item : borrar) {
            lista.remove(item);
        }
        return lista;
    }

    private void creacionArchivo(Productos p) {
        if (p.isSubirImagen()) {
            String query = String.format("update productos set ruta_imagen='%1$s' where id_producto=" + p.getId_producto(), p.getImagen());
            this.jdbcTemplate.update(query);
            archivos a = new archivos();
            BufferedImage img = a.decodificarImagenBase64(p.getImagen());
            //a.escribirArchivo(img,p.getId_producto());
        }
    }

    public Object seleccionaProductoSubcategoria(String id, String id_categoria) {
        Object resultado;
        try {
            int idInt = Integer.parseInt(id);
            String query = " select * from productos where id_categoria=%1$s and subcategoria = '%2$s'  order by id_producto asc ";
            query = String.format(query, id, id_categoria);
            resultado = jdbcTemplate.queryForList(query);
        } catch (Exception e) {
            Map<String, Object> mensaje = new HashMap<String, Object>();
            mensaje.put("respuesta", "Valor no encontrado en la base de datos");
            resultado = mensaje;
        }
        return resultado;
    }
}
