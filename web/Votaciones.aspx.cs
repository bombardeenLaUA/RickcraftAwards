﻿using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class Votaciones : System.Web.UI.Page
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

                if (Session["VotacionFinalizada"] != null && (bool)Session["VotacionFinalizada"])
                {
                    Response.Redirect("GraciasPorVotar.aspx");
                    return;
                }

                if (Session["VotacionFinalizada"] == null)
                {
                    Session["VotacionFinalizada"] = false;
                }

                if (Session["CorregirDesdeResumen"] != null && (bool)Session["CorregirDesdeResumen"])
                {
                    //btnAnterior.Visible = false;

                    int indiceCategoria = Session["CategoriaACorregir"] as int? ?? 0;
                    int indiceNominado = indiceCategoria * 3;

                    Session["indiceCategorias"] = indiceCategoria;
                    Session["indiceNominados"] = indiceNominado;

                    CargarCategorias(indiceCategoria);
                    CargarNominados(indiceNominado);
                }
                else
                {
                    CargarDatos();
                }
            }
        }
        private void CargarDatos()
        {
            //int indiceCategorias = Usuario.VotosUsuario();
            int indiceCategorias = 0; // Auxiliar (el bueno es el de la linea de arriba)
            int indiceNominados = indiceCategorias * 3;

            Session["indiceCategorias"] = indiceCategorias;
            Session["indiceNominados"] = indiceNominados;

            if (indiceCategorias == 0)
            {
                //btnAnterior.Visible = false;
            }

            CargarCategorias(indiceCategorias);
            CargarNominados(indiceNominados);
        }
        private void CargarCategorias(int indice)
        {
            ENCategorias categoria = new ENCategorias();

            if (!categoria.ObtenerCategoria((indice + 1)))
            {
            //   Response.Redirect("ResumenVotos.aspx");
            //   return;
            }

            // Asignar los datos de la categoría a los controles de la interfaz
        }
        private void CargarNominados(int indice)
        {
            ENNominados nominado1 = new ENNominados();
            ENNominados nominado2 = new ENNominados();
            ENNominados nominado3 = new ENNominados();

            nominado1.ObtenerNominado((indice + 1));
            nominado2.ObtenerNominado((indice + 2)); 
            nominado3.ObtenerNominado((indice + 3));

            // Asignar los datos de los nominados a los controles de la interfaz
        }
        protected void BotonSeleccion_Click(object sender, EventArgs e)
        {
            Button btnSeleccionado = (Button)sender;
            int nominadoId = Convert.ToInt32(btnSeleccionado.CommandArgument);

            Session["nominadoSeleccionado"] = nominadoId;

            //btnSeleccion.Visible = true;
            //glowBordes.Visible = true;
        }
        protected void BotonContinuar_Click(object sender, EventArgs e)
        {
            if (Usuario == null)
            {
                Response.Redirect("LoginDiscord.aspx");
                return;
            }

            int indiceCategoriaActual = Session["indiceCategorias"] as int? ?? 0;
            int indiceNominadoActual = Session["indiceNominados"] as int? ?? 0;
            int? nominadoSeleccionadoId = Session["nominadoSeleccionado"] as int?;

            if (nominadoSeleccionadoId.HasValue)
            {
                ENVotaciones voto = new ENVotaciones
                {
                    DiscordId = Usuario.IdDiscord,
                    CategoriaId = (indiceCategoriaActual + 1),
                    NominadoId = (int)nominadoSeleccionadoId
                };

                if (!voto.AgregarVoto())
                {
                    return;
                }
            }

            if (Session["CorregirDesdeResumen"] != null && (bool)Session["CorregirDesdeResumen"])
            {
                Session.Remove("CategoriaACorregir");
                Session.Remove("CorregirDesdeResumen");
                Response.Redirect("ResumenVotos.aspx");
                Session["nominadoSeleccionado"] = null;
                return;
            }

            indiceCategoriaActual++;
            indiceNominadoActual += 3;

            Session["indiceCategorias"] = indiceCategoriaActual;
            Session["indiceNominados"] = indiceNominadoActual;
            Session["nominadoSeleccionado"] = null;

            CargarCategorias(indiceCategoriaActual);
            CargarNominados(indiceNominadoActual);

            //updtPnl.Update();
        }
        protected void BotonAnterior_Click(object sender, EventArgs e)
        {
            if (Usuario == null)
            {
                Response.Redirect("LoginDiscord.aspx");
                return;
            }

            int indiceCategoriaActual = Session["indiceCategorias"] as int? ?? 0;
            int indiceNominadoActual = Session["indiceNominados"] as int? ?? 0;

            indiceCategoriaActual--;
            indiceNominadoActual -= 3;

            ENVotaciones votoTemp = new ENVotaciones();
            int nominadoVotadoId;

            if (votoTemp.ObtenerVoto(Usuario.IdDiscord, (indiceCategoriaActual + 1)))
            {
                nominadoVotadoId = votoTemp.NominadoId;
            }
            else
            {
                return;
            }

            Session["nominadoSeleccionado"] = nominadoVotadoId;
            Session["indiceCategorias"] = indiceCategoriaActual;
            Session["indiceNominados"] = indiceNominadoActual;

            CargarCategorias(indiceCategoriaActual);
            CargarNominados(indiceNominadoActual);

            //updtPnl.Update();
        }
        protected void BtnContinuar_Click(object sender, EventArgs e)
        {
            //Response.Redirect("ResumenVotos.aspx");
            Response.Redirect("GraciasPorVotar.aspx");
        }
    }
}