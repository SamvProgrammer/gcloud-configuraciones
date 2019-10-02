/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import com.entrecodigos.repositorios.Productos;
import com.entrecodigos.repositorios.insumos;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author i7
 */
@Transactional
@Component("objInsumos")
public class InsumosDaoImp {
    
    @Autowired
    JdbcTemplate jdbcTemplate;

    public Object getInsumo(String id_producto) {
        String query = "select insumos.cantidad,inventario.descripcion,insumos.id_inventario,insumos.id_producto from insumos inner join inventario on insumos.id_inventario = inventario.id_inventario where insumos.id_producto=" + id_producto;
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;
    }

    public Object DeleteInsumo(Integer id_inventario, Integer id_producto) {
        String query = "delete from insumos where id_inventario='" + id_inventario + "' and id_producto=" + id_producto + "";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query);
            resultado.put("respuesta", "Registro Eliminado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al eliminar registro");
        }
        return resultado;
    }

    public Object InsertaInsumo(Productos p) {
        
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            String query = " delete from insumos where id_producto = "+p.getId_producto();
            jdbcTemplate.update(query);
            List<insumos> arreglo = p.getInsumos();
            for(insumos item : arreglo){
            query = "insert into insumos (id_inventario,cantidad,id_producto) values (?,?,?)";
            jdbcTemplate.update(query, new Object[]{item.getId_inventario(), item.getCantidad(), item.getId_producto()});
            }
            resultado.put("respuesta", "Registro insertado");

        } catch (Exception e) {
            resultado.put("respuesta", "Error al insertar");
        }

        return resultado;
    }


   
    public Object CalculaInsumos(Integer cantidad, Integer id_producto){
        String query ="SELECT (a1.cantidad *"+cantidad+") AS cantidad, a2.unidad_medida, a2.descripcion FROM	insumos a1 JOIN inventario a2 ON a1.id_inventario=a2.id_inventario WHERE a1.id_producto ="+id_producto;
        List<Map<String,Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;
    }
            
}
