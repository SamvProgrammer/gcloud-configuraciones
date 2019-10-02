/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.controllers;

import com.entrecodigos.daoimp.cortecajaDaoImp;
import com.entrecodigos.repositorios.corteCaja;
import com.entrecodigos.repositorios.gastos;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author samv
 */
@RestController
@RequestMapping("/cortecaja")
public class corteCajaController {

    @Autowired
    @Qualifier("cortecajaDao")
    private cortecajaDaoImp obj;

    @GetMapping("/sucursal/{id_sucursal}/fechas")
    public Object totalCorte(@PathVariable("id_sucursal") int idsucursal, @RequestParam String fecha) throws ParseException {
        Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
        return this.obj.total(idsucursal, date1);
    }

    @GetMapping("/sucursal/{id_sucursal}/gastos/fechas")
    public Object getGastos(@PathVariable("id_sucursal") int idsucursal, @RequestParam String fecha) throws ParseException {
        Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
        return this.obj.getGastos(idsucursal, date1);
    }

    @GetMapping("/sucursal/{id_sucursal}/gastos")
    public Object getGastosSinCorte(@PathVariable("id_sucursal") int idsucursal) throws ParseException {

        return this.obj.getGastosSinCorte(idsucursal);
    }
    
     @GetMapping("/sucursal/{id_sucursal}/entradas")
    public Object getEntradasSinCorte(@PathVariable("id_sucursal") int idsucursal) throws ParseException {

        return this.obj.getEntradasSinCorte(idsucursal);
    }

    @GetMapping("/sucursal/{id_sucursal}/gastos/cortecaja/{id_corte}")
    public Object getGastosConCorte(@PathVariable("id_sucursal") int idsucursal, @PathVariable("id_corte") int id_corte) throws ParseException {

        return this.obj.getGastosConCorte(idsucursal, id_corte);
    }
    
    @GetMapping("/sucursal/{id_sucursal}/entradas/cortecaja/{id_corte}")
    public Object getEntradasConCorte(@PathVariable("id_sucursal") int idsucursal, @PathVariable("id_corte") int id_corte) throws ParseException {

        return this.obj.getEntradasConCorte(idsucursal, id_corte);
    }

    @PostMapping("/gastos")
    public Object setGastos(@RequestBody List<gastos> p) {
        return this.obj.setGastos(p);
    }
    
    @PostMapping("/entradas")
    public Object setEntradas(@RequestBody List<gastos> p) {
        return this.obj.setEntrada(p);
    }

    @PostMapping("/cortecaja")
    public Object insertarCorteCaja(@RequestBody corteCaja corte) {
        return this.obj.insertarCorteCaja(corte);
    }

    @GetMapping("/sucursal/{id_sucursal}/offset/{offset}")
    public Object getCortesCaja(@PathVariable("id_sucursal") int id_sucursal, @PathVariable("offset") int offset) {
        return this.obj.getCortesCaja(id_sucursal, offset);
    }

    @GetMapping("/sucursal/{id_sucursal}")
    public Object totalCorteSinCorte(@PathVariable("id_sucursal") int idsucursal) throws ParseException {

        return this.obj.getCorteCajaSinCorte(idsucursal);
    }

    @GetMapping("/sucursal/{id_sucursal}/cortecaja/{id_corte}")
    public Object totalCorteConCorte(@PathVariable("id_sucursal") int idsucursal, @PathVariable("id_corte") int id_corte) throws ParseException {

        return this.obj.getCorteCajaConCorte(idsucursal, id_corte);
    }

    @PostMapping("/realizar_corte")
    public Object realizarCorteCaja(@RequestBody corteCaja corte) {
        return obj.realizarCorteCaja(corte);
    }

}
