<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="selectpatienttoaddexpense.aspx.cs" Inherits="selectpatienttoaddexpense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <center><b class="w3-xxlarge w3-text-deep-purple"><u>Select Patient</u></b></center>
 <div class="w3-row w3-center">
    <asp:GridView ID="GridView1" CssClass="w3-center w3-centered w3-table-all" 
        Width="100%" runat="server" CellPadding="4"  ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False" DataKeyNames="patientno" 
        DataSourceID="SqlDataSource1">
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
         <asp:BoundField DataField="ipnumber" HeaderText="IP Number" 
                SortExpression="ipnumber" />
           <asp:TemplateField HeaderText="Department">
            <ItemTemplate>
             <%#DepartmentUtilities.GetDepartmentNameByDepartmentNo(Convert.ToInt32(Eval("departmentno"))) %>
            </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="Date">
             <ItemTemplate>
              <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("dateofentry")))%>
             </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Patient Name">
            <ItemTemplate>
            <%#PatientUtilities.GetHospitalPatientFullNameByPatientNo(Convert.ToInt32(Eval("patientno"))) %>
            </ItemTemplate>
           </asp:TemplateField>
            <asp:BoundField DataField="gender" HeaderText="Gender" 
                SortExpression="gender" />
            <asp:BoundField DataField="address" HeaderText="Address" 
                SortExpression="address" />
          <asp:BoundField DataField="mobileno" HeaderText="Mobile No" 
                SortExpression="mobileno" />
           <asp:TemplateField HeaderText="Add Expense">
            <ItemTemplate>
             <a class="w3-text-red w3-large" href="patientexpense.aspx?pno=<%#Eval("patientno") %>">Select</a>
            </ItemTemplate>
           </asp:TemplateField>
           
          
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:geetahospitalConnectionString %>" 
        SelectCommand="SELECT * FROM [opdform] ORDER BY [patientno] DESC">
    </asp:SqlDataSource>
</div>
</asp:Content>

