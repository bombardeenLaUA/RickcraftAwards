using library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class ResumenVotos : System.Web.UI.Page
    {
        public ENUsuarios Usuario => Session["Usuario"] as ENUsuarios;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] == null && Request.Cookies["UsuarioId"] != null)
                {
                    string discordId = Request.Cookies["UsuarioId"].Value;
                    ENUsuarios usuario = new ENUsuarios();
                    ENUsuarios usuarioRecuperado = usuario.ObtenerUsuario(discordId);
                    if (usuarioRecuperado != null)
                    {
                        Session["Usuario"] = usuarioRecuperado;
                    }
                }
                //ENVotaciones votacionesUsuario = new ENVotaciones();
                //DataSet dataSet = votacionesUsuario.NominadosSeleccionadosPorElUsuario(Usuario.IdDiscord);
                //rpt.DataSource = dataSet;
                //rpt.DataBind();
            }
        }
        protected void BotonCategoria_Click(object sender, EventArgs e)
        {
            Button boton = (Button)sender;

            if (!int.TryParse(boton.CommandArgument, out int indiceCategoriaDeseada))
            {
                return;
            }

            Session["CorregirDesdeResumen"] = true;
            Session["CategoriaACorregir"] = indiceCategoriaDeseada - 1;
            Response.Redirect("Votaciones.aspx");
        }
        protected void BotonContinuar_Click(object sender, EventArgs e)
        {
            Response.Redirect("GraciasPorVotar.aspx");
        }
    }
}