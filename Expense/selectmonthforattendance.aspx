<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="selectmonthforattendance.aspx.cs" Inherits="selectmonthforattendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="w3-row">
<center><h2><b><u>Month Selection</u></b></h2></center>
<div class="w3-col s4 w3-mobile">&nbsp;</div>
<div class="w3-col s4 w3-mobile w3-padding w3-center w3-round-large w3-card-4" style="border-width:medium;border-style:solid;border-color:Black">
    <asp:Label ID="lblmessage" runat="server" Text="" Font-Bold="true" CssClass="w3-large"></asp:Label>
   <br /> <asp:DropDownList ID="ddmonth" Width="100%" CssClass="w3-padding" runat="server">
    <asp:ListItem Selected="True" Text="--Select Month--" Value="-1"></asp:ListItem>
    <asp:ListItem Text="January" Value="1"></asp:ListItem>
    <asp:ListItem Text="Feburary" Value="2"></asp:ListItem>
    <asp:ListItem Text="March" Value="3"></asp:ListItem>
    <asp:ListItem Text="April" Value="4"></asp:ListItem>
    <asp:ListItem Text="May" Value="5"></asp:ListItem>
    <asp:ListItem Text="June" Value="6"></asp:ListItem>
    <asp:ListItem Text="July" Value="7"></asp:ListItem>
    <asp:ListItem Text="August" Value="8"></asp:ListItem>
    <asp:ListItem Text="September" Value="9"></asp:ListItem>
    <asp:ListItem Text="October" Value="10"></asp:ListItem>
    <asp:ListItem Text="November" Value="11"></asp:ListItem>
    <asp:ListItem Text="December" Value="12"></asp:ListItem>
</asp:DropDownList>
<br /><br />
    <asp:Button ID="btproceed" CssClass="at-menubutton w3-button w3-amber w3-card-4 w3-large" runat="server" Text="Proceed >>" />
<br />
</div>
<div class="w3-col s4 w3-mobile">&nbsp;</div>

</div>
</asp:Content>

