/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.controllers;

import com.entrecodigos.daoimp.ProductosDaoImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;
import com.entrecodigos.repositorios.Productos;
import org.springframework.web.bind.annotation.PostMapping;

@RestController
@RequestMapping("/catalogos")
public class catalogosProductosController {

    @Autowired
    @Qualifier("objProductos")
    private ProductosDaoImp obj;

    @GetMapping("/productos")
    public Object getProductos() {
        return obj.getProductos();
    }

    @DeleteMapping("/productos/{identificador}")
    public Object eliminarProducto(@PathVariable("identificador") String id) {
        return obj.elimnarProducto(id);
    }

    @PutMapping("/productos")
    public Object Actualiza(@RequestBody Productos p) {
        return obj.ActualizaProducto(p);

    }

    @PostMapping("/productos")
    public Object Inserta(@RequestBody Productos p) {
        return obj.InsertarProducto(p);
    }

    @GetMapping("/productos/categoria/{id}")
    public Object seleccionaProducto(@PathVariable("id") String id) {
        return obj.seleccionaProducto(id);
    }
    
    @GetMapping("/productos/categoria/{id}/subcategoria/{id_sub}")
    public Object seleccionaProducto(@PathVariable("id") String id,@PathVariable("id_sub") String id_categoria) {
        return obj.seleccionaProductoSubcategoria(id,id_categoria);
    }

    @GetMapping("/productos/lista/categorias")
    public Object seleccionarListaPorCategorias() {
        return obj.seleccionarListaPorCategorias();
    }
}
