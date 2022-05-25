<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dailyexpense.aspx.cs" Inherits="dailyexpense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center><h2><b><u>All Expenses</u></b></h2></center>
<div class="w3-row">
<div class="w3-col s1 w3-mobile">&nbsp;</div>
<div class="w3-col s10 w3-padding w3-center w3-mobile">
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-center w3-centered w3-table-all" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
           
            <asp:BoundField DataField="exp1" HeaderText="Amount" 
                SortExpression="exp1" />
           <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
            <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("Exps1"))) %>
            </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="View Details">
            <ItemTemplate>
           <a href="allexpenses.aspx?d=<%#Eval("Exps1") %>">View Details</a>
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
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
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
        SelectCommand="SELECT sum(amount) as exp1,(CAST(date as date)) as Exps1 FROM [dailyexpences] group by date order by Exps1 desc">
    </asp:SqlDataSource>
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

