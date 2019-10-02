/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.controllers;

import com.entrecodigos.daoimp.KeyDaoImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.entrecodigos.repositorios.Key;
import org.springframework.web.bind.annotation.PutMapping;


/**
 *
 * @author i7
 */
@RestController
@RequestMapping("/catalogos")
public class catalogosKeyController {
     @Autowired
    @Qualifier("objkey")
     
     private KeyDaoImp obj;
     
     @GetMapping("/key/key")
     public Object getKey(){
         return  obj.getKey();
     }
     
     @PutMapping("key/keyactualiza")
     public Object ActualizaKey() throws InterruptedException{
     return obj.ActualizaKey();
     }
}