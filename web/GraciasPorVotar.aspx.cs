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
            // Nada
        }
        protected void BotonInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
    }
}