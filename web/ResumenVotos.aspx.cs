using library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class ResumenVotos : System.Web.UI.Page
    {
        public ENUsuarios Usuario => Session["Usuario"] as ENUsuarios;
        private DataTable dtVotosUsuario;
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

                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            ENCategorias categorias = new ENCategorias();
            DataTable dtCategorias = categorias.ListaCategorias();

            ENVotaciones votacionesUsuario = new ENVotaciones();
            DataSet dsVotos = votacionesUsuario.NominadosSeleccionadosPorElUsuario(Usuario.IdDiscord);
            dtVotosUsuario = (dsVotos != null && dsVotos.Tables.Count > 0) ? dsVotos.Tables[0] : new DataTable();

            DataTable dtResumen = new DataTable();
            dtResumen.Columns.Add("Categoria", typeof(string));
            dtResumen.Columns.Add("CategoriaId", typeof(int));

            foreach (DataRow categoriaRow in dtCategorias.Rows)
            {
                DataRow newRow = dtResumen.NewRow();
                newRow["Categoria"] = categoriaRow["Nombre"].ToString();
                newRow["CategoriaId"] = Convert.ToInt32(categoriaRow["CategoriaId"]);
                dtResumen.Rows.Add(newRow);
            }

            rptNominados.DataSource = dtResumen;
            rptNominados.DataBind();
        }
        protected void rptNominados_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView rowView = (DataRowView)e.Item.DataItem;
                int categoriaId = Convert.ToInt32(rowView["CategoriaId"]);

                DataRow votoEncontrado = dtVotosUsuario.AsEnumerable().FirstOrDefault(row => row.Field<int>("CategoriaId") == categoriaId);

                Label lblNombre = (Label)e.Item.FindControl("lblNombre");
                Image imgNominado = (Image)e.Item.FindControl("imgNominado");

                if (votoEncontrado != null)
                {
                    lblNombre.Text = votoEncontrado["Nombre"].ToString();
                }
                else
                {
                    lblNombre.Text = "No seleccionado";
                    imgNominado.ImageUrl = "files/noseleccionado.png";
                    imgNominado.AlternateText = "No seleccionado";
                }
            }
        }
        protected void BotonCategoria_Click(object sender, EventArgs e)
        {
            LinkButton boton = (LinkButton)sender;

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
            if (Usuario == null)
            {
                Response.Redirect("LoginDiscord.aspx");
                return;
            }

            if (Usuario.VotosUsuario() == 0)
            {
                lblError.Visible = true;
                return;
            }

            Session["VotacionFinalizada"] = true;
            Response.Redirect("GraciasPorVotar.aspx");
        }
    }
}