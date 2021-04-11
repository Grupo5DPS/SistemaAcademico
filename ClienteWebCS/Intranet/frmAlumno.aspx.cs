using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Intranet_frmAlumno : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnReporte1_Click(object sender, EventArgs e)
    {
        mvAlumno.ActiveViewIndex = 0;
    }
    protected void btnReporte2_Click(object sender, EventArgs e)
    {
        mvAlumno.ActiveViewIndex = 1;
    }
    protected void btnCambiarUsuario_Click(object sender, EventArgs e)
    {
        mvAlumno.ActiveViewIndex = 2;
    }
}