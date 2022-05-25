<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="verifiedlogin.aspx.cs" Inherits="verifiedlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="w3-row w3-padding w3-center">
 <div class="w3-col s2">&nbsp;</div>
 <div class="w3-col s8 w3-padding w3-center w3-card-4 w3-round-large" style="border-width:medium;border-style:solid;border-color:Black">
   <center><b>Please Wait... You Are Entering into the highly secure part of this software kindly enter code to login</b></center>
  <div class="w3-row">
  <div class="w3-col s1 w3-padding w3-center">&nbsp;</div>
   <div class="w3-col s10 w3-padding w3-center">
   <center>
       <asp:Label ID="lblmessage" CssClass="w3-large" runat="server" Text=""></asp:Label>
   </center><br />
    <b>Enter Code:-</b>
    <asp:TextBox ID="txtcode" TextMode="Password" CssClass="w3-large w3-border-black w3-border" runat="server"></asp:TextBox><br /><br />
       <asp:Button ID="btlogin" 
           CssClass="w3-button w3-amber at-menubutton w3-round-large w3-border w3-border-black w3-large" 
           runat="server" Text="Click To Verify" onclick="btlogin_Click" />

   </div>
    <div class="w3-col s1 w3-padding w3-center">&nbsp;</div>
  </div>
 </div>
<div class="w3-col s2">&nbsp;</div>
</div>
</asp:Content>

