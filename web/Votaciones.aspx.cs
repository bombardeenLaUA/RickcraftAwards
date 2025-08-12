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
                        if (usuarioRecuperado.VotacionFinalizada)
                        {
                            Response.Redirect("GraciasPorVotar.aspx");
                            return;
                        }
                    }
                }

                if (Usuario.VotacionFinalizada)
                {
                    Response.Redirect("GraciasPorVotar.aspx");
                    return;
                }

                if (Session["CorregirDesdeResumen"] != null && (bool)Session["CorregirDesdeResumen"])
                {
                    btnAnterior.Visible = false;

                    int indiceCategoria = Session["CategoriaACorregir"] as int? ?? 0;

                    Session["indiceCategorias"] = indiceCategoria;

                    CargarCategorias(indiceCategoria);
                    CargarNominados(indiceCategoria);
                }
                else
                {
                    CargarDatos();
                }
            }
        }
        private void CargarDatos()
        {
            int? sessionIndex = Session["indiceCategorias"] as int?;
            int indiceCategoriaActual;

            if (sessionIndex.HasValue)
            {
                indiceCategoriaActual = sessionIndex.Value;
            }
            else
            {
                indiceCategoriaActual = 0;

                try
                {
                    ENVotaciones votos = new ENVotaciones();
                    DataSet dsVotos = votos.NominadosSeleccionadosPorElUsuario(Usuario.IdDiscord);

                    if (dsVotos != null && dsVotos.Tables.Count > 0 && dsVotos.Tables[0].Rows.Count > 0)
                    {
                        DataTable dt = dsVotos.Tables[0];
                        int maxCategoriaId = 0;

                        foreach (DataRow row in dt.Rows)
                        {
                            if (row["CategoriaId"] != null && int.TryParse(row["CategoriaId"].ToString(), out int cid))
                            {
                                if (cid > maxCategoriaId) maxCategoriaId = cid;
                            }
                        }

                        indiceCategoriaActual = maxCategoriaId;
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Error leyendo votos usuario: " + ex.Message);
                    indiceCategoriaActual = 0;
                }
            }

            Session["indiceCategorias"] = indiceCategoriaActual;

            btnAnterior.Visible = indiceCategoriaActual > 0;

            CargarCategorias(indiceCategoriaActual);
            CargarNominados(indiceCategoriaActual);

            lblSeguimiento.Text = $"{indiceCategoriaActual + 1} de 8";
        }
        private void CargarCategorias(int indice)
        {
            ENCategorias categoria = new ENCategorias();

            if (!categoria.ObtenerCategoria((indice + 1)))
            {
                Response.Redirect("ResumenVotos.aspx");
                return;
            }

            lblCategoria.Text = categoria.Nombre;
            lblDescripcion.Text = categoria.Descripcion;
        }
        private void CargarNominados(int indice)
        {
            ENNominados nominados = new ENNominados();

            nominados.CategoriaId = (indice + 1).ToString();
            DataSet dsNominados = nominados.ListaNominados();

            rptNominados.DataSource = dsNominados.Tables[0];
            rptNominados.DataBind();

            hdnNominadoSeleccionado.Value = string.Empty;
        }
        protected void BotonContinuar_Click(object sender, EventArgs e)
        {
            if (Usuario == null)
            {
                Response.Redirect("LoginDiscord.aspx");
                return;
            }

            int indiceCategoriaActual = Session["indiceCategorias"] as int? ?? 0;
            int nominadoSeleccionadoId;

            if (!string.IsNullOrEmpty(hdnNominadoSeleccionado.Value) && int.TryParse(hdnNominadoSeleccionado.Value, out nominadoSeleccionadoId))
            {
                ENVotaciones voto = new ENVotaciones
                {
                    DiscordId = Usuario.IdDiscord,
                    CategoriaId = (indiceCategoriaActual + 1),
                    NominadoId = nominadoSeleccionadoId
                };

                if (!voto.AgregarVoto())
                {
                    return;
                }
            }
            else
            {
                ENVotaciones voto = new ENVotaciones();
                if (voto.ObtenerVoto(Usuario.IdDiscord, (indiceCategoriaActual + 1)))
                {
                    if (!voto.EliminarVoto())
                    {
                        return;
                    }
                }
            }

            if (Session["CorregirDesdeResumen"] != null && (bool)Session["CorregirDesdeResumen"])
            {
                Session.Remove("CategoriaACorregir");
                Session.Remove("CorregirDesdeResumen");
                Response.Redirect("ResumenVotos.aspx");
                return;
            }

            indiceCategoriaActual++;

            Session["indiceCategorias"] = indiceCategoriaActual;

            CargarDatos();

            updtVotaciones.Update();
        }
        protected void BotonAnterior_Click(object sender, EventArgs e)
        {
            if (Usuario == null)
            {
                Response.Redirect("LoginDiscord.aspx");
                return;
            }

            int indiceCategoriaActual = Session["indiceCategorias"] as int? ?? 0;

            indiceCategoriaActual--;

            ENVotaciones votoTemp = new ENVotaciones();
            int nominadoVotadoId = 0;

            if (votoTemp.ObtenerVoto(Usuario.IdDiscord, (indiceCategoriaActual + 1)))
            {
                nominadoVotadoId = votoTemp.NominadoId;
            }

            votoTemp.EliminarVoto();

            Session["indiceCategorias"] = indiceCategoriaActual;

            CargarDatos();

            updtVotaciones.Update();
        }
    }
}