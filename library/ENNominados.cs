using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class ENNominados
    {
        private string _nominadoId;
        public string NominadoId
        {
            get { return _nominadoId; }
            set { _nominadoId = value; }
        }
        private string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
        private string _categoriaId;
        public string CategoriaId
        {
            get { return _categoriaId; }
            set { _categoriaId = value; }
        }
        public List<ENNominados> ListarNominados()
        {
            CADNominados cadNominados = new CADNominados();
            return cadNominados.ObtenerNominados();
        }
    }
}