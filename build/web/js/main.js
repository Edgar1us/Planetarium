/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


window.addEventListener('load', function(){
    document.getElementById('btnIniciarSesion').addEventListener('click', function(){
        var usuario = document.getElementById('txtUsuario').value;
        var password = document.getElementById('txtPassword').value;
        
        var bandera = false;
        
        if(nombre.length > 0 && password.length > 0){
            bandera = true;
        }
        if (bandera){
            document.getElementById('formInicio').submit();
        }else {
            alert('Pr favor rellene todos los campos');
        }
    });
});