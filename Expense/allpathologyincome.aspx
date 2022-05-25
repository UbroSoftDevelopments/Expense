<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="allpathologyincome.aspx.cs" Inherits="allpathologyincome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<center><h2><u>Payments From Pathology</u></h2></center>
<div class="w3-col s1 w3-mobile">
&nbsp;
</div>
<div class="w3-col s10 w3-padding w3-mobile w3-center">
 <div class="w3-row">
    <div class="w3-col s3 w3-mobile">&nbsp;</div>
    <div class="w3-col s6 w3-padding w3-mobile">
        <asp:Label ID="lblmessage" runat="server" Text="" CssClass="w3-large"></asp:Label>
     <asp:TextBox ID="txtsearch" AutoComplete="off" style="padding-left:5px" runat="server" placeholder="Select Date To Search" CssClass="w3-border w3-border-amber w3-large"></asp:TextBox>
                        <asp:Button ID="btsearch" runat="server" Text="Search" 
                            CssClass="w3-button w3-amber w3-small" 
            onclick="btsearch_Click" />
    </div>
    <div class="w3-col s3">&nbsp;</div>
   </div>
<br />
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-center w3-centered w3-table-all" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" onrowdatabound="GridView1_RowDataBound">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        <Columns>
        
        </Columns>
    </asp:GridView>
</div>
<div class="w3-col s1 w3-mobile">
&nbsp;
</div>
</div>
     <script type="text/javascript">
         $(function () {
             $(function () {
                 var currentYear = (new Date).getFullYear();
                 var currentMonth = (new Date).getMonth() + 1;
                 var currentDay = (new Date).getDate();
                 $("#datepicker").datepicker({ minDate: new Date((currentYear - 1), 12, 1), dateFormat: 'dd/mm/yy', maxDate: new Date(currentYear, 11, 31) });

                 $("#ContentPlaceHolder1_txtsearch").datepicker({

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

