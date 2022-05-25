<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="returnloanamount.aspx.cs" Inherits="returnloanamount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="w3-row">
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-mobile w3-padding w3-center w3-round-large w3-card-4" style="border-width:medium;border-style:solid;border-color:Black">
<div class="w3-row">
<center><h2><b><u>Pay/Return Loan Amount</u></b></h2></center>
<center> <asp:Label ID="lblmessage" CssClass="w3-large" runat="server" Font-Bold="true" Text=""></asp:Label><br />
<asp:Label ID="lblamounttopay" CssClass="w3-large" runat="server" Font-Bold="true" Text=""></asp:Label>
</center>
<div class="w3-col s6 w3-padding w3-center w3-mobile w3-large">
    <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Amount"></asp:Label>
    <asp:TextBox ID="txtamount" CssClass="w3-input w3-border w3-border-black w3-sand" TextMode="Number" placeholder="Enter Amount" runat="server"></asp:TextBox>
</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile">
 <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Date"></asp:Label>
    <asp:TextBox ID="txtdate" AutoComplete="off" CssClass="w3-input w3-border w3-border-black w3-sand" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<div class="w3-col s2 w3-mobile">&nbsp;</div>
<div class="w3-col s8 w3-padding w3-center w3-mobile">
 <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Comments"></asp:Label>
    <asp:TextBox ID="txtcomment" TextMode="MultiLine" CssClass="w3-input w3-border w3-border-black w3-sand" placeholder="Enter Comments" runat="server"></asp:TextBox>
</div>
<div class="w3-col s2 w3-mobile">&nbsp;</div>
</div>
<center>
<asp:Button ID="btpay" runat="server" 
        CssClass="at-menubutton w3-button w3-card-4 w3-amber w3-large w3-padding" 
        Text="Click To Pay" onclick="btpay_Click" />
</center>

</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>

</div>
<div class="w3-row">
<div class="w3-col s2 w3-mobile">&nbsp;</div>
<div class="w3-col s8 w3-padding w3-mobile">
<br />
<center>
<h2><b><u>All Paid Amount Details</u></b></h2>
</center>
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-table-all w3-center w3-centered" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EmptyDataTemplate>
        <div class="w3-round-large w3-card-4 w3-center w3-sand w3-text-red w3-xlarge">
        No. Payment Done Yet!!
        </div>
        </EmptyDataTemplate>
        <Columns>
          <asp:TemplateField HeaderText="Person Name">
          <ItemTemplate>
          <%#LoanUtilities.GetLoanPersonNameBySno(Convert.ToInt32(Eval("loangivingpersonsno"))) %>
          </ItemTemplate>
          </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText="Amount" 
                SortExpression="amount" />
            <asp:TemplateField HeaderText="Date Of Payment">
            <ItemTemplate>
            <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("dateofpayment"))) %>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="comments" HeaderText="Comments" 
                SortExpression="comments" />
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
        
        SelectCommand="SELECT * FROM [loanpaiddate] WHERE ([loangivingpersonsno] = @loangivingpersonsno) ORDER BY [dateofpayment] DESC, [amount] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="loangivingpersonsno" QueryStringField="sno" 
                    Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
        </div>
<div class="w3-col s2 w3-mobile">&nbsp;</div>
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

