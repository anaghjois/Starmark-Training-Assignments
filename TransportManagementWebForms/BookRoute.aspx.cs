using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TransportManagement.Models;
using TransportManagementLib;

namespace TransportManagement
{
    public partial class BookRoute : System.Web.UI.Page
    {
        private readonly ITransportManager manager = new TransportManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var routes = manager.GetAllRoutes();
                DPRoutes.DataSource = routes;
                DPRoutes.DataTextField = "RouteName";
                DPRoutes.DataValueField = "RouteID";
                DPRoutes.DataBind();
            }
        }
        protected void DPRoutes_SelectedIndexChanged(object sender, EventArgs e)
        {
            var index = int.Parse(DPRoutes.SelectedValue);
            var pickUps = manager.GetAllPickUps();
            var fromPoint = pickUps.FindAll(r => r.RouteID == index);
            var toPoint = pickUps.FindAll(r => r.RouteID == index);
            fromRoute.DataSource = fromPoint;
            fromRoute.DataTextField = "PickUpPointName";
            fromRoute.DataValueField = "PickUpPrice";
            fromRoute.DataBind();
            toRoute.DataSource = toPoint;
            toRoute.DataTextField = "PickUpPointName";
            toRoute.DataValueField = "PickUpPrice";
            toRoute.DataBind();
            //if (fromRoute.SelectedItem == toRoute.SelectedItem)
            //{
            //    throw new Exception("From Route cannot be same as To Route");
            //}
        }

        protected void btnSuccess_Click(object sender, EventArgs e)
        {
            var LastStopPrice = int.Parse(toRoute.SelectedValue);
            var FirstStopPrice = int.Parse(fromRoute.SelectedValue);
            if (fromRoute.SelectedItem.ToString()== toRoute.SelectedItem.ToString())
            {
                lblMessage.Text = "From Route cannot be same as To Route";
            }
            else
            {
               // var repo = Application["Bills"] as TransportManager;
                var Bill = new tblBill
                {
                    RouteID = int.Parse(DPRoutes.SelectedValue),
                    TotalAmount =Math.Abs( LastStopPrice - FirstStopPrice)
                };
                manager.AddBill(Bill);
                //Application["Bills"] = repo;
                lblMessage.Text = "Your Ride will Arive at " + DateTime.Now.AddMinutes(30).ToShortTimeString();
            }
        }
    }
}