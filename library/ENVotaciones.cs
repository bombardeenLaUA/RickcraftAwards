using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class ENVotaciones
    {
        private int _votoId;
        public int VotoId
        {
            get { return _votoId; }
            set { _votoId = value; }
        }
        private string _discordId;
        public string DiscordId
        {
            get { return _discordId; }
            set { _discordId = value; }
        }
        private int _categoriaId;
        public int CategoriaId
        {
            get { return _categoriaId; }
            set { _categoriaId = value; }
        }
        private int _nominadoId;
        public int NominadoId
        {
            get { return _nominadoId; }
            set { _nominadoId = value; }
        }
        public bool AgregarVoto()
        {
            CADVotaciones cad = new CADVotaciones();
            return cad.AgregarVoto(this);
        }
        public bool EliminarVoto()
        {
            CADVotaciones cad = new CADVotaciones();
            return cad.EliminarVoto(this);
        }
        public bool ObtenerVoto(string discordId, int categoriaId)
        {
            CADVotaciones cad = new CADVotaciones();
            return cad.ObtenerVoto(discordId, categoriaId, this);
        }
        public DataSet NominadosSeleccionadosPorElUsuario(string discordId)
        {
            DiscordId = discordId;
            CADVotaciones cad = new CADVotaciones();
            return cad.NominadosSeleccionadosPorElUsuario(this);
        }
        public int ObtenerTotalVotos()
        {
            CADVotaciones cad = new CADVotaciones();
            return cad.ObtenerTotalVotos(this);
        }
    }
}