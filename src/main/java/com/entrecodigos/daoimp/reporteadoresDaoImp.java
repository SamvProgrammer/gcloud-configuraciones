/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entrecodigos.daoimp;

import com.entrecodigos.controllers.reporteadorController;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 *
 * @author samv
 */
@Component("reporteadoresDao")
public class reporteadoresDaoImp {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private ResourceLoader resourceLoader;

    public Object reporteHitoricoTickets(int idSucursal) throws IOException, InterruptedException {
        String ruta = "";
        Connection conn = null;
        try {
            conn = this.jdbcTemplate.getDataSource().getConnection();
            Map<String, Object> parametros = new HashMap<String, Object>();
            System.out.println(conn.isClosed());
            parametros.put("idsucursal", idSucursal);
            
            InputStream is = resourceLoader.getResource("classpath:historico_tickets.jasper").getInputStream();

            JasperReport jasper = (JasperReport) JRLoader.loadObject(is);

            
            JasperPrint print = JasperFillManager.fillReport(jasper, parametros, conn);
            

            conn.close();
            Thread.sleep(3000);
            
            return print;
        } catch (JRException ex) {
            Logger.getLogger(reporteadorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reporteadoresDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("respuesta", "/reportes/reporteador.pdf");
        return obj;
    }
    
    public Object reporteHitoricoTicketsPorFecha(int idSucursal,Date f1,Date f2) throws IOException, InterruptedException {
        String ruta = "";
        Connection conn = null;
        try {
            conn = this.jdbcTemplate.getDataSource().getConnection();
            Map<String, Object> parametros = new HashMap<String, Object>();
            parametros.put("idsucursal", idSucursal);
            parametros.put("fecha1", f1);
            parametros.put("fecha2", f2);
            
            InputStream is = resourceLoader.getResource("classpath:ventas_porfecha.jasper").getInputStream();

            JasperReport jasper = (JasperReport) JRLoader.loadObject(is);

            
            JasperPrint print = JasperFillManager.fillReport(jasper, parametros, conn);
            

            conn.close();
            Thread.sleep(3000);
            
            return print;
        } catch (JRException ex) {
            Logger.getLogger(reporteadorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reporteadoresDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("respuesta", "/reportes/reporteador.pdf");
        return obj;
    }
    
     public Object reporteHitoricoTicketsPorFechaMesas(int idSucursal,Date f1,Date f2) throws IOException, InterruptedException {
        String ruta = "";
        Connection conn = null;
        try {
            conn = this.jdbcTemplate.getDataSource().getConnection();
            Map<String, Object> parametros = new HashMap<String, Object>();
            System.out.println(conn.isClosed());
            parametros.put("idsucursal", idSucursal);
            parametros.put("fecha1", f1);
            parametros.put("fecha2", f2);
            
            
            InputStream is = resourceLoader.getResource("classpath:ventas_pormesa.jasper").getInputStream();

            JasperReport jasper = (JasperReport) JRLoader.loadObject(is);

            
            JasperPrint print = JasperFillManager.fillReport(jasper, parametros, conn);
            

            conn.close();
            Thread.sleep(3000);
            
            return print;
        } catch (JRException ex) {
            Logger.getLogger(reporteadorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reporteadoresDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("respuesta", "/reportes/reporteador.pdf");
        return obj;
    }
     
      public Object reporteHitoricoTicketsPorFechaMeseros(int idSucursal,Date f1,Date f2) throws IOException, InterruptedException {
        String ruta = "";
        Connection conn = null;
        try {
            conn = this.jdbcTemplate.getDataSource().getConnection();
            Map<String, Object> parametros = new HashMap<String, Object>();
            System.out.println(conn.isClosed());
            parametros.put("idsucursal", idSucursal);
            parametros.put("fecha1", f1);
            parametros.put("fecha2", f2);
            
            InputStream is = resourceLoader.getResource("classpath:ventas_pormesero.jasper").getInputStream();

            JasperReport jasper = (JasperReport) JRLoader.loadObject(is);

            
            JasperPrint print = JasperFillManager.fillReport(jasper, parametros, conn);
            

            conn.close();
            Thread.sleep(3000);
            
            return print;
        } catch (JRException ex) {
            Logger.getLogger(reporteadorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reporteadoresDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("respuesta", "/reportes/reporteador.pdf");
        return obj;
    }
      
       public Object reporteHitoricoSucursales(Date f1,Date f2) throws IOException, InterruptedException {
        String ruta = "";
        Connection conn = null;
        try {
            conn = this.jdbcTemplate.getDataSource().getConnection();
            Map<String, Object> parametros = new HashMap<String, Object>();
            System.out.println(conn.isClosed());
            parametros.put("fecha1", f1);
            parametros.put("fecha2", f2);
            
            InputStream is = resourceLoader.getResource("classpath:ventas_sucursal.jasper").getInputStream();

            JasperReport jasper = (JasperReport) JRLoader.loadObject(is);

            
            JasperPrint print = JasperFillManager.fillReport(jasper, parametros, conn);
            

            conn.close();
            Thread.sleep(3000);
            
            return print;
        } catch (JRException ex) {
            Logger.getLogger(reporteadorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reporteadoresDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("respuesta", "/reportes/reporteador.pdf");
        return obj;
    }
       
       
       public Object reporteHitoricoTicketsPorFechaBarraCocina(int idSucursal,Date f1,Date f2) throws IOException, InterruptedException {
        String ruta = "";
        Connection conn = null;
        try {
            conn = this.jdbcTemplate.getDataSource().getConnection();
            Map<String, Object> parametros = new HashMap<String, Object>();
            System.out.println(conn.isClosed());
            parametros.put("idsucursal", idSucursal);
            parametros.put("fecha1", f1);
            parametros.put("fecha2", f2);
            
            InputStream is = resourceLoader.getResource("classpath:ventas_barracocina.jasper").getInputStream();

            JasperReport jasper = (JasperReport) JRLoader.loadObject(is);

            
            JasperPrint print = JasperFillManager.fillReport(jasper, parametros, conn);
            

            conn.close();
            Thread.sleep(3000);
            
            return print;
        } catch (JRException ex) {
            Logger.getLogger(reporteadorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reporteadoresDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("respuesta", "/reportes/reporteador.pdf");
        return obj;
    }
       
       public Object reporteinventariosporproducto(int idSucursal,Date f1,Date f2) throws IOException, InterruptedException {
        String ruta = "";
        Connection conn = null;
        try {
            conn = this.jdbcTemplate.getDataSource().getConnection();
            Map<String, Object> parametros = new HashMap<String, Object>();
            System.out.println(conn.isClosed());
            parametros.put("fecha1", f1);
            parametros.put("fecha2", f2);
            parametros.put("idsucursal", idSucursal);
            
            InputStream is = resourceLoader.getResource("classpath:inventarios_productos.jasper").getInputStream();

            JasperReport jasper = (JasperReport) JRLoader.loadObject(is);

            
            JasperPrint print = JasperFillManager.fillReport(jasper, parametros, conn);
            

            conn.close();
            Thread.sleep(3000);
            
            return print;
        } catch (JRException ex) {
            Logger.getLogger(reporteadorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reporteadoresDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("respuesta", "/reportes/reporteador.pdf");
        return obj;
    }
       
       public Object reporteinventariosporinsumos(int idSucursal,Date f1,Date f2) throws IOException, InterruptedException {
        String ruta = "";
        Connection conn = null;
        try {
            conn = this.jdbcTemplate.getDataSource().getConnection();
            Map<String, Object> parametros = new HashMap<String, Object>();
            System.out.println(conn.isClosed());
            parametros.put("fecha1", f1);
            parametros.put("fecha2", f2);
            parametros.put("idsucursal", idSucursal);
            
            InputStream is = resourceLoader.getResource("classpath:inventarios_porinsumos.jasper").getInputStream();
            

            JasperReport jasper = (JasperReport) JRLoader.loadObject(is);

            
            JasperPrint print = JasperFillManager.fillReport(jasper, parametros, conn);
            

            conn.close();
            Thread.sleep(3000);
            
            return print;
        } catch (JRException ex) {
            Logger.getLogger(reporteadorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reporteadoresDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }

        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("respuesta", "/reportes/reporteador.pdf");
        return obj;
    }

    
}
