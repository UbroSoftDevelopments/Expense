<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
 <div class="w3-col s4 w3-padding-large w3-center w3-mobile">
  <div class="w3-padding-large w3-center w3-pale-green w3-card-4 w3-round-large">
      <asp:Label ID="lbltotalincometilldate" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
  </div>
 </div>
 <div class="w3-col s4 w3-padding-large w3-center w3-mobile">
 <div class="w3-padding-large w3-center w3-pale-red w3-card-4 w3-round-large">
   <asp:Label ID="lbltotalexpensetilldate" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
  </div>
 </div>
 <div class="w3-col s4 w3-padding-large w3-center w3-mobile">
  <div class="w3-padding-large w3-center w3-pale-yellow w3-card-4 w3-round-large">
   <asp:Label ID="lbltotalcashinhand" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
  </div>
 </div>
</div>
<br />
<div class="w3-row">
 <div class="w3-col s1 w3-mobile">&nbsp;</div>
 <div class="w3-col s10 w3-padding w3-center w3-pale-red w3-mobile w3-card-4 w3-round-large" style="border-width:medium;border-color:Black;border-style:solid">
  <b>Select Year from The List To See Details </b>
     <asp:DropDownList ID="ddselectyear" Width="20%" CssClass="w3-large w3-padding w3-large w3-border w3-border-black" runat="server">
     </asp:DropDownList>
     <asp:Button ID="btsearch" CssClass="w3-button at-menubutton w3-amber w3-border w3-border-black w3-round-large" runat="server" Text="Click To View" />
 </div>
 
 <div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>
<br />  
<div class="w3-row">
 <asp:GridView ID="grdGv" Width="100%" 
        CssClass="w3-center w3-centered w3-table-all w3-medium" runat="server" ShowFooter="true"
        onrowdatabound="grdGv_RowDataBound" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
        ondatabound="grdGv_DataBound">
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

