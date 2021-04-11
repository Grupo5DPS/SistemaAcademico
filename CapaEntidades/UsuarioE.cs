using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Runtime.Serialization;

namespace CapaEntidades
{
    [DataContract]

    public class UsuarioE
    {
        [DataMember]
        public String _Usuario
        { get; set; }
        [DataMember]

        public String _Contrasena
        { get; set; }

    }
}
