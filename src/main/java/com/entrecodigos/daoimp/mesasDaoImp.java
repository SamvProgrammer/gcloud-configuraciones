/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import com.entrecodigos.repositorios.mesas;
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
@Component("objMesasDao")
public class mesasDaoImp {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public Object gets(String id) {
        int id_sucursal = Integer.parseInt(id);
        String query = "select * from mesas where id_sucursal = ? order by id_mesa";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query, new Object[]{id_sucursal});
        return resultado;
    }
    public Object gets(String id,boolean activo) {
        int id_sucursal = Integer.parseInt(id);
        String query = "select * from mesas where id_sucursal = ? and ocupada = ? order by id_mesa";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query, new Object[]{id_sucursal,activo});
        return resultado;
    }
    
        public Object gets(String id,boolean activo,int id_usuario) {
        int id_sucursal = Integer.parseInt(id);
        String query = "select mesas.* from tickets inner join mesas on mesas.id_mesa = tickets.id_mesa "+
                " where mesas.ocupada = ? and mesas.id_sucursal = ? and tickets.id_user = ? order by mesas.id_mesa ";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query, new Object[]{activo,id_sucursal,id_usuario});
        return resultado;
    }

    public Object getEspecifico(String id_sucursal, String id_mesa) {
        Object resultado;
        try {
            int idInt = Integer.parseInt(id_mesa);
            int idSucursal = Integer.parseInt(id_sucursal);
            String query = "SELECT * FROM mesas where id_mesa=? and id_sucursal = ?";
            resultado = jdbcTemplate.queryForMap(query, new Object[]{idInt, idSucursal});
        } catch (Exception e) {
            Map<String, Object> mensaje = new HashMap<String, Object>();
            mensaje.put("respuesta", "Valor no encontrado en la base de datos");
            resultado = mensaje;
        }
        return resultado;
    }

    public Object insertar(mesas p) {
        String query = "insert into mesas (id_mesa,id_tipo,id_sucursal,ocupada) values (?,?,?,false)";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query, new Object[]{p.getId_mesa(), p.getId_tipo(), p.getId_sucursal()});
            resultado.put("respuesta", "Registro insertado");

        } catch (Exception e) {
            resultado.put("respuesta", "Error al insertar");
        }

        return resultado;
    }

    public Object actualizar(mesas p) {
        String query = "update mesas set id_tipo=?,ocupada = ? where id_mesa=? and id_sucursal=?";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query, new Object[]{p.getId_tipo(),p.isOcupada(), p.getId_mesa(), p.getId_sucursal()});
            resultado.put("respuesta", "Registro Actualizado");
        } catch (Exception e) {
            resultado.put("respuesta", "Registro  No Actualizado");

        }

        return resultado;
    }

    public Object eliminar(String id_sucursal, String id_mesa) {
        String query = "delete from mesas where id_mesa = " + id_sucursal + " and id_sucursal = " + id_mesa;
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query);
            resultado.put("respuesta", "Registro Eliminado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al eliminar registro");
        }
        return resultado;
    }

    public Object getsResumidos(String id,String siguiente) {
        String query = "select id_mesa,id_tipo from mesas where id_sucursal = %1$s and ocupada = false order by id_mesa limit 20 offset "+siguiente;
        query = String.format(query,id);
        return jdbcTemplate.queryForList(query);
    }

}
