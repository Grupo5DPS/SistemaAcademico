using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using CapaEntidades;
using System.Data;

namespace CapaNegocios
{
    public class UsuarioBL:Interfaces.IUsuario
    {
        private Datos datos = new DatosSQL();
        private string mensaje;
        private string datosp;
        public string Mensaje
        {
            get { return mensaje; }
        }
        public string Datosp
        {
            get { return datosp; }
        }
        public bool Login(UsuarioE usuario)
        {
            DataRow fila = datos.TraerDataRow("spLoginUsuario",usuario._Usuario,usuario._Contrasena);
            byte CodError = Convert.ToByte(fila["CodError"]);
            mensaje = fila["Mensaje"].ToString();
            datosp = fila["Datos"].ToString();
            if (CodError == 0)
            {
                return true;
            }
            else return false;
        }
    }
}
