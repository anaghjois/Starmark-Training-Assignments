//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TransportManagementLib
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblPickUp
    {
        public int PickupId { get; set; }
        public string PickUpPointName { get; set; }
        public Nullable<int> RouteID { get; set; }
        public int PickUpPrice { get; set; }
    
        public virtual tblRoute tblRoute { get; set; }
    }
}
