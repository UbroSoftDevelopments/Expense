<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patientlist.aspx.cs" Inherits="patientlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="w3-row">
<div class="w3-col s1 w3-mobile">&nbsp;</div>
<div class="w3-col s10 w3-padding w3-center w3-mobile">
    <asp:GridView ID="GridView1" CssClass="w3-center w3-centered w3-table-all" 
        Width="100%" runat="server" CellPadding="4"  ForeColor="#333333" 
        GridLines="None" onrowdatabound="GridView1_RowDataBound">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:geetahospitalConnectionString %>" 
        SelectCommand="SELECT * FROM [opdform] ORDER BY [patientno] DESC">
    </asp:SqlDataSource>
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

