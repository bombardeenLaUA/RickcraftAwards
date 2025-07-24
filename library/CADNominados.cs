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
        public bool ObtenerNominado(int id, ENNominados nominado)
        {
            bool check = false;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT NominadoId, Nombre, CategoriaId, ImagenUrl FROM Nominados WHERE NominadoId = @id", con);
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    nominado.NominadoId = Convert.ToInt32(reader["NominadoId"]);
                    nominado.Nombre = reader["Nombre"].ToString();
                    nominado.CategoriaId = reader["CategoriaId"].ToString();
                    nominado.ImageURL = "files/nominados/nominado{id}.png";
                    check = true;
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
            return check;
        }
    }
}