using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class LoginDiscord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nada
        }
        protected void BotonLogin_CLick(object sender, EventArgs e)
        {
            ENUsuarios usuarioLogeado = new ENUsuarios
            {
                IdDiscord = Request.QueryString["id_discord"],
                Nombre = Request.QueryString["nombre"]
            };

            if (usuarioLogeado.AgregarUsuario())
            {
                ENUsuarios usuario = usuarioLogeado.ObtenerUsuario(usuarioLogeado.IdDiscord);
                Session["Usuario"] = usuario;
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                Response.Write("Error al iniciar sesión con Discord, introduce bien tus datos");
            }
        }
    }
}