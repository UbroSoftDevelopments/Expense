<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="receivedholdpayment.aspx.cs" Inherits="receivehodpayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<center><h1><b> Receive Hold/Pending Amounts</b></h1></center>
<div class="w3-col s2 w3-mobile">&nbsp;</div>
<div class="w3-col s8 w3-padding w3-center w3-mobile">
    <asp:GridView ID="GridView1" CssClass="w3-table-all w3-center w3-centered" 
        Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="sno" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EmptyDataTemplate>
        <div class="w3-xlarge w3-pale-green w3-text-red">
        No. Payment Received Yet!!
        </div>
        </EmptyDataTemplate>
        <Columns>
              <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
            <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("dateofreceiving"))) %>
            </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Amount">
            <ItemTemplate>
            <%#HoldAmountUtilities.GetHoldAmountByHoldNo(Convert.ToInt32(Eval("holdamountno")))%>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="comments" HeaderText="Comments" 
                SortExpression="comments" />
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
        SelectCommand="SELECT * FROM [receiveholdamountdata] ORDER BY [dateofreceiving] DESC">
    </asp:SqlDataSource>
</div>
<div class="w3-col s2 w3-mobile">&nbsp;</div>
</div>

</asp:Content>

