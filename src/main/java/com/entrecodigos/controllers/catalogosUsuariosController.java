/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.controllers;

import com.entrecodigos.daoimp.usuariosDaoImp;
import com.entrecodigos.repositorios.users;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.CrossOrigin;
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
public class catalogosUsuariosController {

    @Autowired
    @Qualifier("objUsuariosDao")
    private usuariosDaoImp objUsuarios;

    @GetMapping("/usuarios")
    public Object getUsuarios() {
        return objUsuarios.getUsuarios();
    }

    @GetMapping("/usuarios/{identificador}")
    public Object getUsuarioEspecifico(@PathVariable("identificador") String id) {
        return objUsuarios.getUsuarioEspecifico(id);
    }
    
    @GetMapping("/usuarios/buscarusuario/{identificador}")
    public Object getUsuarioEspecificoUusario(@PathVariable("identificador") String usuario) {
        return objUsuarios.getUsuarioEspecifico(usuario);
    }

    @DeleteMapping("/usuarios/{identificador}")
    public Object eliminarUsuario(@PathVariable("identificador") String id) {
        return objUsuarios.eliminar(id);
    }

    @PostMapping("/usuarios")
    public Object insertarUsuarios(@RequestBody users p) {
        return objUsuarios.insertar(p);
    }

    @PutMapping("/usuarios")
    public Object actualizaUsuarios(@RequestBody users algo) {

        return objUsuarios.actualiza(algo);
    }
    
    
    @PostMapping("/usuarios/login")
    public Object login(@RequestBody users p){
       return objUsuarios.login(p);
    }
    
    @GetMapping("/usuarios/lista/{id_sucursal}")
    public Object getUsuariosCambiar(@PathVariable("id_sucursal")String id_sucursal){
      return objUsuarios.getUsuariosCambiar(id_sucursal);
    }
    
    
    @GetMapping("/usuarios/reactivando")
    public Object reactivando(){
        Map<String,Object> respuesta = new HashMap<String,Object>();
        respuesta.put("respuesta","Servicio reactivado");
        return respuesta;
    }
}
