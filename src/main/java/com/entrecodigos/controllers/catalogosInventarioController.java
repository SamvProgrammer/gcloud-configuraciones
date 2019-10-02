/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.controllers;

import com.entrecodigos.daoimp.InventariosDaoImp;
import com.entrecodigos.repositorios.Inventarios;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
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
 * @author sistemas
 */
@RestController
@RequestMapping("/catalogos")

public class catalogosInventarioController {

    @Autowired
    @Qualifier("objInventarios")

    private InventariosDaoImp obj;

    @GetMapping("/inventarios")
    public Object getInventario() {
        return obj.getInventario();

    }

    @GetMapping("/inventarios/{descripcion}")
    public Object getInventarioEspecifico(@PathVariable ("descripcion") String descripcion) {
        return obj.getInventarioespecifico(descripcion);
    }
    
    @GetMapping("/inventarios/historial/{id_inventario}")
    public Object getHistorial(@PathVariable ("id_inventario") String id_inventario){
        return obj.getHistorial(id_inventario);
    }

    @DeleteMapping("/inventarios/{identificador}")
    public Object DeleteInventario(@PathVariable("identificador") Integer identificador) {
        return obj.DeleteInventario(identificador);
    }

    @PutMapping("/inventarios")
    public Object ActualizaInventario(@RequestBody Inventarios p) {
        return obj.ActualizarInventario(p);
    }
    
    @PostMapping("/inventarios")
    public Object InsertaInventario(@RequestBody Inventarios p){
        return obj.InsertaInventario(p);
    }
    
    @PutMapping("inventariosajustes")
    public Object AjusteMovimiento (@RequestBody Inventarios p){
        return obj.AjusteMovimiento(p);
    }
}
