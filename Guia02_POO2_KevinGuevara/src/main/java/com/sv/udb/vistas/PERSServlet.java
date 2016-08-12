/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.vistas;

import com.sv.udb.controlador.PERSCtrl;
import com.sv.udb.modelo.PERS;
import com.sv.udb.recursos.Conexion;
import com.sv.udb.reportes.Reporte;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Kevin
 */
@WebServlet(name = "PERSServlet", urlPatterns = {"/PERSServlet"})
public class PERSServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean esValido=request.getMethod().equals("POST");
        String mensaje="En Espera";
        if(esValido)
        {
            String CRUD = request.getParameter("cursBoton");
            if(CRUD.equals("Generar Reporte"))
            {
                //NADA 
                
            }
            else if(CRUD.equals("Guardar"))
            {
                PERS obj = new PERS();
                obj.setNombre(String.valueOf(request.getParameter("txtNombre")));
                obj.setApellido(String.valueOf(request.getParameter("txtApellido")));
                obj.setTipo(Integer.parseInt(request.getParameter("cmbTipoPersona")));
                obj.setGenero(String.valueOf(request.getParameter("cmbGenero")));
                obj.setNacimiento(request.getParameter("txtNacimiento"));
                obj.setDui(request.getParameter("txtDui"));
                obj.setNit(request.getParameter("txtNit"));
                obj.setSangre(request.getParameter("txtSangre"));
                obj.setLocalizacion(Integer.parseInt(request.getParameter("cmbUbicacion")));
                Part filePart = request.getPart("txtFoto");
                InputStream is = filePart.getInputStream();
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                System.out.println("NOMBRE: "+fileName);
                obj.setFoto(is);
                //mensaje = new PERSCtrl().guardar(obj)? "Datos guardados" : "Datos NO guardados";
                
            }
            else if(CRUD.equals("Generar Reporte"))
            {
                //NADA 
                
            }
            else if(CRUD.equals("Generar Reporte"))
            {
                //NADA 
                
            }
        } 
        else
        {
            response.sendRedirect(request.getContextPath()+"/Pers.jsp");
        }
        request.setAttribute("mensAler", mensaje);    
        request.getRequestDispatcher("/Pers.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
