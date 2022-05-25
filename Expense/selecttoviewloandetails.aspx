<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="selecttoviewloandetails.aspx.cs" Inherits="selecttoviewloandetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="w3-row">
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile w3-round-large w3-card-4">
<div class="w3-row">
<center> <asp:Label ID="lblmesaage" runat="server" Font-Bold="true" style="font-size:medium" Text=""></asp:Label></center>
<div class="w3-col s12 w3-mobile w3-padding w3-center">
    <h2><b>Select Person</b></h2>
    <asp:DropDownList ID="ddloanperson" 
        CssClass="w3-border w3-border-teal w3-large w3-input w3-sand" 
        AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="personname" DataValueField="sno">
    <asp:ListItem Selected="True" Text="Select Person Name" Value="-1"></asp:ListItem>
    </asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
        SelectCommand="SELECT * FROM [loanpersons] ORDER BY [personname]">
    </asp:SqlDataSource>
    <br />
    <center>
      <asp:Button ID="btsubmit" runat="server" Text="Proceed >>" 
        CssClass="w3-large w3-button w3-round-large at-menubutton w3-teal" 
            onclick="btsubmit_Click" />
    </center>
</div>
</div>
</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

