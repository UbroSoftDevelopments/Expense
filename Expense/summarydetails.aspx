<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="summarydetails.aspx.cs" Inherits="summarydetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
 <div class="w3-col s4 w3-padding-large w3-center w3-mobile">
  <div class="w3-padding-large w3-center w3-pale-green w3-card-4 w3-round-large">
      <asp:Label ID="lbltotalincomeinmonth" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
  </div>
 </div>
 <div class="w3-col s4 w3-padding-large w3-center w3-mobile">
 <div class="w3-padding-large w3-center w3-pale-red w3-card-4 w3-round-large">
   <asp:Label ID="lbltotalexpenseinmonth" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
  </div>
 </div>
 <div class="w3-col s4 w3-padding-large w3-center w3-mobile">
  <div class="w3-padding-large w3-center w3-pale-yellow w3-card-4 w3-round-large">
   <asp:Label ID="lbltotalcashinhandinmonth" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
  </div>
 </div>
</div>
<br />
<div class="w3-row w3-padding w3-center">
    <asp:GridView ID="Gdview" Width="100%"  ShowFooter="True"
        CssClass="w3-table-all w3-center w3-centered" runat="server" 
        ondatabound="Gdview_DataBound" onrowdatabound="Gdview_RowDataBound" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <FooterStyle BackColor="#000000" ForeColor="White" Font-Bold="true" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
</div>
</asp:Content>

