<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="refferedbyname.aspx.cs" Inherits="refferedbyname" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br />
<center><h2><b>Reffered Person Name</b></h2></center>
<div class="w3-row">
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-padding w3-center w3-round-large w3-card-4 w3-mobile" style="border-width:medium;border-style:solid;border-color:Black">

    <asp:Label ID="lblmessage" runat="server" Text="" Font-Bold="true"></asp:Label>
   <div class="w3-row">
   <div class="w3-col s6 w3-padding w3-mobile">
   <b class=" w3-xlarge">Add Name</b><br />
    <asp:TextBox ID="txtname" CssClass="w3-input w3-border-blue w3-border" placeholder="Enter Dr./Person Name" runat="server"></asp:TextBox>
   
</div>
<div class="w3-col s6 w3-padding w3-mobile">
 <b class=" w3-xlarge">Person Address</b><br />
    <asp:TextBox ID="txtaddress" CssClass="w3-input w3-border-blue w3-border" placeholder="Enter Address" runat="server"></asp:TextBox>
</div>
</div>
 <br />
    <asp:Button ID="btsubmit" 
        CssClass="at-menubutton w3-large w3-round w3-card-4 w3-amber" runat="server" 
        Text="ADD PERSON" onclick="btsubmit_Click" />
</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>
</div>
<br />
<div class="w3-row">
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-center w3-mobile">
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-table-all w3-center w3-centered" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            
            <asp:CommandField ShowEditButton="True" />
            
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="address" HeaderText="Address" 
                SortExpression="address" />
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
        SelectCommand="SELECT * FROM [refferedpersons] ORDER BY [name]"
        UpdateCommand="Update refferedpersons set name=@name and address=@address where sno=@sno">
    </asp:SqlDataSource>
</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

