using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nada
        }
        protected void BotonVotar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Votaciones.aspx");
            Response.Redirect("https://discord.com/oauth2/authorize?client_id=1379599717624713318&redirect_uri=https%3A%2F%2Flocalhost%3A44396%2FLoginDiscord.aspx&response_type=code&scope=identify");
        }
    }
}