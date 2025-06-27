using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        public bool AgregarVotacion(ENVotaciones votacion)
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

                if (filasAfectadas > 0)
                {
                    check = true;
                }
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
    }
}