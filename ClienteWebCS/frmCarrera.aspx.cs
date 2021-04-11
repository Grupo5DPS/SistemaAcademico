using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaEntidades;
using CapaNegocios;

public partial class frmCarrera : System.Web.UI.Page
{
    private Carrera carrera = new Carrera();
    private CarreraBL carreraBL = new CarreraBL();

    private void Listar()
    {
        if(!Page.IsPostBack)
        {
            gvCarrera.DataSource = carreraBL.Listar();
            gvCarrera.DataBind();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Listar();
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        carrera._CodCarrera = txtCodCarrera.Text.Trim();
        carrera._Carrera = txtCarrera.Text.Trim();
        if(carreraBL.Agregar(carrera)==true)
        {
            gvCarrera.DataSource = carreraBL.Listar();
            gvCarrera.DataBind();
        }
        Response.Write("<script>alert('" + carreraBL.Mensaje + "');</script>");
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        String CodCarrera = txtCodCarrera.Text.Trim();
        if (carreraBL.Eliminar(CodCarrera) == true)
        {
            gvCarrera.DataSource = carreraBL.Listar();
            gvCarrera.DataBind();
        }
        Response.Write("<script>alert('" + carreraBL.Mensaje + "');</script>");
    }
    protected void btnActualizar_Click(object sender, EventArgs e)
    {
        carrera._CodCarrera = txtCodCarrera.Text.Trim();
        carrera._Carrera = txtCarrera.Text.Trim();
        if (carreraBL.Actualizar(carrera) == true)
        {
            gvCarrera.DataSource = carreraBL.Listar();
            gvCarrera.DataBind();
        }
        Response.Write("<script>alert('" + carreraBL.Mensaje + "');</script>");
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        String texto = txtTexto.Text.Trim();
        string criterio = ddlCarrera.Text;
        
        gvCarrera.DataSource = carreraBL.Buscar(texto, criterio);
        gvCarrera.DataBind();
   
    }
}