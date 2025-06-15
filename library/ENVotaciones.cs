using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class ENVotaciones
    {
        private string _votoId;
        public string VotoId
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
        private string _categoriaId;
        public string CategoriaId
        {
            get { return _categoriaId; }
            set { _categoriaId = value; }
        }
        private string _nominadoId;
        public string NominadoId
        {
            get { return _nominadoId; }
            set { _nominadoId = value; }
        }
    }
}