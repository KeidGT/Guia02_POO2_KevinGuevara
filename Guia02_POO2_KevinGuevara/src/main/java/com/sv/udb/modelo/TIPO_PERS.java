/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.modelo;

/**
 *
 * @author Kevin
 */
public class TIPO_PERS {
    private int id;
    private String nombre;
    private String fecha1;
    private String fecha2;
    private String esta;

    public TIPO_PERS() {
    }

    public TIPO_PERS(int id, String nombre, String fecha1, String fecha2, String esta) {
        this.id = id;
        this.nombre = nombre;
        this.fecha1 = fecha1;
        this.fecha2 = fecha2;
        this.esta = esta;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha1() {
        return fecha1;
    }

    public void setFecha1(String fecha1) {
        this.fecha1 = fecha1;
    }

    public String getFecha2() {
        return fecha2;
    }

    public void setFecha2(String fecha2) {
        this.fecha2 = fecha2;
    }

    public String getEsta() {
        return esta;
    }

    public void setEsta(String esta) {
        this.esta = esta;
    }

    
}
