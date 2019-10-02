/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.entrecodigos.repositorios.Key;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *
 * @author i7
 */
@Transactional
@Component("objkey")
public class KeyDaoImp {
    
    @ Autowired
    JdbcTemplate jdbctemplate;
    
    public Object getKey(){
        String query="select password from key";
        List<Map<String, Object>> resultado = jdbctemplate.queryForList(query);
         

        return resultado;
    }
    
    public Object ActualizaKey() throws InterruptedException{
        String query="UPDATE 	public.key SET password =   substr(md5(random()::text), 0, 7) ";
        Map<String,Object> resultado=  new HashMap<String,Object>();
        Thread.sleep(32000);
          jdbctemplate.update(query);
          resultado.put("respuesta","hecho");
           return resultado;

    }
}
