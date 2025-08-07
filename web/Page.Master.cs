using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class Page : System.Web.UI.MasterPage
    {
        private ENUsuarios _usuario;
        public ENUsuarios Usuario
        {
            get
            {
                if (_usuario == null)
                {
                    _usuario = Session["Usuario"] as ENUsuarios;
                }
                return _usuario;
            }
            set { _usuario = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null && Request.Cookies["UsuarioData"] != null)
            {
                var cookie = Request.Cookies["UsuarioData"];

                ENUsuarios usuarioRecuperado = new ENUsuarios
                {
                    IdDiscord = cookie.Values["Id"],
                    Nombre = cookie.Values["Nombre"],
                    AvatarHash = cookie.Values["AvatarHash"],
                    Discriminator = cookie.Values["Discriminator"]
                };

                Session["Usuario"] = usuarioRecuperado;
                _usuario = usuarioRecuperado;
            }

            if (Usuario != null)
            {
                string avatarUrl;
                if (!string.IsNullOrEmpty(Usuario.AvatarHash))
                {
                    avatarUrl = $"https://cdn.discordapp.com/avatars/{Usuario.IdDiscord}/{Usuario.AvatarHash}.png";
                }
                else
                {
                    int fallback = 0;
                    if (int.TryParse(Usuario.Discriminator, out int discriminatorValue))
                    {
                        fallback = discriminatorValue % 5;
                    }
                    avatarUrl = $"https://cdn.discordapp.com/embed/avatars/{fallback}.png";
                }
                ImageUser.ImageUrl = avatarUrl;
                lblNombreUser.Visible = true;
                lblNombreUser.Text = Usuario.Nombre;
                BotonCerrar.Visible = true;
                ImageUser.ToolTip = Usuario.Nombre;
                ImageUser.Enabled = false;
            }
            else
            {
                lblNombreUser.Visible = false;
                BotonCerrar.Visible = false;
                ImageUser.ToolTip = "Iniciar Sesión";
            }

            string paginaActual = Request.Url.AbsolutePath.ToLower();

            switch (paginaActual)
            {
                case "/inicio.aspx":
                    lblTextCenter.Text = "BIENVENIDO";
                    break;
                case "/votaciones.aspx":
                    lblTextCenter.Text = "VOTACIONES";
                    break;
                case "/resumenvotos.aspx":
                    lblTextCenter.Text = "RESUMEN";
                    break;
                case "/graciasporvotar.aspx":
                    lblTextCenter.Text = "VOTACIÓN FINALIZADA";
                    break;
                default:
                    break;
            }
        }
        protected void BotonLogin_Click(object sender, EventArgs e)
        {
            if (Usuario == null)
            {
                Session["LoginOrigen"] = "Inicio";
                string clientId = "1379599717624713318";
                string redirectUri = HttpUtility.UrlEncode("https://localhost:44396/LoginDiscord.aspx");
                string scope = "identify";
                string url = $"https://discord.com/oauth2/authorize?client_id={clientId}&redirect_uri={redirectUri}&response_type=code&scope={scope}";
                Response.Redirect(url);
            }
        }
        protected void BotonCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            HttpCookie sessionCookie = new HttpCookie("ASP.NET_SessionId", "")
            {
                HttpOnly = true,
                Secure = Request.IsSecureConnection,
                Path = "/",
                Expires = DateTime.Now.AddYears(-1)
            };
            Response.Cookies.Add(sessionCookie);

            HttpCookie userCookie = new HttpCookie("UsuarioData")
            {
                HttpOnly = true,
                Secure = Request.IsSecureConnection,
                Path = "/",
                Expires = DateTime.Now.AddYears(-1)
            };
            Response.Cookies.Add(userCookie);
            Response.Redirect("Inicio.aspx");
        }
        protected void BotonTitulo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
    }
}