<%@ Page Title="" Language="C#" MasterPageFile="~/TransportUI.Master" AutoEventWireup="true" CodeBehind="BookRoute.aspx.cs" Inherits="TransportManagement.BookRoute" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
                <h1>Booking Route</h1>
                
            <div class="col-md-5">
                <p>Route Name :<asp:DropDownList runat="server" CssClass="form-control" ID="DPRoutes" AutoPostBack="True" OnSelectedIndexChanged="DPRoutes_SelectedIndexChanged">
                    
                               </asp:DropDownList></p>
                <div class="row">
                    <div class="col-md-5">
                <p>From :<asp:DropDownList runat="server" CssClass="form-control" ID="fromRoute" AutoPostBack="True"  > </asp:DropDownList> </p></div>
                      <div class="col-md-5"> <p>To :<asp:DropDownList runat="server"  CssClass="form-control" ID="toRoute" AutoPostBack="True" > </asp:DropDownList></p></div>
                    </div>
            <asp:Button runat="server" CssClass="btn btn-success" Text="Submit" ID="btnSuccess" OnClick="btnSuccess_Click" />
                <asp:Label runat="server" ID="lblMessage" CssClass="text-danger">

                </asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
