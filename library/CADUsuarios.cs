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
        public bool AgregarUsuario(string idDsc, string nombre)
        {
            bool check = false;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmdCheck = new SqlCommand("SELECT COUNT(*) FROM Usuarios WHERE DiscordId = @id_discord", con);
                cmdCheck.Parameters.AddWithValue("@id_discord", idDsc);

                int count = (int)cmdCheck.ExecuteScalar();

                if (count == 0)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Usuarios (DiscordId, Nombre) VALUES (@id_discord, @nombre)", con);
                    cmd.Parameters.AddWithValue("@id_discord", idDsc);
                    cmd.Parameters.AddWithValue("@nombre", nombre);

                    check = cmd.ExecuteNonQuery() > 0;
                }
                else
                {
                   check = true;
                }
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
                        Nombre = reader["Nombre"].ToString(),
                        VotacionFinalizada = Convert.ToBoolean(reader["VotacionFinalizada"])
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
        public int VotosUsuario(ENUsuarios usuario)
        {
            int count = 0;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Votos WHERE DiscordId = @id_discord", con);
                cmd.Parameters.AddWithValue("@id_discord", usuario.IdDiscord);

                count = (int)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al verificar si el usuario ha votado: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return count;
        }
        public bool VotacionHecha(ENUsuarios en)
        {
            bool check = false;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT VotacionFinalizada FROM Usuarios WHERE DiscordId = @discord_id", con);
                cmd.Parameters.AddWithValue("@discord_id", en.IdDiscord);

                object result = cmd.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    check = Convert.ToBoolean(result);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al verificar si la votación está finalizada: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return check;
        }
        public bool MarcarVotacionFinalizada(ENUsuarios en)
        {
            bool resultado = false;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("UPDATE Usuarios SET VotacionFinalizada = 1 WHERE DiscordId = @discord_id", con);
                cmd.Parameters.AddWithValue("@discord_id", en.IdDiscord);

                resultado = cmd.ExecuteNonQuery() > 0;
                if (resultado)
                {
                    en.VotacionFinalizada = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al marcar votación como finalizada: " + ex.Message);
            }
            return resultado;
        }
    }
}