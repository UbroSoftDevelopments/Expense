<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="paidloan.aspx.cs" Inherits="paidloan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<center><h2><b><u>Paid Details</u></b></h2></center>
<div class="w3-col s1 w3-mobile">
&nbsp;
</div>
<div class="w3-col s10 w3-mobile w3-center w3-padding w3-round-large w3-card-4">
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-center w3-centered w3-table-all" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EmptyDataTemplate>
        <div class="w3-border w3-border-black w3-round-large w3-pale-green w3-text-red w3-xlarge">
        No.Paid Loan Data
        </div>
        </EmptyDataTemplate>
        <Columns>
            
            <asp:TemplateField HeaderText="Given BY">
            <ItemTemplate>
            <%#LoanUtilities.GetLoanPersonNameBySno(Convert.ToInt32(Eval("loangivenpersonno")))%>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText="Amount" 
                SortExpression="amount" />
            <asp:TemplateField HeaderText="Taken On">
            <ItemTemplate>
            <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("date")))%>
            </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Return No">
            <ItemTemplate>
            <%#DateUtilties.FormattedDate(LoanUtilities.GetLoanPaidDateByLoanNo(Convert.ToInt32(Eval("sno"))))%>
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
        SelectCommand="SELECT * FROM [loandata] where status='Paid' ORDER BY [date] DESC, [amount] DESC">
    </asp:SqlDataSource>
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>

</asp:Content>

