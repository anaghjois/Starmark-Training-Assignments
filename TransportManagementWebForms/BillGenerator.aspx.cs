using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TransportManagementLib;

namespace TransportManagement
{
    public partial class BillGenerator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Random rnd = new Random();
            RndNo.Text = rnd.GetHashCode().ToString();
            txtDate.Text = DateTime.Today.ToShortDateString();
            var TotalAmt = 0;
            var repo = new TransportManager();
            var BillList = repo.GetAllBills();
            txtNo.Text = BillList.Count.ToString();
            foreach (var Bill in BillList)
            {
                TotalAmt += Bill.TotalAmount;
                EmpAmt.Text = TotalAmt.ToString();
                ComAmt.Text = (TotalAmt * 2).ToString();
            }
        }
    }
}