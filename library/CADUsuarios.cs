using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class CADUsuarios
    {
        private string constring;

        public CADUsuarios()
        {
            constring = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
        }
        public bool AgregarUsuario(ENUsuarios usuario)
        {
            bool check = false;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO Usuarios (DiscordId, Nombre) VALUES (@id_discord, @nombre)", con);
                cmd.Parameters.AddWithValue("@id_discord", usuario.IdDiscord);
                cmd.Parameters.AddWithValue("@nombre", usuario.Nombre);

                check = cmd.ExecuteNonQuery() > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al agregar usuario: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return check;
        }
        public ENUsuarios ObtenerUsuario(string idDiscord)
        {
            ENUsuarios usuario = null;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM Usuarios WHERE DiscordId = @id_discord", con);
                cmd.Parameters.AddWithValue("@id_discord", idDiscord);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    usuario = new ENUsuarios
                    {
                        IdDiscord = reader["DiscordId"].ToString(),
                        Nombre = reader["Nombre"].ToString()
                    };
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al obtener usuario: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return usuario;
        }
    }
}