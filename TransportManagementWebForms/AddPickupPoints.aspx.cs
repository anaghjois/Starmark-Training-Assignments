using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TransportManagementLib;

namespace TransportManagement
{
    public partial class AddPickupPoints : System.Web.UI.Page
    {
        private readonly ITransportManager manager = new TransportManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var routes = manager.GetAllRoutes();
                DpRoutes.DataSource = routes;
                DpRoutes.DataTextField = "RouteName";
                DpRoutes.DataValueField = "RouteID";
                DpRoutes.DataBind();
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            manager.AddRoute(new tblRoute
            {
                RouteName = txtPoint.ToString(),
                RouteFare = int.Parse(txtAmount.Text),
                RouteID = int.Parse(DpRoutes.SelectedValue)
            });
            lblMessage.Text = "Point Added Successfully";
        }
    }
}