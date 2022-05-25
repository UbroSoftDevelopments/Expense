<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="receivependingamount.aspx.cs" Inherits="receivependingamount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center><h1><b><u>Receive Amount</u></b></h1></center>
<div class="w3-row">
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile w3-round-large w3-card-4 w3-pale-yellow" style="border-width:medium;border-color:Black;border-style:solid">
<center>
    <asp:Label ID="lblmessage" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
</center>
<div class="w3-row">
<div class="w3-col s6 w3-padding w3-center w3-mobile w3-large">
    <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Date"></asp:Label>
    <asp:TextBox ID="txtdate" AutoComplete="off" CssClass="w3-input w3-border w3-border-black w3-large" runat="server"></asp:TextBox>
</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile w3-large">
    <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Amount To Take"></asp:Label>
    <asp:TextBox ID="txtamount" ReadOnly="true" CssClass="w3-input w3-border w3-border-black w3-large" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<div class="w3-col s2 w3-mobile">&nbsp;</div>
<div class="w3-col s8 w3-padding w3-center w3-mobile w3-large">
  <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Comments"></asp:Label>
   <asp:TextBox ID="txtcomment" TextMode="MultiLine" CssClass="w3-input w3-border w3-border-black w3-large" runat="server"></asp:TextBox>
   <br />
   <asp:Button ID="btsubmit" 
        CssClass="w3-amber w3-large w3-padding w3-card-4 at-menubutton" runat="server" 
        Text="Submit" onclick="btsubmit_Click" />
</div>
<div class="w3-col s2 w3-mobile">&nbsp;</div>
</div>
</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>
</div>
 <script type="text/javascript">
     $(function () {
         $(function () {
             var currentYear = (new Date).getFullYear();
             var currentMonth = (new Date).getMonth() + 1;
             var currentDay = (new Date).getDate();
             $("#datepicker").datepicker({ minDate: new Date((currentYear - 1), 12, 1), dateFormat: 'dd/mm/yy', maxDate: new Date(currentYear, 11, 31) });

             $("#ContentPlaceHolder1_txtdate").datepicker({

                 changeMonth: true,
                 changeYear: true,
                 yearRange: '1950:currentYear',
                 dateFormat: 'dd-M-yy',
                 defaultDate: 'currentdate'
             });
         });

     });
    </script>
</asp:Content>

