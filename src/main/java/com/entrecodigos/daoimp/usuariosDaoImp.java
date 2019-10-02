/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import com.entrecodigos.repositorios.submenu;
import com.entrecodigos.repositorios.users;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author samv
 */
@Transactional
@Component("objUsuariosDao")
public class usuariosDaoImp {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public Object getUsuarios() {
        String query = "SELECT * FROM USERS";
        List<Map<String, Object>> resultado = jdbcTemplate.queryForList(query);
        return resultado;
    }

    public Object getUsuarioEspecifico(String login) {
        Object resultado;
        try {
            String query = "SELECT * FROM USERS where login=?";
            resultado = jdbcTemplate.queryForMap(query, new Object[]{login});
        } catch (Exception e) {
            Map<String, Object> mensaje = new HashMap<String, Object>();
            mensaje.put("respuesta", "Valor no encontrado en la base de datos");
            resultado = mensaje;
        }
        return resultado;
    }

    public Object eliminar(String login) {
        String query = "delete from users where login = ?";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            jdbcTemplate.update(query, new Object[]{login});
            resultado.put("respuesta", "Registro Eliminado");
        } catch (Exception e) {
            resultado.put("respuesta", "Error al eliminar registro");
        }
        return resultado;
    }

    public Object insertar(users p) {
        String query = "insert into users (login,nombre,id_rol,id_sucursal,password,menu,catalogos,bar,cocina,cuentas,transacciones,iniciar_en) values (?,?,?,?,?,?,?,?,?,?,?,?) returning id;";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            Map<String,Object> peticion =  jdbcTemplate.queryForMap(query, new Object[]{p.getLogin(), p.getNombre(), p.getIdRol(), p.getIdSucursal(), p.getPassword(),p.isMenu(),p.isCatalogos(),p.isBar(),p.isCocina(),p.isCuentas(),p.isTransacciones(),p.getIniciarEn()});
            int id = Integer.parseInt(String.valueOf(peticion.get("id")));
            
            List<submenu> submenu = p.getSubmenu();
            query = "update users set ";
            for(submenu item : submenu){
                String nombre = item.getNombre();
                boolean activo = item.isActivo();
                
                nombre = nombre.toLowerCase();
                nombre = nombre.replace(" ", "_");
                
                query += nombre + " = " + activo + ",";            
            }
            
            query = query.substring(0,query.length()-1);
            
            query += " where id = "+id;
            
            jdbcTemplate.update(query);
            
            resultado.put("respuesta", "Registro insertado");

        } catch (Exception e) {
            resultado.put("respuesta", "Error al insertar");
        }

        return resultado;
    }

    public Object actualiza(users algo) {
        String query = "update users set nombre=?,id_rol=?,id_sucursal=?,password=?,menu=?,catalogos=?,bar=?,cocina=?,cuentas=?,transacciones=?,iniciar_en=? where login=? returning id";
        Map<String, Object> resultado = new HashMap<String, Object>();
        try {
            Map<String,Object> resultadoAux =  jdbcTemplate.queryForMap(query, new Object[]{algo.getNombre(), algo.getIdRol(), algo.getIdSucursal(), algo.getPassword(),
                 algo.isMenu(),algo.isCatalogos(),algo.isBar(),algo.isCocina(),algo.isCuentas(),algo.isTransacciones(),algo.getIniciarEn(), algo.getLogin()});
            
            int identificador = Integer.parseInt(String.valueOf(resultadoAux.get("id")));
            
            List<submenu> submenu = algo.getSubmenu();
            query = "update users set ";
            for(submenu item : submenu){
                String nombre = item.getNombre();
                boolean activo = item.isActivo();
                
                nombre = nombre.toLowerCase();
                nombre = nombre.replace(" ", "_");
                
                query += nombre + " = " + activo + ",";            
            }
            
            query = query.substring(0,query.length()-1);
            
            query += " where id = "+identificador;
            
            jdbcTemplate.update(query);
            
            resultado.put("respuesta", "Registro Actualizado");
        } catch (Exception e) {
            resultado.put("respuesta", "Registro  No Actualizado");

        }

        return resultado;
    }

    public Object login(users p) {
        String query = "select * from users where login = '"+p.getLogin()+"' and id_sucursal = "+p.getIdSucursal();
        Map<String, Object> resultado = new HashMap<String, Object>();        
        try{
           
            
            Map<String,Object> respuesta = this.jdbcTemplate.queryForMap(query);            
            
            String password = respuesta.get("password").toString();
            
            if(p.getPassword().equalsIgnoreCase(password)){
                resultado = respuesta;
                resultado.put("entrar", true);
            }else{
                resultado.put("entrar", false);
            }     
           
        }catch(Exception e){
              resultado.put("entrar", false);
        }
        
        return resultado;
    }

    public Object getUsuariosCambiar(String id_sucursal) {
        String query = "select uus.id,uus.login,uus.id_rol,rrl.rol from users uus inner join roles rrl on rrl.id = uus.id_rol where id_sucursal = %1$s order by uus.id";
        query = String.format(query,id_sucursal);
        return jdbcTemplate.queryForList(query);
    }
    
    
    
}
