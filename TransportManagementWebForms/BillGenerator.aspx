<%@ Page Title="" Language="C#" MasterPageFile="~/TransportUI.Master" AutoEventWireup="true" CodeBehind="BillGenerator.aspx.cs" Inherits="TransportManagement.BillGenerator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="clo-md-5 border-1">
                <h3 class="h3" style="align-content:center">Monthly Transpotation Bill</h3>
                <div class="row">
                    <div class="col-md-3">
                        <p>Bill No :<asp:Label runat="server" ID="RndNo" /></p>
                    </div>
                    <div class="col-md-6"><p>Date : <asp:Label runat="server" ID="txtDate"/></p></div>
                </div>
                <p>No of Employees Travelled : <asp:Label ID="txtNo" runat="server" /></p>
                <p>Amount Employees Paid : <asp:Label ID="EmpAmt" runat="server" /></p>
                <p>Amount Company Pays : <asp:Label ID="ComAmt" runat="server" /></p>
            </div>
        </div>
    </div>
</asp:Content>
