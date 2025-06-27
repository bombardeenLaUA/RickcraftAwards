using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class Inicio : System.Web.UI.Page
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
            // Nada
        }
        protected void BotonVotar_Click(object sender, EventArgs e)
        {
            //if (Usuario == null)
            //{
            //    Session["LoginOrigen"] = "Votaciones";
            //    string clientId = "1379599717624713318";
            //    string redirectUri = HttpUtility.UrlEncode("https://localhost:44396/LoginDiscord.aspx");
            //    string scope = "identify";
            //    string url = $"https://discord.com/oauth2/authorize?client_id={clientId}&redirect_uri={redirectUri}&response_type=code&scope={scope}";

            //    Response.Redirect(url);
            //}
            //else
            //{
            //    if (Usuario.VotosUsuario() == 10) // 10 o las categorias que sean
            //    {
            //        Response.Redirect("GraciasPorVotar.aspx");
            //}
            //    else
            //    {
            Response.Redirect("Votaciones.aspx");
            //    }
            //}
        }
    }
}