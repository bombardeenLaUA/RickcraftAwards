﻿using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class GraciasPorVotar : System.Web.UI.Page
    {
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
            }
        }
        protected void BotonInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
    }
}