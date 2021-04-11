using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security; // Namesapace para manejar seguridad 

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string usuario = Login1.UserName;
        string password = Login1.Password;
        if (usuario == "juan" && password == "123")
        {
            FormsAuthentication.RedirectFromLoginPage(usuario, false);
        }
        else Login1.FailureText = "Usuario y/o Contraseñas invalidas";
    }
}