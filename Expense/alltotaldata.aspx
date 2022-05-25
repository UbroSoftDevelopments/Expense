<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="alltotaldata.aspx.cs" Inherits="alltotaldata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<center><h2><b><u>Income</u></b></h2></center>
<div class="w3-col s3 w3-padding w3-center w3-large w3-mobile w3-pale-red" id="hospitalincomediv" runat="server" style="border-width:medium;border-color:Black;border-style:solid">

</div>
<div class="w3-col s3 w3-padding w3-center w3-large w3-mobile w3-pale-green" id="pathologyincomediv" runat="server" style="border-width:medium;border-color:Black;border-style:solid">

</div>
<div class="w3-col s3 w3-padding w3-center w3-large w3-mobile w3-pale-blue" id="medicalincomediv" runat="server" style="border-width:medium;border-color:Black;border-style:solid">

</div>
<div class="w3-col s3 w3-padding w3-center w3-large w3-mobile w3-pale-yellow" id="extraincomediv" runat="server" style="border-width:medium;border-color:Black;border-style:solid">

</div>
</div>
<div class="w3-row">
<center><h2><b><u>Expenses</u></b></h2></center>
<div class="w3-col s2 w3-padding w3-center w3-large w3-mobile">
<br />
</div>
<div class="w3-col s4 w3-padding w3-center w3-large w3-mobile w3-pale-red" id="dailyexpensesdiv" runat="server" style="border-width:medium;border-color:Black;border-style:solid">

</div>
<div class="w3-col s4 w3-padding w3-center w3-large w3-mobile w3-pale-yellow" id="doctorpaymentdiv" runat="server" style="border-width:medium;border-color:Black;border-style:solid">

</div>
<div class="w3-col s2 w3-padding w3-center w3-large w3-mobile">
<br />
</div>
</div>
<div class="w3-row">
<center><h2><b><u>Amount In Hand</u></b></h2></center>
<div class="w3-col s2 w3-padding w3-center w3-large w3-mobile">
<br />
</div>
<div class="w3-col s8 w3-padding w3-center w3-large w3-mobile w3-sand" style="border-width:medium;border-color:Black;border-style:solid">
<div class="w3-row">
<div class="w3-col s4 w3-padding w3-center w3-large w3-mobile w3-pale-yellow" id="totalincomediv" runat="server" style="border-width:medium;border-color:Black;border-style:solid">

</div>
<div class="w3-col s4 w3-padding w3-center w3-large w3-mobile w3-pale-red" id="totalexpensediv" runat="server" style="border-width:medium;border-color:Black;border-style:solid">

</div>
<div class="w3-col s4 w3-padding w3-center w3-large w3-mobile w3-pale-green" id="totalsavingdiv" runat="server" style="border-width:medium;border-color:Black;border-style:solid">

</div>
</div> 
</div>
<div class="w3-col s2 w3-padding w3-center w3-large w3-mobile">
<br />
</div>
</div>

</asp:Content>

