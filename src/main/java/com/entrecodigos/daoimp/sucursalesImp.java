/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import com.entrecodigos.repositorios.sucursales;
import com.entrecodigos.repositorios.users;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author samv
 */
@Transactional
@Component("objSucursalesDao")
public class sucursalesImp {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public Object getSucursal() {
        String query = "select * from sucursales";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;
    }

    public Object getSucursalEspecifico(String id) {
        Object resultado;
        try {
            int idInt = Integer.parseInt(id);
            String query = "select * from sucursales where id=?";
            resultado = jdbcTemplate.queryForMap(query, new Object[]{idInt});
        } catch (Exception e) {
            Map<String, Object> mensaje = new HashMap<String, Object>();
            mensaje.put("respuesta", "Valor no encontrado en la base de datos");
            resultado = mensaje;
        }
        return resultado;
    }

    public Object eliminarSucursal(String id) {
        String query = "delete from sucursales where id = " + id;
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query);
            resultado.put("respuesta", "Registro Eliminado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al eliminar registro");
        }
        return resultado;
    }

    public Object insertarSucursal(sucursales p) {
        String query = "insert into sucursales (direccion,nombre) values (?,?)";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query, new Object[]{p.getDireccion(), p.getNombre()});
            resultado.put("respuesta", "Registro insertado");

        } catch (Exception e) {
            resultado.put("respuesta", "Error al insertar");
        }

        return resultado;
    }

    public Object actualizarSucursal(sucursales p) {
        String query = "update sucursales set direccion=?,nombre=? where id=?";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query, new Object[]{p.getDireccion(), p.getNombre(), p.getId()});
            resultado.put("respuesta", "Registro Actualizado");
        } catch (Exception e) {
            resultado.put("respuesta", "Registro  No Actualizado");

        }

        return resultado;
    }
}
