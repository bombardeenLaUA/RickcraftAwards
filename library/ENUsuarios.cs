using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class ENUsuarios
    {
        private string _iddiscord;
        public string IdDiscord
        {
            get { return _iddiscord; }
            set { _iddiscord = value; }
        }
        private string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
        public bool AgregarUsuario()
        {
            CADUsuarios cad = new CADUsuarios();
            return cad.AgregarUsuario(this);
        }
        public ENUsuarios ObtenerUsuario(string idDiscord)
        {
            CADUsuarios cad = new CADUsuarios();
            return cad.ObtenerUsuario(idDiscord);
        }
    }
}