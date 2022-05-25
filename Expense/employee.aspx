<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="employee.aspx.cs" Inherits="employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="w3-row">
   <center><b class="w3-text-deep-purple w3-xxlarge"><u>Add Employee/Person Details</u></b></center>
    <div class="w3-col s2 w3-mobile">&nbsp;</div>
    <div class="w3-col s8 w3-padding w3-center w3-card-4 w3-round-large w3-mobile" style="border-width:medium;border-color:Black;border-style:solid">
     <div class="w3-row">
     <center>
      <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
     </center>
      <div class="w3-col s5 w3-padding w3-center w3-mobile">
          <asp:Label ID="Label1" runat="server" Font-Bold="true" CssClass="w3-large" Text="Employee Name"></asp:Label>
          <asp:TextBox ID="txtemployeename" CssClass="w3-input w3-border w3-border-black" placeholder="Enter Name Of Employees" runat="server"></asp:TextBox>
      </div>
       <div class="w3-col s2 w3-padding w3-center w3-mobile">
          <asp:Label ID="Label2" runat="server" Font-Bold="true" CssClass="w3-large" Text="Gender"></asp:Label>
           <asp:DropDownList ID="ddgender" CssClass="w3-input w3-border w3-border-black" runat="server">
            <asp:ListItem Selected="True" Text="Select" Value="Select"></asp:ListItem>
            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
           </asp:DropDownList>
      </div>
       <div class="w3-col s5 w3-padding w3-center w3-mobile">
          <asp:Label ID="Label3" runat="server" Font-Bold="true" CssClass="w3-large" Text="Contact No."></asp:Label>
          <asp:TextBox ID="txtcontactno" CssClass="w3-input w3-border w3-border-black" placeholder="Enter Contact No." runat="server"></asp:TextBox>
      </div>
     </div>
     <div class="w3-row">
      <div class="w3-col s2 w3-mobile">&nbsp;</div>
      <div class="w3-col s8 w3-padding w3-center w3-mobile">
        <asp:Label ID="Label4" runat="server" Font-Bold="true" CssClass="w3-large" Text="Address"></asp:Label>
        <asp:TextBox ID="txtaddress" CssClass="w3-input w3-border w3-border-black" TextMode="MultiLine" placeholder="Enter Name Of Employees" runat="server"></asp:TextBox>
        <br />
       <center>
           <asp:Button ID="btsubmit" 
               CssClass="w3-button w3-amber w3-padding at-menubutton w3-large w3-border w3-border-black" 
               runat="server" Text="Click To Add" onclick="btsubmit_Click" />
           <asp:Button ID="btreset" 
               CssClass="w3-button w3-amber w3-padding at-menubutton w3-large w3-border w3-border-black" 
               runat="server" Text="Reset" onclick="btreset_Click" />
       </center>
      </div>
      <div class="w3-col s2 w3-mobile">&nbsp;</div>

     </div>
    </div>
    <div class="w3-col s2 w3-mobile">&nbsp;</div>
   </div>
   <br />
   <div class="w3-row">
    <div class="w3-col s2 w3-mobile">&nbsp;</div>
    <div class="w3-col s8 w3-padding w3-center w3-mobile">
        <asp:GridView ID="GridView1" Width="100%" 
            CssClass="w3-center w3-centered w3-table-all" runat="server" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:CommandField ShowEditButton="True" />
                
                <asp:BoundField DataField="employeename" HeaderText="Employee Name" 
                    SortExpression="employeename" />
                <asp:BoundField DataField="gender" ReadOnly="true" HeaderText="Gender" 
                    SortExpression="gender" />
                <asp:BoundField DataField="address" HeaderText="Address" 
                    SortExpression="address" />
                <asp:BoundField DataField="contactno" HeaderText="Contact No" 
                    SortExpression="contactno" />
                
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
            SelectCommand="SELECT * FROM [employee] ORDER BY [employeename], [sno] DESC"
            UpdateCommand="Update employee set employeename=@employeename,address=@address,contactno=@contactno where sno=@sno">
        </asp:SqlDataSource>
    </div>
    <div class="w3-col s2 w3-mobile">&nbsp;</div>
   </div>
</asp:Content>

