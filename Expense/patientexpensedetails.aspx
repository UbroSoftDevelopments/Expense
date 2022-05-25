<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patientexpensedetails.aspx.cs" Inherits="patientexpensedetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center><b class="w3-xxlarge w3-text-deep-purple"><u>Perticular Patient Data</u></b></center>
  <div class="w3-row">
   <center>
       <asp:Label ID="lblpatientname" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label><br />
       <asp:Label ID="lblpatientamount" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
   </center><br />
   <div class="w3-col s4 w3-padding-large w3-center w3-mobile w3-pale-yellow" style="border-width:medium;border-style:solid;border-color:Black">
     <asp:Label ID="lblopddate" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
   </div>
    <div class="w3-col s4 w3-padding-large w3-center w3-mobile w3-pale-red" style="border-width:medium;border-style:solid;border-color:Black">
     <asp:Label ID="lblipddate" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
   </div>
    <div class="w3-col s4 w3-padding-large w3-center w3-mobile w3-pale-green" style="border-width:medium;border-style:solid;border-color:Black">
     <asp:Label ID="lbldischarge" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
   </div>
  </div>
 <div class="w3-row">
  <div class="w3-col s2 w3-mobile">&nbsp;</div>
  <div class="w3-col s8 w3-padding w3-center w3-mobile">
      <asp:GridView ID="GridView1" Width="100%" 
          CssClass="w3-table-all w3-center w3-centered" runat="server" 
          AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
          DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:TemplateField HeaderText="Date Of Expense">
                  <ItemTemplate>
                   <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("dateofexpense")))%>
                  </ItemTemplate>
                  </asp:TemplateField>
             
              <asp:BoundField DataField="amount" HeaderText="Amount" 
                  SortExpression="amount" />
             
              <asp:BoundField DataField="reasonofexpense" HeaderText="Reason Of Expense" 
                  SortExpression="reasonofexpense" />
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
          SelectCommand="SELECT * FROM [patientexpense] WHERE ([patientno] = @patientno) ORDER BY [dateofexpense] DESC, [amount] DESC">
          <SelectParameters>
              <asp:QueryStringParameter Name="patientno" QueryStringField="pno" 
                  Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
  <div class="w3-col s2 w3-mobile">&nbsp;</div>
 </div>
</asp:Content>

