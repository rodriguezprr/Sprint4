<%-- 
    Document   : index
    Created on : 1/10/2021, 07:12:37 PM
    Author     : rodriguezprr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     
    <head>
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--//Bootstrap core CSS--> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <!--Angular--> 
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  
        <style>
            /*div {border-style: dotted; }*/
            #div1, #div2, #div3 { margin: 5px; width: 50px; height: 80px;}
            #div2 {margin-top: 0px; margin-bottom: 0px;}
        </style>
    </head>

    <body>
  
        <div class="container-fluid" ng-app = "demoCiclo3" ng-controller = "contactosController as cn">
            <div class="row">
                <div class="col-12">
                    <center><h1>Consultorio Virtual</h1></center> 
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <h3>Sección 1</h3> 
                    <div class="row">
                        <div class="col-6">
                            <label >Identificacion</label>
                            <input class="form-control" type="number" min="0" ng-model="cn.numeroIdentificacion">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" ng-model="cn.nombre">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Apellido</label>
                            <input class="form-control" type="text" ng-model="cn.apellido">
                        </div>
                        <div class="col-6">
                            <label>Genero</label>
                            <select class="form-control" ng-model="cn.genero">
                                <option>Masculino</option>
                                <option>Femenino</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Tipo identificacion</label>
                            <select class="form-control" ng-model="cn.tipoIdentificacion">
                                <option>CC</option>
                                <option>TI</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Telefono</label>
                            <input class="form-control" type="text" ng-model="cn.telefono">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Dirección</label>
                            <input class="form-control" type="text" ng-model="cn.direccion">
                        </div>
                        <div class="col-6">
                            <label>Email</label>
                            <input class="form-control" type="text" ng-model="cn.email">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Ciudad</label>
                            <input class="form-control" type="text" ng-model="cn.ciudad">
                        </div>
                        <div class="col-6">
                            <label>Tipo de Usuario</label>
                            <%--<input class="form-control" type="text" ng-model="cn.tipoUsuario">*/--%>
                            <select class="form-control" ng-model="cn.tipoUsuario">
                                <option>Usuario</option>
                                <option>Medico</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Contraseña</label>
                            <input class="form-control" type="text" ng-model="cn.contrasena">
                        </div>
                        <div class="col-6">
                            <label>Estado</label>
                            <select class="form-control" ng-model="cn.estado">
                                <option>Activo</option>
                                <option>Inactivo</option>
                            </select>
                        </div>
                    </div>
                            
                            
                    <div id="div1"></div>
                    
                    <div class="row">
                        <div class="col-3">
                            <button  class="btn btn-success" ng-click="cn.guardarContacto()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-primary" ng-click="cn.listarContactos()">Listar contacto</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-danger" ng-click="cn.eliminarContacto()">Eliminar contacto</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-warning" ng-click="cn.actualizarContacto()">Actualizar contacto</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <h3>Sección 2</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Identificacion</label>
                            <input class="form-control" type="text" value="{{cn.numeroIdentificacion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" value="{{cn.nombre}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Apellido</label>
                            <input class="form-control" type="text" value="{{cn.apellido}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Genero</label>
                            <input class="form-control" type="text" value="{{cn.genero}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Tipo identificacion</label>
                            <input class="form-control" type="text" value="{{cn.tipoIdentificacion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Telefono</label>
                            <input class="form-control" type="text" value="{{cn.telefono}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Dirección</label>
                            <input class="form-control" type="text" value="{{cn.direccion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Email</label>
                            <input class="form-control" type="text" value="{{cn.email}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Ciudad</label>
                            <input class="form-control" type="text" value="{{cn.ciudad}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Tipo Usuario</label>
                            <input class="form-control" type="text" value="{{cn.tipoUsuario}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Contraseña</label>
                            <input class="form-control" type="text" value="{{cn.contrasena}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Estado</label>
                            <input class="form-control" type="text" value="{{cn.estado}}" disabled="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" >
                <div class="col-12 table-responsive-xl">
                    <h3>Sección 3</h3>
                    <table class="table table-striped table-hover">  
                        <thead class="thead-dark">
                            <tr>  
                                <th>Identificacion</th>  
                                <th>Nombre</th>  
                                <th>Apellido</th>  
                                <th>Genero</th>  
                                <th>Tipo id</th>  
                                <th>Telefono</th>  
                                <th>Direccion</th>  
                                <th>Email</th>
                                <th>Ciudad</th>
                                <th>Tipo Usuario</th>
                                <th>Contraseña</th>
                                <th>Estado</th>
                            </tr>  
                        </thead>

                        <tr ng-repeat = "contacto in cn.contactos">                          
                            <td>{{ contacto.numeroIdentificacion}}</td>  
                            <td>{{ contacto.nombre}}</td>  
                            <td>{{ contacto.apellido}}</td>  
                            <td>{{ contacto.genero}}</td>  
                            <td>{{ contacto.tipoIdentificacion}}</td>  
                            <td>{{ contacto.telefono}}</td>  
                            <td>{{ contacto.direccion}}</td>  
                            <td>{{ contacto.email}}</td>
                            <td>{{ contacto.ciudad}}</td>
                            <td>{{ contacto.tipoUsuario}}</td>
                            <td>{{ contacto.contrasena}}</td>
                            <td>{{ contacto.estado}}</td>
                        </tr>  
                    </table> 
                </div>
            </div>
        </div>
        
    </body>
    
    <script>
        var app = angular.module('demoCiclo3', []);
        app.controller('contactosController', ['$http', controladorContactos]);
        function controladorContactos($http) {
            var cn = this;
            cn.listarContactos = function () {
                var url = "peticiones.jsp";
                var params = {
                    proceso: "listarContacto"
                };
                $http({
                    method: 'POST',
                    url: 'peticiones.jsp',
                    params: params
                }).then(function (res) {
                    cn.contactos = res.data.Contactos;
                });
            };
            cn.guardarContacto = function () {
                if (validar('todos')) {
                    var contacto = {
                        proceso: "guardarContacto",                        
                        numeroIdentificacion: cn.numeroIdentificacion,
                        nombre: cn.nombre,
                        apellido: cn.apellido,
                        genero: cn.genero,
                        tipoIdentificacion: cn.tipoIdentificacion,
                        telefono: cn.telefono,
                        direccion: cn.direccion,
                        email: cn.email,
                        ciudad: cn.ciudad,
                        tipoUsuario: cn.tipoUsuario,
                        contrasena: cn.contrasena,
                        estado: cn.estado
                    };
                    $http({
                        method: 'POST',
                        url: 'peticiones.jsp',
                        params: contacto
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data[contacto.proceso] === true) {
                                alert("Guardado con éxito");
//                                                            cn.listarContactos();
                            } else {
                                alert("Por favor vefifique sus datos");
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                }
            };
            cn.eliminarContacto = function () {
                if (validar('soloId')) {
                    var contacto = {
                        proceso: "eliminarContacto",
                        numeroIdentificacion: cn.numeroIdentificacion
                    };
                    $http({
                        method: 'POST',
                        url: 'peticiones.jsp',
                        params: contacto
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data[contacto.proceso] === true) {
                                alert("Eliminado con éxito");
                                //                                cn.listarContactos();
                            } else {
                                alert("Por favor vefifique sus datos");
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                }
            };
            
            cn.actualizarContacto = function () {
                if (validar('soloId')) {
                    var contacto = {
                        proceso: "actualizarContacto",
                        numeroIdentificacion: cn.numeroIdentificacion,
                        nombre: cn.nombre,
                        apellido: cn.apellido,
                        genero: cn.genero,
                        tipoIdentificacion: cn.tipoIdentificacion,
                        telefono: cn.telefono,
                        direccion: cn.direccion,
                        email: cn.email,
                        ciudad: cn.ciudad,
                        tipoUsuario: cn.tipoUsuario,
                        contrasena: cn.contrasena,
                        estado: cn.estado
                    };
                    $http({
                        method: 'POST',
                        url: 'peticiones.jsp',
                        params: contacto
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data[contacto.proceso] === true) {
                                alert("actualizarcontacto con éxito");
                                //                                cn.listarContactos();
                            } else {
                                alert("Por favor vefifique sus datos");
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                }
            };
            validar = function (tipoValidacion) {
                var vIdentificacion = cn.numeroIdentificacion ? true : false;
                var vNombre = cn.nombre ? true : false;
                var vApellido = cn.apellido ? true : false;
                var vGenero = cn.genero ? true : false;
                var vTipoIdentificacion = cn.tipoIdentificacion ? true : false;
                var vTelefono = cn.telefono ? true : false;
                var vDireccion = cn.direccion ? true : false;
                var vEmail = cn.email ? true : false;
                if (tipoValidacion === 'soloId') {
                    if (!vIdentificacion) {
                        alert('Valide el campo identificacion');
                        return false;
                    } else {
                        return true;
                    }
                } else if (tipoValidacion === 'todos') {
                    if (!vIdentificacion) {
                        alert('Valide el campo identificacion');
                        return false;
                    } else if (!vNombre) {
                        alert('Valide el campo nombre');
                        return false;
                    } else if (!vApellido) {
                        alert('Valide el campo apellido');
                        return false;
                    } else if (!vGenero) {
                        alert('Valide el campo genero');
                        return false;
                    } else if (!vTipoIdentificacion) {
                        alert('Valide el campo tipo identificación');
                        return false;
                    } else if (!vTelefono) {
                        alert('Valide el campo telefono');
                        return false;
                    } else if (!vDireccion) {
                        alert('Valide el campo direccion');
                        return false;
                    } else if (!vEmail) {
                        alert('Valide el campo correo');
                        return false;
                    } else {
                        return true;
                    }
                }
            };
        }
    </script>  

</html>
