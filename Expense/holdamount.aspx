<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="holdamount.aspx.cs" Inherits="holdamount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<center><h1><b>Hold/Pending Amounts</b></h1></center>
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile" style="border-width:medium;border-style:solid;border-color:Black">
<div class="w3-row">
<center>
    <asp:Label ID="lblmessage" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
</center>
<div class="w3-col s6 w3-padding w3-center w3-mobile">
    <asp:Label ID="Label1" runat="server" CssClass="w3-large" Font-Bold="true" Text="Date"></asp:Label>
    <asp:TextBox ID="txtdate" AutoComplete="off" CssClass="w3-input w3-border w3-border-black" placeholder="Select Date" runat="server"></asp:TextBox>

</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile">
 <asp:Label ID="Label2" runat="server" CssClass="w3-large" Font-Bold="true" Text="Amount"></asp:Label>
    <asp:TextBox ID="txtamount" CssClass="w3-input w3-border w3-border-black" placeholder="Enter Amount" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<div class="w3-col s2 w3-mobile">&nbsp;</div>
<div class="w3-col s8 w3-padding w3-center w3-mobile">
 <asp:Label ID="Label3" runat="server" CssClass="w3-large" Font-Bold="true" Text="Comments"></asp:Label>
 <asp:TextBox ID="txtcomments" CssClass="w3-input w3-border w3-border-black" TextMode="MultiLine" placeholder="Comments" runat="server"></asp:TextBox>
 <br />
    <asp:Button ID="btsubmit" 
        CssClass="w3-amber w3-large w3-padding w3-card-4 at-menubutton" runat="server" 
        Text="Submit" onclick="btsubmit_Click" />
    <asp:Button ID="btreset" 
        CssClass="w3-amber w3-large w3-padding w3-card-4 at-menubutton" runat="server" 
        Text="Reset" onclick="btreset_Click" />
</div>
<div class="w3-col s2 w3-mobile">&nbsp;</div>
</div>
</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>

</div>
<br />

<div class="w3-row">
<div class="w3-col s1 w3-mobile">&nbsp;</div>
<div class="w3-col s10 w3-padding w3-center w3-mobile">
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-center w3-centered w3-table-all" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
            <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("date"))) %>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText="Amount" 
                SortExpression="amount" />
            <asp:BoundField DataField="reason" HeaderText="Reasons" 
                SortExpression="reason" />
           <asp:TemplateField HeaderText="Receive Amount">
           <ItemTemplate>
           <a href="receivependingamount.aspx?sno=<%#Eval("sno") %>" class="w3-button w3-large w3-round-large w3-card-2 at-menubutton w3-orange">Receive</a>
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
        SelectCommand="SELECT * FROM [holdamount] where status='pending' ORDER BY [date] DESC, [amount] DESC">
    </asp:SqlDataSource>
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>

</div>
 <script type="text/javascript">
     $(function () {
         $(function () {
             var currentYear = (new Date).getFullYear();
             var currentMonth = (new Date).getMonth() + 1;
             var currentDay = (new Date).getDate();
             $("#datepicker").datepicker({ minDate: new Date((currentYear - 1), 12, 1), dateFormat: 'dd/mm/yy', maxDate: new Date(currentYear, 11, 31) });

             $("#ContentPlaceHolder1_txtdate").datepicker({

                 changeMonth: true,
                 changeYear: true,
                 yearRange: '1950:currentYear',
                 dateFormat: 'dd-M-yy',
                 defaultDate: 'currentdate'
             });
         });

     });
    </script>

</asp:Content>

