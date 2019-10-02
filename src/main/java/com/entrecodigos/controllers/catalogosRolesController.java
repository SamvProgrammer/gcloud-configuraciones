/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.controllers;

import com.entrecodigos.daoimp.rolesDaoImp;
import com.entrecodigos.repositorios.roles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author samv
 */

@RestController
@RequestMapping("/catalogos")
public class catalogosRolesController {
    @Autowired
    @Qualifier("rolesDao")
    private rolesDaoImp obj;
    
    @GetMapping("/roles")
    public Object gets(){
      return obj.gets();
    }
    
    @PostMapping("/roles")
    public Object insertar(@RequestBody roles p){    
        return obj.insertar(p);
    }
    
    
    @PutMapping("/roles")
    public Object actualizar(@RequestBody roles p){
      return obj.actualizar(p);
    }
    
    @DeleteMapping("/roles/{identificador}")
    public Object eliminar(@PathVariable("identificador") int id_rol){
        return obj.eliminar(id_rol);
    }
}
