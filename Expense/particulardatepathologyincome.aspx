<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="particulardatepathologyincome.aspx.cs" Inherits="particulardatepathologyincome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<center><h2><u>Details</u></h2></center>
<div class="w3-col s1 w3-mobile">
<br />
</div>
<div class="w3-col s10 w3-padding w3-center w3-mobile">
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-center w3-centered w3-table-all" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
          <asp:TemplateField HeaderText="Patient Name">
          <ItemTemplate>
          <%#PatientTestUtilities.GetPatientNameFromPathology(Convert.ToInt32(Eval("sno"))) %>
          </ItemTemplate>
          </asp:TemplateField>
              <asp:TemplateField HeaderText="Date Of Payment">
          <ItemTemplate>
          <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("collectiondate")))%>
          </ItemTemplate>
          </asp:TemplateField>
           <asp:TemplateField HeaderText="Paid Amount">
          <ItemTemplate>
          <%#ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyAfterDiscountByPatientNo(Convert.ToInt32(Eval("sno")))%>
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
        ConnectionString="<%$ ConnectionStrings:geetanjalipathologyConnectionString %>" 
        
        SelectCommand="SELECT * FROM [patient_details] WHERE (CAST([collectiondate] as date) = @collectiondate)">
        <SelectParameters>
            <asp:QueryStringParameter Name="collectiondate" QueryStringField="d" 
                Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
<div class="w3-col s1 w3-mobile"><br /></div>
</div>
</asp:Content>
