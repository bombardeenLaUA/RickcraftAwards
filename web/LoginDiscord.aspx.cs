using library;
using Newtonsoft.Json;
using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Net;
using System.Text;
using System.Web;

namespace web
{
    public partial class LoginDiscord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            string code = Request.QueryString["code"];
            if (!string.IsNullOrEmpty(code))
            {
                string clientId = ConfigurationManager.AppSettings["DiscordClientId"];
                string clientSecret = ConfigurationManager.AppSettings["DiscordClientSecret"];

                // Redirect URI EXACTAMENTE como está registrado en Discord Developer Portal
                string redirectUri = "https://www.rickcraftawards.com/LoginDiscord.aspx";

                using (var client = new WebClient())
                {
                    // Cabeceras para la petición POST
                    client.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";

                    // Datos del POST (mismo redirect_uri exacto)
                    var values = new NameValueCollection
                    {
                        { "client_id", clientId },
                        { "client_secret", clientSecret },
                        { "grant_type", "authorization_code" },
                        { "code", code },
                        { "redirect_uri", redirectUri }
                    };

                    try
                    {
                        // Canje del token
                        byte[] response = client.UploadValues("https://discord.com/api/oauth2/token", values);
                        string responseString = Encoding.UTF8.GetString(response);
                        dynamic tokenData = JsonConvert.DeserializeObject(responseString);

                        string accessToken = tokenData.access_token;

                        // Obtener datos del usuario
                        client.Headers.Clear();
                        client.Headers.Add("Authorization", $"Bearer {accessToken}");
                        string userJson = client.DownloadString("https://discord.com/api/users/@me");
                        dynamic userData = JsonConvert.DeserializeObject(userJson);

                        string discordId = userData.id;
                        string nombre = userData.global_name ?? userData.username;

                        ENUsuarios usuarioLogeado = new ENUsuarios
                        {
                            IdDiscord = discordId,
                            Nombre = nombre
                        };

                        bool usuarioGuardado = usuarioLogeado.AgregarUsuario();
                        if (usuarioGuardado)
                        {
                            usuarioLogeado.AvatarHash = userData.avatar;
                            usuarioLogeado.Discriminator = userData.discriminator;

                            Session["Usuario"] = usuarioLogeado;

                            HttpCookie cookie = new HttpCookie("UsuarioData");
                            cookie.Values["Id"] = usuarioLogeado.IdDiscord;
                            cookie.Values["Nombre"] = usuarioLogeado.Nombre;
                            cookie.Values["AvatarHash"] = usuarioLogeado.AvatarHash ?? "";
                            cookie.Values["Discriminator"] = usuarioLogeado.Discriminator ?? "";
                            cookie.Expires = DateTime.Now.AddDays(1);
                            Response.Cookies.Add(cookie);

                            string origen = Session["LoginOrigen"] as string;
                            if (origen == "Votaciones")
                                Response.Redirect("Votaciones.aspx");
                            else
                                Response.Redirect("Inicio.aspx");
                        }
                        else
                        {
                            Response.Write("Error al guardar el usuario en la base de datos.");
                        }
                    }
                    catch (WebException ex)
                    {
                        string errorMsg = "";
                        if (ex.Response != null)
                        {
                            using (var reader = new System.IO.StreamReader(ex.Response.GetResponseStream()))
                            {
                                errorMsg = reader.ReadToEnd();
                            }
                        }
                        Response.Write("Error al conectar con Discord: " + ex.Message + "<br/>" + errorMsg);
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error general: " + ex.Message);
                    }
                }
            }
            else
            {
                // Si no hay código en la query, redirigir a la URL de autorización
                string clientId = ConfigurationManager.AppSettings["DiscordClientId"];
                string redirectUriEncoded = HttpUtility.UrlEncode("https://www.rickcraftawards.com/LoginDiscord.aspx");
                string authUrl = $"https://discord.com/oauth2/authorize?client_id={clientId}&redirect_uri={redirectUriEncoded}&response_type=code&scope=identify";
                Response.Redirect(authUrl);
            }
        }
    }
}
