<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editcut.aspx.cs" Inherits="editcut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<center><h2><b><u>Edit Cut</u></b></h2></center>
<div class="w3-col s12 w3-mobile w3-padding w3-center w3-round-large w3-card-4">
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-center w3-centered w3-table-all" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            
            <asp:CommandField ShowEditButton="True" />
            
            <asp:BoundField DataField="patientname" HeaderText="patientname" 
                SortExpression="patientname" />
            <asp:BoundField DataField="ipno" HeaderText="ipno" SortExpression="ipno" />
           <asp:TemplateField HeaderText="Reffered By">
           <ItemTemplate>
           <%#refferedutilities.GetRefferedByNameBySno(Convert.ToInt32(Eval("refferedfrom"))) %>
           </ItemTemplate>
           </asp:TemplateField>
            <asp:BoundField DataField="completecut" HeaderText="Complete Cut" 
                SortExpression="completecut" />
            <asp:BoundField DataField="hospitalcut" HeaderText="Hospital Cut" 
                SortExpression="hospitalcut" />
            <asp:BoundField DataField="medicinecut" HeaderText="Medicine Cut" 
                SortExpression="medicinecut" />
            <asp:BoundField DataField="pathologycut" HeaderText="Pathology Cut" 
                SortExpression="pathologycut" />
           
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
        SelectCommand="SELECT * FROM [doctorcut] WHERE ([ipno] = @ipno)"
        UpdateCommand="UPDATE doctorcut set completecut=@completecut,hospitalcut=@hospitalcut,medicinecut=@medicinecut,pathologycut=@pathologycut where sno=@sno">
        <SelectParameters>
            <asp:QueryStringParameter Name="ipno" QueryStringField="ipno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>

</div>
</asp:Content>

