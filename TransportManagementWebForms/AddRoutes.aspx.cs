using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TransportManagementLib;

namespace TransportManagement
{
    public partial class AddRoutes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            var manager = new TransportManager();
            manager.AddRoute(new tblRoute
            {
                RouteName = txtRouteName.Text.ToString(),
                RouteFare = int.Parse(txtRouteFare.Text) as int?
            });
            txtMessage.Text = "Route Added Successfully";
        }
    }
}