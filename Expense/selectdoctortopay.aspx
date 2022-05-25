<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="selectdoctortopay.aspx.cs" Inherits="selectdoctortopay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br /><br /><br />
<div class="w3-row">
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile w3-round-large w3-card-4" style="border-width:medium;border-style:solid;border-color:Blue">
<div class="w3-row">
<center><b class="w3-xlarge">Select Doctor To Pay</b>
<br />
    <asp:Label ID="lblmessage" runat="server" Font-Bold="true" Text=""></asp:Label>
</center>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
<div class="w3-col s10 w3-padding w3-mobile w3-center">
    <asp:DropDownList ID="ddrefferedlist" 
        CssClass="w3-input w3-round-large w3-border w3-border-black w3-card-4"
        runat="server" DataSourceID="SqlDataSource1" DataTextField="name" 
        DataValueField="sno">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
        SelectCommand="SELECT * FROM [refferedpersons] ORDER BY [name]">
    </asp:SqlDataSource>
    <br /><br />
    <asp:Button ID="btproceed" runat="server" 
        CssClass="w3-button w3-blue at-menubutton w3-round-large w3-card-4 w3-large" 
        Text="Proceed" onclick="btproceed_Click" />
    <br />
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>
</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

