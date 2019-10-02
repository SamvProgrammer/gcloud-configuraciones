/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import com.entrecodigos.repositorios.Inventarios;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.ldap.HasControls;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component("objInventarios")
public class InventariosDaoImp {

    @Autowired
    JdbcTemplate jdbctemplate;

    public Object getInventario() {
        String query = "select * from inventario order by categoria";
        List<Map<String, Object>> resultado = jdbctemplate.queryForList(query);
        return resultado;
    }

    public Object getHistorial(String id_inventario) {
        Object resultado;
        try {
            String query = "SELECT *,a1.cantidad as cantidad_historial FROM control_movimientos a1 LEFT JOIN inventario a2 ON a1.id_inventario = a2.id_inventario WHERE a1.id_inventario =" + id_inventario + "  ORDER BY 	a1.id_control;";
            resultado = jdbctemplate.queryForList(query);
        } catch (Exception e) {
            Map<String, Object> mensaje = new HashMap<String, Object>();
            mensaje.put("respuesta", "Valor no encontrado en la base de datos");
            resultado = mensaje;
        }
        return resultado;
    }

    public Object getInventarioespecifico(String descripcion) {
        Object resultado;
        try {
            String query = "SELECT * FROM inventario where descripcion like '" + descripcion + "%'";
            resultado = jdbctemplate.queryForList(query);
        } catch (Exception e) {
            Map<String, Object> mensaje = new HashMap<String, Object>();
            mensaje.put("respuesta", "Valor no encontrado en la base de datos");
            resultado = mensaje;
        }
        return resultado;
    }

    public Object DeleteInventario(Integer id) {
        String query = "delete from inventario where id_inventario=" + id;
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbctemplate.update(query);
            resultado.put("respuesta", "Registro Eliminado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al eliminar registro");
        }
        return resultado;
    }

    public Object ActualizarInventario(Inventarios p) {
        String query = "update inventario set cantidad=?,unidad_medida=?,descripcion=?,proveedor=?,minimo=?,marca=?,categoria=?, ubicacion=? where id_inventario=?";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbctemplate.update(query, new Object[]{p.getCantidad(), p.getUnidad_medida(), p.getDescripcion(), p.getProveedor(), p.getMinimo(), p.getMarca(), p.getCategoria(), p.getUbicacion(), p.getId_inventario()});
            resultado.put("respuesta", "Registro Actualizado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al actualizar registro");

        }
        return resultado;

    }

    public Object InsertaInventario(Inventarios p) {
        Object resultado1;
        String query = "Insert into inventario(cantidad,unidad_medida,descripcion,proveedor,minimo,categoria,marca,ubicacion,id_sucursal) values (" + p.getCantidad() + ",'" + p.getUnidad_medida() + "','" + p.getDescripcion() + "','" + p.getProveedor() + "'," + p.getMinimo() + ",'" + p.getCategoria() + "','" + p.getMarca() + "','" + p.getUbicacion() + "','" + p.getId_sucursal() + "')";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbctemplate.update(query);
            String query1 = "SELECT id_inventario FROM inventario where descripcion='"+p.getDescripcion()+"'";
            Map<String, Object> nuevo = jdbctemplate.queryForMap(query1);
            String id = nuevo.get("id_inventario").toString();
            String query3 = "INSERT INTO control_movimientos (cantidad,tipo_mov,id_inventario,ubicacion,id_sucursal,fecha,id_usuario) values (" + p.getCantidad() + ",'#'," + id + ",'" + p.getUbicacion() + "'," + p.getId_sucursal() + ",(current_timestamp AT TIME ZONE 'America/Mexico_City')," + p.getId_usuario() + ");";
            jdbctemplate.update(query3);

            resultado.put("respuesta", "Registro Insertado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al Insertar");
        }
        return resultado;
    }

    public Object AjusteMovimiento(Inventarios p) {

        String query = "update  inventario set cantidad=cantidad" + p.getTipo_mov() + p.getCantidad() + " where id_inventario=" + p.getId_inventario() + " and ubicacion='" + p.getUbicacion() + "';";

        Map<String, Object> resultado = new HashMap<String, Object>();

        String query1 = "INSERT INTO control_movimientos (cantidad,tipo_mov,id_inventario,ubicacion,id_sucursal,fecha,id_usuario,observaciones) values (" + p.getCantidad() + ",'" + p.getTipo_mov() + "'," + p.getId_inventario() + ",'" + p.getUbicacion() + "'," + p.getId_sucursal() + ",(current_timestamp AT TIME ZONE 'America/Mexico_City')," + p.getId_usuario() + ",'"+p.getObservaciones()+"');";

        try {
            jdbctemplate.update(query);
            jdbctemplate.update(query1);
            resultado.put("respuesta", "Registro Insertado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al Insertar");
        }
        return resultado;
    }
}
