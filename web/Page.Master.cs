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
            //if (Session["Usuario"] == null && Request.Cookies["UsuarioId"] != null)
            //{
            //    string discordId = Request.Cookies["UsuarioId"].Value;
            //    ENUsuarios usuario = new ENUsuarios();
            //    ENUsuarios usuarioRecuperado = usuario.ObtenerUsuario(discordId);

            //    if (usuarioRecuperado != null)
            //    {
            //        Session["Usuario"] = usuarioRecuperado;
            //        _usuario = usuarioRecuperado;
            //    }
            //}

            //if (Usuario == null)
            //{
            //    btnLogin.Visible = true;
            //    userPfp.Visible = false;
            //    userNombre.Visible = false;
            //    btnCerrarSesion.Visible = false;
            //}
            //else
            //{
            //    btnLogin.Visible = false;
            //    userPfp.Visible = true;
            //    userNombre.Visible = true;
            //    btnCerrarSesion.Visible = true;
            //}
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

            HttpCookie userCookie = new HttpCookie("UsuarioId")
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