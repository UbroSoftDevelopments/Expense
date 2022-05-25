<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dateselectforalldata.aspx.cs" Inherits="dateselectforalldata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<center><h1><b><u>Select Date For All Data</u></b></h1></center>
<div class="w3-row">
<center>
 <asp:Label ID="lblmessage" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
</center>
<div class="w3-col s4 w3-padding w3-mobile">&nbsp;</div>
<div class="w3-col s4 w3-padding w3-mobile w3-center w3-round-large w3-card-4 w3-pale-yellow" style="border-width:medium;border-style:solid;border-color:Black">
<b class="w3-xlarge">Select Date</b>
    <asp:TextBox ID="txtdate" AutoComplete="off" CssClass="w3-padding w3-card-2 w3-input w3-large w3-border w3-border-amber" runat="server"></asp:TextBox>
<br />
<center>
<asp:Button ID="btsubmit" 
        CssClass="w3-amber w3-large w3-padding w3-card-4 at-menubutton" runat="server" 
        Text="Get All Data>>" onclick="btsubmit_Click" />
</center>
</div>
<div class="w3-col s4 w3-padding w3-mobile">&nbsp;</div>
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

