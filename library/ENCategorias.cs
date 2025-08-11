using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;

namespace library
{
    public class ENCategorias
    {
        private int _categoriaId;
        public int CategoriaId
        {
            get { return _categoriaId; }
            set { _categoriaId = value; }
        }
        private string _nombre;
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
        private string _descripcion;
        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }
        public bool ObtenerCategoria(int catId)
        {
            CADCategorias cadCategorias = new CADCategorias();
            return cadCategorias.ObtenerCategoria(catId, this);
        }
        public DataTable ListaCategorias()
        {
            CADCategorias cadCategorias = new CADCategorias();
            return cadCategorias.ListaCategorias();
        }
    }
}