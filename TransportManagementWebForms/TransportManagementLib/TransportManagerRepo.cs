using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransportManagementLib
{
    public interface ITransportManager
    {
        void AddRoute(tblRoute route);
        void AddPickup(tblPickUp tblPickUp);
        void AddBill(tblBill bill);
        List<tblRoute> GetAllRoutes();
        List<tblPickUp> GetAllPickUps();
        List<tblBill> GetAllBills();
    }
    public class TransportManager : ITransportManager
    {
        private readonly TransportEntities context = new TransportEntities();
        public void AddBill(tblBill bill)
        {
            context.tblBills.Add(new tblBill
            {
                EmployeeID = bill.EmployeeID,
                RouteID = bill.RouteID,
                TotalAmount = bill.TotalAmount
            });
            context.SaveChanges();
        }

        public void AddPickup(tblPickUp tblPickUp)
        {
            context.tblPickUps.Add(tblPickUp);
            context.SaveChanges();
        }

        public void AddRoute(tblRoute route)
        {
            context.tblRoutes.Add(route);
            context.SaveChanges();
        }

        public List<tblBill> GetAllBills()
        {
            var Bills = context.tblBills.ToList();
            return Bills;
        }
        
        public List<tblPickUp> GetAllPickUps()
        {
            var PickupPoints = context.tblPickUps.ToList();
            return PickupPoints;
        }

        public List<tblRoute> GetAllRoutes()
        {
            var Routes = context.tblRoutes.ToList();
            return Routes;
        }
    }
}
