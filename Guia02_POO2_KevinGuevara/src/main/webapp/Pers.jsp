<%-- 
    Document   : index
    Created on : 26-abr-2016, 15:43:28
    Author     : Kevin
--%>
<%@page import="com.sv.udb.controlador.PERSCtrl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
	<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/icon.css">
        <link rel="stylesheet" href="iconos/style.css">
        <title>Reporte de Visitas</title>
    </head>
    <body>
        <div id="contenedor">
            <div id="manEquipos">
                <div id="mensajes">
                    <h1 class="center tituloMan">Reporte de Visitas</h1>
                </div>
            </div>
            <div id="menu">
                <div class="menu-item">
                    <a href="index.jsp" class="menu-link">Visitas a una Unidad</a>
                </div>
                <div class="menu-item">
                    <a href="Personas.jsp" class="menu-link">Visitas de una persona</a>
                </div>
                <div class="menu-item">
                    <a href="Unidades.jsp" class="menu-link">Visitas en lapso tiempo</a>
                </div>
                <div class="menu-item">
                    <a href="Pers.jsp" class="menu-link">Personas</a>
                </div>
                
                
            </div>
            <div id="registros">
                <form method="POST" action="PERSServlet">
                <div class="row">
                    <div class="input-field col s8">
                        <input  type="text" class="validate" id="txtBuscar" onkeyup="buscarRegistro('txtBuscar','tbData')">
                    <label for="disabled">Buscar Registro</label>
                    </div>
                    <div class="input-field col s4" id="Estado">
                        <h2 class="left menMan">Estado: ${mensAler}</h2>
                    </div>
                </div>    
                    
                    <table class="centered" style="color: #fff; background: #26A69A;">
                        <thead>
                            <tr>
                                <th>Personas</th>
                                <th style="padding:0px; width: 60px;"><a class="waves-effect waves-light modal-trigger blue-grey lighten-4" href="#modal1" style="display: block; width: 40px; height: 40px; margin:0px; padding:10px; border-radius: 50px; box-shadow: 1px 1px 1px 0.2px rgba(0, 0, 0, 0.42);"><span class="icon-plus" style="color:#fff;"></span></a></th>
                            </tr>
                        </thead>
                    </table>
                <div id="tabla">
                    
                    <% request.setAttribute( "idDisplay", new PERSCtrl().consTodo() ); %>
                    <display:table class="bordered highlight centered" id="tbData" name="idDisplay">
                        <display:column property="nombre" title="Personas" sortable="true"/>
                        <display:column  title="Seleccionar" sortable="true">
                            <input class="with-gap radioButton" type="radio" id="test${tbData.id}" value="${tbData.id}" name="radioButton" />
                            <label for="test${tbData.id}"></labe>
                        </display:column>
                    </display:table>
                </div>
                    <input class="btn waves-effect waves-light left" style="margin-top: 14px; display: none;" type="button" name="cursBoton" value="Consultar" id="btnConsultar" />
            </form>
            
            </div>
        </div>
    </body>
    <div id="modal1" class="modal modal-fixed-footer">
        <form method="POST" action="PERSServlet">
    <div class="modal-content">
        
        
        <div class="row">
            <div class="input-field col s12" style="display:none;">
                <input  id="txtID" placeholder="Código"  type="text" class="validate" name="txtID" value="${txtID}" >
            <label for="txtID">Código</label>
          </div>
        </div>
        
        <div class="row">
            <div class="input-field col s6">
                <input  id="txtNombre" placeholder="Nombres"  type="text" class="validate" name="txtNombre" value="${txtNombre}">
             <label for="txtID">Nombres</label>
            </div>
            <div class="input-field col s6">
                <input  id="txtApellidos" placeholder="Apellidos"  type="text" class="validate" name="txtApellidos" value="${txtApellidos}">
                <label for="txtID">Apellidos</label>
            </div>
        </div>
        
        <div class="row">
            <div class="input-field col s6">
                <div class="file-field input-field">
                    <div class="btn">
                      <span>Foto</span>
                      <input type="file" name="txtFoto">
                    </div>
                    <div class="file-path-wrapper">
                      <input class="file-path validate" type="text">
                    </div>
                </div>
            </div>
            <div class="input-field col s6"  >
                <div id="cmbTipoPersona">
                    <select name="cmbTipoPersona">
                        <option name="idUnidad" value="" disabled selected>Seleccione Tipo Persona</option>
                        <jsp:useBean id="frijolito" class="com.sv.udb.controlador.TIPO_PERSCtrl" scope="page"/>
                        <c:forEach items="${frijolito.consTodo()}" var="fila">
                            <option value="<c:out value="${fila.id}"></c:out>" ${fila.id == SelectedTipo  ? 'selected' : ' '}><c:out value="${fila.nombre}" ></c:out></option>
                        </c:forEach>
                    </select>
                    <label>Tipo Persona</label>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="input-field col s6">
                <div id="cmbGenero">
                    <select name="cmbGenero">
                        <option value="" disabled selected>Seleccione Género</option>
                        <option value="M">Masculino</option>
                        <option value="F">Femenino</option>
                    </select>
                    <label>Género</label>
                </div>
            </div>
            <div class="input-field col s6">
                <input type="date" class="datepicker" name="txtNacimiento" id="txtNacimiento" value="${txtNacimiento}">
                <label>Fecha Nacimiento</label>
            </div>
        </div>
                        
        <div class="row">
            <div class="input-field col s6">
                <input  id="txtDui" placeholder="DUI"  type="text" class="validate" name="txtDui" value="${txtDui}">
             <label for="txtDui">DUI</label>
            </div>
            <div class="input-field col s6">
                <input  id="txtNit" placeholder="NIT"  type="text" class="validate" name="txtNit" value="${txtNit}">
                <label for="txtNit">NIT</label>
            </div>
        </div>
        
        <div class="row">
            <div class="input-field col s6">
                <input  id="txtSangre" placeholder="Tipo Sangre"  type="text" class="validate" name="txtSangre" value="${txtSangre}">
                <label for="txtSangre">Tipo Sangre</label>
            </div>
            <div class="input-field col s6"  >
                <div id="cmbUbicacion">
                    <select name="cmbUbicacion">
                        <option value="" disabled selected>Ubicación Geográfica</option>
                        <jsp:useBean id="frijol" class="com.sv.udb.controlador.UBIC_GEOGCtrl" scope="page"/>
                        <c:forEach items="${frijol.consTodo()}" var="fila">
                            <option value="<c:out value="${fila.id}"></c:out>" ${fila.id == SelectedUbicacion  ? 'selected' : ' '}><c:out value="${fila.nombre}" ></c:out></option>
                        </c:forEach>
                    </select>
                    <label>Ubicación Geográfica</label>
                </div>
            </div>
        </div>              
                        
    </div>
    <div class="modal-footer">
      <div class="row">
            <div class="input-field col s6">
                <input class="btn waves-effect waves-light" style="width: 100%; padding: 0px;" type="submit" id="btnGuardar" name="cursBoton" value="Guardar"/>
            </div>
            <div class="input-field col s6">
                <input class="btn waves-effect waves-light" style="width: 100%; padding: 0px;" type="submit" id="btnModificar" name="cursBoton" value="Modificar" onclick="enabledID()" />
            </div>
        </div>

        <div class="row">
            <div class="input-field col s6">
                <input class="btn waves-effect waves-light" style="width: 100%; padding: 0px;" type="submit" id="btnEliminar" name="cursBoton" value="Eliminar" onclick="enabledID()" />
            </div>
            <div class="input-field col s6">
                <input class="btn waves-effect waves-light disabled" disabled id="btnReporte" style="width: 100%; padding: 0px;" type="submit" name="cursBoton" value="Generar Reporte"/>
                 <!--input class="btn waves-effect waves-light" style="width: 100%; padding: 0px; text-decoration: none;" type="button" name="btnLimpiar" onclick="resetForm('frmData')" value="Limpiar"/-->
            </div>
            <br>
        </div>
        
        <div class="row">
            <div class="input-field col s12">
                <a href="#!" class="modal-action modal-close btn waves-effect waves-light" style="width: 100%; padding: 0px; text-decoration: none;">Cerrar</a>
            </div>
        </div>
        
        
        
        
    </div>
    </form>
  </div>
    <script src="js/jquery-2.1.3.js" charset="utf-8"></script>
    <script src="js/materialize.min.js" charset="utf-8"></script>
    <script src="js/dinamico.js" charset="utf-8"></script>

    <script>
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15 // Creates a dropdown of 15 years to control year
          });
        $('select').material_select();
        $(document).ready(function(){
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            $('.modal-trigger').leanModal();
            $('select').material_select();
          });
        var btn =document.getElementById("btnReporte");
        function resetForm(){
        }
        function ocultar(){
            $("#tbData th:last-child").attr("style", "display: none;");
            $("#tbData td:last-child").attr("style", "display: none;");
            $("#tbData thead").attr("style", "display: none;");
        }
        function seleccionarElemento(){
            $("#tbData tr").click(function(event) {
                var n = $(this).find("input.radioButton").val();
                var id = "test"+n;
                //$("#test"+n).attr("checked", true); // A VECES FALLA :|
                document.getElementById(id).checked = true;
                btn.parentNode.classList.remove("disabled");
                btn.removeAttribute("disabled");
                document.getElementById("btnConsultar").click();
                event.preventDefault();
                $('#modal1').openModal();
            });
        }
        $(document).ready(function() {
            //OCULTAMOS LA ULTIMA COLUMNA DE LA TABLA DONDE SE MANTIENE EL RADIO BUTTON
            ocultar();
            //LE DECIMOS QUE AL DAR CLICK EN UNA FILA, ESTE SELECCIONE EL RADIO BUTTON CORRESPONDIENTE Y CLICKEE EL BOTON CONSULTAR
            seleccionarElemento();
            resetForm();
            //CURS BOTON
            
            $("input[name='cursBoton']").click(function(event) {
                var cursBoton = $(this).val();
                var form = $(this).closest("form");
                if(cursBoton == "Generar Reporte"){
                    $.ajax( {
                        type: "POST",
                        url: form.attr('action'),
                        data: form.serialize() + "&cursBoton=" + cursBoton,
                        success: function(response) {
                            $("#estado").html($(response).find("#estado").html());
                            var win = window.open("reporte.jsp", "_blank");
                            win.focus();
                            alert("HOLA");
                        }
                      });
            
                }else if(cursBoton == "Consultar"){
                    $.ajax( {
                        type: "POST",
                        url: form.attr('action'),
                        data: form.serialize() + "&cursBoton=" + cursBoton,
                        success: function(response) {
                            $("#Estado").html($(response).find("#Estado").html());
                            $("#txtID").value($(response).find("#txtID").value());
                            $("#txtNombre").value($(response).find("#txtNombre").value());
                            $("#txtApellidos").value($(response).find("#txtApellidos").value());
                            $("#txtNacimiento").value($(response).find("#txtNacimiento").value());
                            $("#txtDui").value($(response).find("#txtDui").value());
                            $("#txtNit").value($(response).find("#txtNit").value());
                            
                            $('select').material_select();
                        }
                      });
                }else if(cursBoton =="Guardar" || cursBoton =="Modificar" ||cursBoton =="Eliminar"){
                    btn.parentNode.classList.add("disabled");
                    btn.setAttribute("disabled", "true");
                    $.ajax( {
                        type: "POST",
                        url: form.attr('action'),
                        data: form.serialize() + "&cursBoton=" + cursBoton,
                        success: function(response) {
                            resetForm();
                            $("#Estado").html($(response).find("#Estado").html());
                            $("#tbData").html($(response).find("#tbData").html());
                            alert("Consultado");
                            ocultar();
                            //consultar();
                        }
                      });
                }else{
                    location.reload();
                }
                event.preventDefault();
            });
        });
    </script>
</html>
