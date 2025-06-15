using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class CADCategorias
    {
        private string constring;

        public CADCategorias()
        {
            constring = System.Configuration.ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
        }
        public List<ENCategorias> ListarCategorias()
        {
            List<ENCategorias> listaCategorias = new List<ENCategorias>();
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT CategoriaId, Nombre, Descripcion FROM Categorias", con);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ENCategorias cats = new ENCategorias
                    {
                        CategoriaId = reader["CategoriaId"].ToString(),
                        Nombre = reader["Nombre"].ToString(),
                        Descripcion = reader["Descripcion"].ToString()
                    };
                    listaCategorias.Add(cats);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al conectar a la base de datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return listaCategorias;
        }
    }
}