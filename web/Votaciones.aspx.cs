using library;
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
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            // int indiceCategorias = Usuario.VotosUsuario();
            int indiceCategorias = 0; // Auxiliar (el bueno es el de la linea de arriba)
            int indiceNominados = indiceCategorias * 3;

            Session["indiceCategorias"] = indiceCategorias;
            Session["indiceNominados"] = indiceNominados;

            CargarCategorias(indiceCategorias);
            CargarNominados(indiceNominados);

            // noseque.data.DataSource = listaCategorias;
            // updtPnl.DataBind();
        }
        private void CargarCategorias(int indice)
        {
            ENCategorias categoria = new ENCategorias();

            if (!categoria.ObtenerCategoria((indice + 1).ToString()))
            {
            //    Response.Redirect("GraciasPorVotar.aspx");
            //    return;
            }

            // Asignar los datos de la categoría a los controles de la interfaz
        }
        private void CargarNominados(int indice)
        {
            ENNominados nominado1 = new ENNominados();
            ENNominados nominado2 = new ENNominados();
            ENNominados nominado3 = new ENNominados();

            nominado1.ObtenerNominado((indice + 1).ToString());
            nominado2.ObtenerNominado((indice + 2).ToString()); 
            nominado3.ObtenerNominado((indice + 3).ToString());

            // Asignar los datos de los nominados a los controles de la interfaz
        }
        protected void BotonSeleccion_Click(object sender, EventArgs e)
        {
            Button btnSeleccionado = (Button)sender;
            string nominadoId = btnSeleccionado.CommandArgument;

            Session["nominadoSeleccionado"] = nominadoId;

            // btnSeleccion.Visible = true;
            // glowBordes.Visible = true;
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
            string nominadoSeleccionadoId = Session["nominadoSeleccionado"]?.ToString();

            if (string.IsNullOrEmpty(nominadoSeleccionadoId))
            {
                return;
            }

            ENVotaciones voto = new ENVotaciones
            {
                DiscordId = Usuario.IdDiscord,
                CategoriaId = (indiceCategoriaActual + 1).ToString(),
                NominadoId = nominadoSeleccionadoId
            };

            if (voto.AgregarVoto())
            {
                indiceCategoriaActual++;
                indiceNominadoActual += 3;

                Session["indiceCategorias"] = indiceCategoriaActual;
                Session["indiceNominados"] = indiceNominadoActual;
                Session["nominadoSeleccionado"] = null;

                CargarCategorias(indiceCategoriaActual);
                CargarNominados(indiceNominadoActual);

                // updtPnl.Update();
            }
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

            if (indiceCategoriaActual == 0)
            {
                return;
            }

            indiceCategoriaActual--;
            indiceNominadoActual -= 3;

            ENVotaciones votoTemp = new ENVotaciones();
            string nominadoVotadoId;

            if (votoTemp.ObtenerVoto(Usuario.IdDiscord, (indiceCategoriaActual + 1).ToString()))
            {
                nominadoVotadoId = votoTemp.NominadoId;
            }
            else
            {
                return;
            }

            ENVotaciones voto = new ENVotaciones
            {
                DiscordId = Usuario.IdDiscord,
                CategoriaId = (indiceCategoriaActual + 1).ToString(),
                NominadoId = nominadoVotadoId
            };

            if (voto.EliminarVoto())
            {
                Session["nominadoSeleccionado"] = null;
                Session["indiceCategorias"] = indiceCategoriaActual;
                Session["indiceNominados"] = indiceNominadoActual;

                CargarCategorias(indiceCategoriaActual);
                CargarNominados(indiceNominadoActual);

                // updtPnl.Update();
            }
        }
    }
}