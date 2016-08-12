/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.PERS;
import com.sv.udb.modelo.UBIC_GEOG;
import com.sv.udb.recursos.Conexion;
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
public class UBIC_GEOGCtrl {
    public List<UBIC_GEOG> consTodo()
    {
       List<UBIC_GEOG> resp = new ArrayList();
       Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("select * from UBIC_GEOG");
            ResultSet rs = cmd.executeQuery();
                
            while(rs.next())
            {   
                resp.add(new UBIC_GEOG(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5)));
               
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
}
