<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patienttestdetails.aspx.cs" Inherits="patienttestdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<div class="w3-col s1 w3-mobile">&nbsp;</div>
<div class="w3-col s10 w3-mobile w3-padding w3-center">
    <asp:GridView ID="GridView1" CssClass="w3-table-all w3-center w3-centered" 
        Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="sno" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
           
          <asp:TemplateField HeaderText="Patient Name">
          <ItemTemplate>
          <%#PatientTestUtilities.GetPatientName(Convert.ToInt32(Eval("patientno"))) %>
          </ItemTemplate>
          </asp:TemplateField>
           <asp:TemplateField HeaderText="Test Applied">
          <ItemTemplate>
          <%#PatientTestUtilities.GetTestNameBySno(Convert.ToInt32(Eval("testno"))) %>
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
        SelectCommand="SELECT * FROM [patients_test_details] WHERE ([patientno] = @patientno)">
        <SelectParameters>
            <asp:QueryStringParameter Name="patientno" QueryStringField="pno" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br />
    <asp:Button ID="btsetcut" runat="server" Text="Set Cut" 
        CssClass="w3-button w3-amber w3-round-large w3-card-4 w3-xlarge" 
        onclick="btsetcut_Click" />
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

