/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.controllers;

import com.entrecodigos.daoimp.TicketsDaoImp;
import com.entrecodigos.repositorios.Detalle_Tickets;
import com.entrecodigos.repositorios.Tickets;
import java.util.List;
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

@RestController
@RequestMapping("/catalogos")

public class catalogosTicketsController {

    @Autowired
    @Qualifier("objTicketsDao")

    private TicketsDaoImp obj;

    @GetMapping("/tickets/sucursal/{identificador}")
    public Object getTicketSucursal(@PathVariable("identificador") String id) {
        return obj.getTicketSucursal(id);
    }
    
    @GetMapping("/tickets/sucursal/{id_sucursal}/mesa/{id_mesa}")
    public Object getTicketEspecifico(@PathVariable("id_sucursal") int idSucursal,@PathVariable("id_mesa") int idMesa){
         return obj.getTicketEspecifico(idSucursal,idMesa);
    }

    @PostMapping("/tickets/{unir}")
    public Object NuevoTicket(@RequestBody Tickets obj, @PathVariable("unir") boolean unir) {
        return this.obj.insertar(obj,unir);
    }

    @DeleteMapping("/tickets/cancelar/{id}")
    public Object CancelarTicket(@PathVariable("id") String id) {
        return this.obj.CancelarTicket(id);
    }

    @PostMapping("/tickets/detalle")
    public Object insertarDetalleTicket(@RequestBody Detalle_Tickets obj) {
        return this.obj.insertarDetalleTickets(obj);
    }
    
    @PostMapping("/tickets/detalle/lista")
    public Object insertarDetalleTicketLista(@RequestBody List<Detalle_Tickets> obj) throws Exception {
        return this.obj.insertarDetalleTicketsLista(obj);
    }

    @PutMapping("/tickets/detalle")
    public Object actualizarDetalleTicket(@RequestBody Detalle_Tickets obj) {
        return this.obj.actualizarDetalleTicket(obj);
    }

    @GetMapping("/tickets/detalle/{identificador}")
    public Object obtenerDetalle(@PathVariable("identificador") int id) {
        return obj.obtenerDetalleTickets(id);
    }

    @GetMapping("/tickets/detalle/agrupado/{identificador}")
    public Object obtenerDetalleAgrupado(@PathVariable("identificador") String id) {
        return obj.obtenerDetalleTicketsAgrupados(id);
    }
    
    @GetMapping("/tickets/detalle/agrupado/ticketfinal/{identificador}")
    public Object obtenerDetalleAgrupadoticketfinal(@PathVariable("identificador") String id) {
        return obj.obtenerDetalleAgrupadoticketfinal(id);
    }

    @PutMapping("/tickets/cobrado")
    public Object cobrarTicket(@RequestBody Tickets obj) {
        return this.obj.cobrarTicket(obj);
    }

    @GetMapping("/tickets/notificaciones/{id_sucursal}/lugar/{lugar}")
    public Object obtenerdetallecocinero(@PathVariable("id_sucursal") int id_sucursal,@PathVariable("lugar") int lugar) {
        return obj.obtenerdetallecocinero(id_sucursal,lugar);
    }
    
    @GetMapping("/tickets/sucursal/{id_sucursal}/fecha/{fecha}")
    public Object getCanceladosTickets(@PathVariable("id_sucursal")String id_sucursal,@PathVariable("fecha")String fecha){
       return obj.getCanceladosTickets(id_sucursal,fecha);
    }
    
   

    @PutMapping("/tickets/detallecocinero")
    public Object actualizardetallecocinero(@RequestBody Detalle_Tickets obj) {
        return this.obj.actualizardetallecocinero(obj);
    }
    
    @DeleteMapping("/tickets/detalle/{identificador}")
    public Object eliminarDetalleTicket(@PathVariable("identificador") String id){
      return obj.eliminarDetalleTicket(id);
    }
    //Dirección de parte de las notificaciones.....
    @GetMapping("/tickets/notificacion")
    public Object getNotificacion() {
        return this.obj.getNotificaciones();
    }
    
    @GetMapping("/tickets/mesas/{idsucursal}/mesero/{idmesero}")
    public Object getMesasTickets(@PathVariable("idsucursal") int idSucursal,@PathVariable("idmesero") int id_mesero){
        return obj.getMesasTickets(idSucursal,id_mesero);
    }
    
    
    @GetMapping("/tickets/corteespecial/sucursal/{id_sucursal}/fecha/{fecha}")
    public Object GetDesgloseCajaEspecial (@PathVariable("id_sucursal") int id_sucursal,@PathVariable("fecha")String fecha){
        return obj.GetDesgloseCajaEspecial(id_sucursal, fecha);
    }
    
     @PostMapping("/tickets/cierracorte")
    public Object CierraCorteEspecial(@RequestBody Tickets p) {
        return this.obj.CierraCorteEspecial(p);
    }
    
    
    @PutMapping("/tickets/cambiarmesa/{id_ticket}/{id_usuario}")
    public Object cambiarMeseroTicket(@PathVariable("id_ticket") int idTicket,@PathVariable("id_usuario") int idUsuario){
      return this.obj.cambiarMeseroTicket(idTicket,idUsuario);
    }
    
    @PutMapping("/tickets/cambiarmesa/{unir}")
    public Object cambiarMeseroTicket(@RequestBody Tickets obj,@PathVariable("unir") boolean unir){
      return this.obj.cambiarMesaTicket(obj,unir);
    }
    
    
    @PostMapping("/tickets/descuento")
    public Object aplicandoDescuentoTicket(@RequestBody Tickets obj){
            return this.obj.aplicandoDescuentos(obj);
    }
}
