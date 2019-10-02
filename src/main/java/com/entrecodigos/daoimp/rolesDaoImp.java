/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import com.entrecodigos.repositorios.roles;
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
@Component("rolesDao")
public class rolesDaoImp {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public Object gets() {
        String query = "select * from roles";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;
    }

    public Object insertar(roles p) {

        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            String query = "insert into roles(rol,descripcion) values(?,?)";
            jdbcTemplate.update(query, new Object[]{p.getRol(), p.getDescripcion()});
            resultado.put("respuesta", "Registro insertado");

        } catch (Exception e) {
            resultado.put("respuesta", "Error al insertar");
        }

        return resultado;

    }

    public Object actualizar(roles p) {

        String query = "update roles set descripcion = '"+p.getDescripcion()+"',rol = '"+p.getRol()+"' where id = "+p.getId()+"";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query);
            resultado.put("respuesta", "Registro Actualizado");
        } catch (Exception e) {
            resultado.put("respuesta", "Registro  No Actualizado");

        }

        return resultado;
    }

    public Object eliminar(int rol) {
        String query = "delete from roles where id = ?";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query,new Object[]{rol});
            resultado.put("respuesta", "Registro Eliminado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al eliminar registro");
        }
        return resultado;
    }

}
