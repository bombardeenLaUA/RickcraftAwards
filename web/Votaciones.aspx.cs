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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            ViewState["indiceNominados"] = 0;
            CargarNominados(0);

            ViewState["indiceCategorias"] = 0;
            CargarCategorias(0);

            // noseque.data.DataSource = listaCategorias;
            // updtPnl.DataBind();
        }
        private void CargarCategorias(int indice)
        {
            ENCategorias categoria = new ENCategorias();

            categoria.ObtenerCategoria((indice + 1).ToString());

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
            // Guardar el nominado en el que se ha hecho clic y rellenar el boton correspondiente con un visible = true del relleno interno
            Button btnSeleccionado = (Button)sender;
            string nominadoId = btnSeleccionado.CommandArgument;

            ENNominados nominado = new ENNominados();
            nominado.NominadoId = nominadoId;
            nominado.ObtenerNominado(nominadoId);

            // btnSeleccion.Visible = true;
        }
        protected void BotonContinuar_Click(object sender, EventArgs e)
        {
            // Guardar el voto en la base de datos y pasar a la siguiente categoría con los siguientes nominados
            ENCategorias categorias = new ENCategorias();
            ENNominados nominados = new ENNominados();

            int indiceCategorias = (int)ViewState["indiceCategorias"];
            int indiceNominados = (int)ViewState["indiceNominados"];
            indiceCategorias++;
            indiceNominados += 3;

            CargarCategorias(indiceCategorias);
            CargarNominados(indiceNominados);

            // updtPnl.Update();
        }
    }
}