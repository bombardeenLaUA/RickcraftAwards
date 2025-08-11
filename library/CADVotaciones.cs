using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.SymbolStore;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class CADVotaciones
    {
        private string constring;

        public CADVotaciones()
        {
            constring = System.Configuration.ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
        }
        public bool AgregarVoto(ENVotaciones votacion)
        {
            bool check = false;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO Votos (DiscordId, CategoriaId, NominadoId) VALUES (@discord_id, @categoria_id, @nominado_id)", con);
                cmd.Parameters.AddWithValue("@discord_id", votacion.DiscordId);
                cmd.Parameters.AddWithValue("@categoria_id", votacion.CategoriaId);
                cmd.Parameters.AddWithValue("@nominado_id", votacion.NominadoId);

                int filasAfectadas = cmd.ExecuteNonQuery();
                check = filasAfectadas > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al agregar votación: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return check;
        }
        public bool EliminarVoto(ENVotaciones votacion)
        {
            bool check = false;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM Votos WHERE DiscordId = @discord_id AND CategoriaId = @categoria_id AND NominadoId = @nominado_id", con);
                cmd.Parameters.AddWithValue("@discord_id", votacion.DiscordId);
                cmd.Parameters.AddWithValue("@categoria_id", votacion.CategoriaId);
                cmd.Parameters.AddWithValue("@nominado_id", votacion.NominadoId);

                int filasAfectadas = cmd.ExecuteNonQuery();
                check = filasAfectadas > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al eliminar voto: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return check;
        }
        public bool ObtenerVoto(string discordId, int categoriaId, ENVotaciones votacion)
        {
            bool check = false;
            SqlConnection con = new SqlConnection(constring);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM Votos WHERE DiscordId = @discord_id AND CategoriaId = @categoria_id", con);
                cmd.Parameters.AddWithValue("@discord_id", discordId);
                cmd.Parameters.AddWithValue("@categoria_id", categoriaId);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    votacion.VotoId = Convert.ToInt32(reader["VotoId"]);
                    votacion.DiscordId = reader["DiscordId"].ToString();
                    votacion.CategoriaId = Convert.ToInt32(reader["CategoriaId"]);
                    votacion.NominadoId = Convert.ToInt32(reader["NominadoId"]);
                    check = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al obtener voto: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return check;
        }
        public DataSet NominadosSeleccionadosPorElUsuario(ENVotaciones en)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(constring);
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Votos WHERE DiscordId = @discord_id", con);
            da.SelectCommand.Parameters.AddWithValue("@discord_id", en.DiscordId);
            da.Fill(ds, "Votos");
            return ds;
        }
        public int ObtenerTotalVotos(ENVotaciones en)
        {
            int totalVotos = 0;
            SqlConnection con = new SqlConnection(constring);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT DiscordId COUNT(*) FROM Votos WHERE DiscordId = @discord_id", con);
                cmd.Parameters.AddWithValue("@discord_id", en.DiscordId);
                totalVotos = (int)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al obtener total de votos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return totalVotos;
        }
    }
}