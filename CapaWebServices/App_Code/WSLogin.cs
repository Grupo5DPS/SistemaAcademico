using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using CapaEntidades;
using CapaNegocios;
using System.Data;

/// <summary>
/// Descripción breve de WSLogin
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class WSLogin : System.Web.Services.WebService
{

    public WSLogin()
    {

        //Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

    [WebMethod(Description = "Login de Usuario")]
    public String[] Login(String _Usuario,string _Contrasena)
    {
        UsuarioE usuario = new UsuarioE();
        UsuarioBL usuarioBL = new UsuarioBL();
        usuario._Usuario = _Usuario;
        usuario._Contrasena = _Contrasena;
        bool CodError = usuarioBL.Login(usuario);
        string[] valores = new string[3];
        if (CodError == true)
        {
            valores[0] = "0";
        }
        else valores[0] = "1";
        valores[1] = usuarioBL.Mensaje;
        valores[2] = usuarioBL.Datosp;
        return valores;
    }

}
