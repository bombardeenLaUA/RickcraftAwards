using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class CADNominados
    {
        private string constring;

        public CADNominados()
        {
            constring = System.Configuration.ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
        }
        public List<ENNominados> ObtenerNominados()
        {
            List<ENNominados> nominados = new List<ENNominados>();
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT NominadoId, Nombre, CategoriaId FROM Nominados", con);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ENNominados nom = new ENNominados
                    {
                        NominadoId = reader["NominadoId"].ToString(),
                        Nombre = reader["Nombre"].ToString(),
                        CategoriaId = reader["CategoriaId"].ToString()
                    };
                    nominados.Add(nom);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al abrir la conexión a la base de datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return nominados;
        }
    }
}