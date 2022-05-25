<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="selectemployeeforpayment.aspx.cs" Inherits="selectemployeeforpayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="w3-row">
  <center><b class="w3-text-deep-purple w3-xxlarge"><u>Select For Payment And All Details</u></b></center>
  <div class="w3-col s4 w3-mobile">&nbsp;</div>
  <div class="w3-col s4 w3-padding w3-center w3-card-4 w3-round-large w3-mobile" style="border-style:solid;border-color:Black;border-width:medium">
    <center>
    <asp:Label ID="lblmesage" runat="server" Text=""></asp:Label><br />
    <b class="w3-text-red w3-xlarge"><u>Select Employee</u></b></center>
      <asp:DropDownList ID="ddemployee" CssClass="w3-input w3-border w3-border-black" AppendDataBoundItems="true" 
          Width="100%" runat="server" DataSourceID="SqlDataSource1" 
          DataTextField="employeename" DataValueField="sno">
          <asp:ListItem Selected="True" Text="-Select-" Value="-1"></asp:ListItem>
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
          SelectCommand="SELECT * FROM [employee] ORDER BY [employeename]">
      </asp:SqlDataSource>
      <br />
        <asp:Button ID="btsubmit" 
               CssClass="w3-button w3-amber w3-padding at-menubutton w3-large w3-border w3-border-black" 
               runat="server" Text="Click To Proceed" onclick="btsubmit_Click"  />
  </div>
  <div class="w3-col s4 w3-mobile">&nbsp;</div>
 </div>

</asp:Content>

