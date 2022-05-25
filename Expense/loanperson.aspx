<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="loanperson.aspx.cs" Inherits="loanperson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<center><h2><b>Laon/Person Data</b></h2></center>
<div class="w3-row">
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-padding w3-center w3-round-large w3-card-4 w3-mobile" style="border-width:medium;border-style:solid;border-color:Black">

    <asp:Label ID="lblmessage" runat="server" Text="" Font-Bold="true"></asp:Label>
   <div class="w3-row">
   <div class="w3-col s6 w3-padding w3-mobile">
   <b class=" w3-xlarge"> Name</b><br />
    <asp:TextBox ID="txtname" CssClass="w3-input w3-border-blue w3-border" placeholder="Enter Name" runat="server"></asp:TextBox>
   
</div>
<div class="w3-col s6 w3-padding w3-mobile">
<b class=" w3-xlarge">Mobile No.</b><br />
    <asp:TextBox ID="txtmobileno" TextMode="Number" CssClass="w3-input w3-border-blue w3-border" placeholder="Enter Mobile No." runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<div class="w3-col s2 w3-mobile">&nbsp;</div>
<div class="w3-col s8 w3-padding w3-mobile">
 <b class=" w3-xlarge">Address</b><br />
    <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="w3-input w3-border-blue w3-border" placeholder="Enter Address" runat="server"></asp:TextBox>
</div>
<div class="w3-col s2 w3-mobile">&nbsp;</div>
</div>
 <br />
    <asp:Button ID="btsubmit" 
        CssClass="at-menubutton w3-large w3-round w3-card-4 w3-amber w3-padding" runat="server" 
        Text="ADD PERSON" onclick="btsubmit_Click" />
         <asp:Button ID="Button1" 
        CssClass="at-menubutton w3-large w3-round w3-card-4 w3-amber w3-padding" runat="server" 
        Text="Reset" onclick="Button1_Click" />
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
      
            <asp:BoundField DataField="personname" HeaderText="Person Name" 
                SortExpression="personname" />
            <asp:BoundField DataField="mobileno" HeaderText="Mobile No." 
                SortExpression="mobileno" />
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
        SelectCommand="SELECT * FROM [loanpersons] ORDER BY [personname]"
        UpdateCommand="Update loanpersons set personname=@personname,mobileno=@mobileno,address=@address where sno=@sno">
    </asp:SqlDataSource>
        </div>
  <div class="w3-col s3 w3-mobile">&nbsp;</div>
  </div>
        
</asp:Content>

