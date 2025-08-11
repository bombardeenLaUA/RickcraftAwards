using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class ENNominados
    {
        private int _nominadoId;
        public int NominadoId
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
        private string _imagenURL;
        public string ImagenURL
        {
            get { return _imagenURL; }
            set { _imagenURL = value; }
        }
        public DataSet ListaNominados()
        {
            CADNominados cadNominados = new CADNominados();
            return cadNominados.ListaNominados(this);
        }
        public bool ObtenerNominado(int nomId)
        {
            CADNominados cadNominados = new CADNominados();
            return cadNominados.ObtenerNominado(nomId, this);
        }
    }
}