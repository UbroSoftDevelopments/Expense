<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patientexpensedata.aspx.cs" Inherits="patientexpensedata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center><b class="w3-xxlarge w3-text-deep-purple"><u>All Expenses On Patients</u></b></center>
 <div class="w3-row">
  <div class="w3-col s2 w3-mobile">&nbsp;</div>
  <div class="w3-col s8 w3-padding w3-center w3-mobile">
      <asp:GridView ID="GridView1" Width="100%" 
          CssClass="w3-table-all w3-center w3-centered" runat="server" 
          AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Exps1" 
          DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
            
              
              <asp:BoundField DataField="exp1" HeaderText="Amount" 
                  SortExpression="exp1" />
              <asp:TemplateField HeaderText="Patient Name">
            <ItemTemplate>
            <%#PatientUtilities.GetHospitalPatientFullNameByPatientNo(Convert.ToInt32(Eval("Exps1")))%>
            </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="View Details">
            <ItemTemplate>
           <a href="patientexpensedetails.aspx?pno=<%#Eval("Exps1") %>">View Details</a>
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
          SelectCommand="SELECT sum(amount) as exp1,patientno as Exps1 FROM [patientexpense] group by patientno order by patientno DESC"></asp:SqlDataSource>
  </div>
  <div class="w3-col s2 w3-mobile">&nbsp;</div>
 </div>
</asp:Content>

