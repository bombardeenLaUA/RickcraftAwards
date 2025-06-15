using library;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class LoginDiscord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request.QueryString["code"];
            if (!string.IsNullOrEmpty(code))
            {
                string clientId = ConfigurationManager.AppSettings["DiscordClientId"];
                string clientSecret = ConfigurationManager.AppSettings["DiscordClientSecret"];
                string redirectUri = "https://localhost:44396/LoginDiscord.aspx";

                using (var client = new WebClient())
                {
                    var values = new System.Collections.Specialized.NameValueCollection
                    {
                        { "client_id", clientId },
                        { "client_secret", clientSecret },
                        { "grant_type", "authorization_code" },
                        { "code", code },
                        { "redirect_uri", redirectUri }
                    };

                    try
                    {
                        byte[] response = client.UploadValues("https://discord.com/api/oauth2/token", values);
                        string responseString = Encoding.UTF8.GetString(response);
                        dynamic tokenData = JsonConvert.DeserializeObject(responseString);
                        string accessToken = tokenData.access_token;

                        client.Headers.Add("Authorization", $"Bearer {accessToken}");
                        string userJson = client.DownloadString("https://discord.com/api/users/@me");

                        dynamic userData = JsonConvert.DeserializeObject(userJson);
                        string discordId = userData.id;
                        string nombre = userData.username;

                        ENUsuarios usuarioLogeado = new ENUsuarios
                        {
                            IdDiscord = discordId,
                            Nombre = nombre
                        };

                        usuarioLogeado.AgregarUsuario();
                        ENUsuarios usuario = usuarioLogeado.ObtenerUsuario(discordId);

                        Session["Usuario"] = usuario;
                        Response.Redirect("Inicio.aspx");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error al conectar con Discord: " + ex.Message);
                    }
                }
            }
            else
            {
                Response.Write("No se recibió el código de autorización de Discord.");
            }
        }
    }
}