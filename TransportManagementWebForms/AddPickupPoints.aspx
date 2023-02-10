<%@ Page Title="" Language="C#" MasterPageFile="~/TransportUI.Master" AutoEventWireup="true" CodeBehind="AddPickupPoints.aspx.cs" Inherits="TransportManagement.AddPickupPoints" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <h1 class="h1">Add Pick Up Points to Routes</h1>
            <div class="col-md-5">
                <p>Available Routes :<asp:DropDownList runat="server" ID="DpRoutes" CssClass="form-control" AutoPostBack="True" ></asp:DropDownList></p>
                <p>Pick Up Point Names : <asp:TextBox runat="server" ID="txtPoint" CssClass="form-control"></asp:TextBox></p>
                <p>Amount : <asp:TextBox TextMode="Number" runat="server" ID="txtAmount" CssClass="form-control"></asp:TextBox></p>
                <asp:Button Text ="Add Points" runat="server"  CssClass="btn btn-success" OnClick="Unnamed1_Click"/>
                <asp:Label runat="server" ID="lblMessage"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
