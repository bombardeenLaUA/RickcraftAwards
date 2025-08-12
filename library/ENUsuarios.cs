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
        private bool _votacionFinalizada;
        public bool VotacionFinalizada
        {
            get { return _votacionFinalizada; }
            set { _votacionFinalizada = value; }
        }
        private string _avatarHash;
        public string AvatarHash
        {
            get { return _avatarHash; }
            set { _avatarHash = value; }
        }
        private string _discriminator;
        public string Discriminator
        {
            get { return _discriminator; }
            set { _discriminator = value; }
        }
        public bool AgregarUsuario()
        {
            CADUsuarios cad = new CADUsuarios();
            return cad.AgregarUsuario(IdDiscord, Nombre);
        }
        public ENUsuarios ObtenerUsuario(string idDiscord)
        {
            CADUsuarios cad = new CADUsuarios();
            return cad.ObtenerUsuario(idDiscord);
        }
        public int VotosUsuario()
        {
            CADUsuarios cad = new CADUsuarios();
            return cad.VotosUsuario(this);
        }
        public bool VotacionHecha()
        {
            CADUsuarios cad = new CADUsuarios();
            return cad.VotacionHecha(this);
        }
        public bool MarcarVotacionFinalizada()
        {
            CADUsuarios cad = new CADUsuarios();
            return cad.MarcarVotacionFinalizada(this);
        }
    }
}