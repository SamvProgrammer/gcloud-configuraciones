/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.controllers;

import com.entrecodigos.daoimp.sucursalesImp;
import com.entrecodigos.repositorios.sucursales;
import com.entrecodigos.repositorios.users;
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
public class catalogoSucursalesController {

    @Autowired
    @Qualifier("objSucursalesDao")
    private sucursalesImp obj;

    @GetMapping("/sucursales")
    public Object getSucursal() {
        return obj.getSucursal();
    }

    @GetMapping("/sucursales/{identificador}")
    public Object getSucursalUnico(@PathVariable("identificador") String id) {
        return obj.getSucursalEspecifico(id);
    }

    @DeleteMapping("/sucursales/{identificador}")
    public Object eliminarSucursal(@PathVariable("identificador") String id) {
        return obj.eliminarSucursal(id);
    }

    @PutMapping("/sucursales")
    public Object actualizarSucursal(@RequestBody sucursales p) {
        return obj.actualizarSucursal(p);

    }

    @PostMapping("/sucursales")
    public Object insertarSucursal(@RequestBody sucursales p) {
        return obj.insertarSucursal(p);

    }

}
