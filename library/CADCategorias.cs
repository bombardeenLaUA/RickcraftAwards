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
        public bool ObtenerCategoria(int id, ENCategorias categoria)
        {
            bool check = false;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT CategoriaId, Nombre, Descripcion FROM Categorias WHERE CategoriaId = @id", con);
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    categoria.CategoriaId = Convert.ToInt32(reader["CategoriaId"]);
                    categoria.Nombre = reader["Nombre"].ToString();
                    categoria.Descripcion = reader["Descripcion"].ToString();
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