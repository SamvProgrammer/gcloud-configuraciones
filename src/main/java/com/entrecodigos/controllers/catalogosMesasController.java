/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.controllers;

import com.entrecodigos.daoimp.mesasDaoImp;
import com.entrecodigos.repositorios.mesas;
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
public class catalogosMesasController {

    @Autowired
    @Qualifier("objMesasDao")
    private mesasDaoImp obj;

    @GetMapping("/mesas/{identificador}")
    public Object gets(@PathVariable("identificador") String id) {
      return   obj.gets(id);
    }
    @GetMapping("/mesas/{identificador}/activos/{activo}")
    public Object gets(@PathVariable("identificador") String id,@PathVariable("activo") boolean activo) {
      return   obj.gets(id,activo);
    }
    
    @GetMapping("/mesas/{identificador}/activos/resumido/{offset}")
    public Object getsResumidos(@PathVariable("identificador") String id,@PathVariable("offset")String off) {
      return   obj.getsResumidos(id,off);
    }
    
    @GetMapping("/mesas/{identificador}/activos/{activo}/usuario/{id_usuario}")
    public Object gets(@PathVariable("identificador") String id,@PathVariable("activo") boolean activo,@PathVariable("id_usuario") int id_usuario) {
      return   obj.gets(id,activo,id_usuario);
    }
    
    @GetMapping("/sucursal/{id_sucursal}/mesa/{id_mesa}")
    public Object getEspecifico(@PathVariable("id_sucursal")String id_sucursal,@PathVariable("id_mesa")String id_mesa) {
      return   obj.getEspecifico(id_sucursal,id_mesa);
    }

    @PostMapping("/mesas")
    public Object insertar(@RequestBody mesas p) {
        return obj.insertar(p);
    }

    @PutMapping("/mesas")
    public Object actualizar(@RequestBody mesas p) {
        return obj.actualizar(p);
    }

    
    @DeleteMapping("/mesas/{id_sucursal}/{id_mesa}")
    public Object eliminar(@PathVariable("id_sucursal")String id_sucursal,@PathVariable("id_mesa")String id_mesa) {
        return obj.eliminar(id_sucursal,id_mesa);
    }
}
