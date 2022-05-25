<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblcount" runat="server" Text="Label"></asp:Label><br />
    <asp:TextBox ID="txtdate" TextMode="Date" AutoComplete="off" runat="server"></asp:TextBox><br />
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />

    <div class="w3-col s10 w3-padding w3-mobile w3-center">
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-center w3-centered w3-table-all" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" >
        <Columns>
         
           
            <asp:BoundField DataField="a" HeaderText="dateofpayment" 
                SortExpression="a" />
            <asp:BoundField DataField="b" HeaderText="amount" 
                SortExpression="b" />
          
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:geetahospitalConnectionString %>" 
            SelectCommand="SELECT SUM(amount) as b, CAST(dateofpayment AS date) as a FROM payments GROUP BY dateofpayment order by dateofpayment desc"></asp:SqlDataSource>

</asp:Content>

