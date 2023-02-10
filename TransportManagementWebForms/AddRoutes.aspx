<%@ Page Title="" Language="C#" MasterPageFile="~/TransportUI.Master" AutoEventWireup="true" CodeBehind="AddRoutes.aspx.cs" Inherits="TransportManagement.AddRoutes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <h1 class="h1" >Add Routes</h1>
            <div class="col-md-5">
                <p>Route Name :<asp:TextBox runat="server" CssClass="form-control" ID="txtRouteName" ></asp:TextBox></p>
                <p>Route Fare :<asp:TextBox runat="server" CssClass="form-control" ID="txtRouteFare" TextMode="Number"></asp:TextBox></p>
            </div>
            <div >
                <asp:Button CssClass="btn btn-success" runat="server" text="Add Route" OnClick="Unnamed1_Click"/>
                <asp:Label CssClass="text-danger" ID="txtMessage" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
