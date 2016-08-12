/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.PERS;
import com.sv.udb.recursos.Conexion;
import groovyjarjarcommonscli.ParseException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kevin
 */
public class PERSCtrl {
    public List<PERS> consTodo()
    {
       List<PERS> resp = new ArrayList();
       Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("select * from PERS");
            ResultSet rs = cmd.executeQuery();
                
            while(rs.next())
            {   
                resp.add(new PERS(rs.getInt(1), rs.getString(2)+" "+rs.getString(3)));
               
            }
             
        }
        catch(SQLException err)
        {
            System.out.print(err);
        }
        finally
        {
            try
            {
                if(cn!=null)
                {
                    if(!cn.isClosed())
                    {
                        cn.close();
                    }
                }
            }
            catch(SQLException err)
            {
                System.out.print(err);
            }
        }
        return resp;
    }
    
    public PERS consPers(String id)
    {
       PERS resp = new PERS();
       Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("select * from PERS where codi_pers = ?");
            cmd.setString(1, id);
            ResultSet rs = cmd.executeQuery();
                
            if(rs.next())
            {   
               
                resp = new PERS();
            }
             
        }
        catch(SQLException err)
        {
            System.out.print(err);
        }
        finally
        {
            try
            {
                if(cn!=null)
                {
                    if(!cn.isClosed())
                    {
                        cn.close();
                    }
                }
            }
            catch(SQLException err)
            {
                System.out.print(err);
            }
        }
        return resp;
    }
    public boolean guardar(PERS obj)
    {
        boolean resp= false;
        Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("INSERT INTO pers VALUES(NULL,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cmd.setString(1, obj.getNombre());
            cmd.setString(2, obj.getApellido());
            cmd.setInt(3, obj.getTipo());
            cmd.setString(4, obj.getGenero());
            cmd.setString(5, obj.getNacimiento());
            cmd.setString(6, obj.getDui());
            cmd.setString(7, obj.getNit());
            cmd.setString(8, obj.getSangre());
            cmd.setInt(9, obj.getLocalizacion());
            cmd.setString(10, "NOW()");//obj.getFechaAlta()
            cmd.setString(11, obj.getFechaBaja());
            cmd.setInt(12, 1);//obj.getEstado()
            cmd.setBinaryStream(13, obj.getFoto(), obj.getFoto().available());
            cmd.executeUpdate();
            resp=true;
        }
        catch(Exception err)
        {
            System.out.println(err);
        }
        finally
        {
            try
            {
                if(cn!=null)
                {
                    if(!cn.isClosed())
                    {
                        cn.close();
                    }
                }
            }
            catch(SQLException err)
            {
                System.out.println(err);
            }
        }
        return resp;
    }
}
