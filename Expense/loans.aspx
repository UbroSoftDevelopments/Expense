<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="loans.aspx.cs" Inherits="loans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="w3-row">
<div class="w3-col s3 w3-mobile"><br /></div>
<div class="w3-col s6 w3-padding w3-center w3-mobile">
<div class="w3-row">
<div class="w3-col s12 w3-padding w3-center w3-mobile w3-round-large w3-card-4" style="border-width:medium;border-style:ridge;border-color:Teal">
<center><b style="font-size:large;text-decoration:underline">Loan Data</b></center>
<div class="w3-row">
<center> <asp:Label ID="lblmesaage" runat="server" Font-Bold="true" style="font-size:medium" Text=""></asp:Label></center>
<div class="w3-col s12 w3-mobile w3-padding w3-center">
    <asp:Label ID="Label1" runat="server" Font-Bold="true" style="font-size:medium" Text="Amount Taken From"></asp:Label>
    <asp:DropDownList ID="ddloanperson" 
        CssClass="w3-border w3-border-teal w3-large w3-input w3-sand" 
        AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="personname" DataValueField="sno">
    <asp:ListItem Selected="True" Text="Select Person Name" Value="-1"></asp:ListItem>
    </asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
        SelectCommand="SELECT * FROM [loanpersons] ORDER BY [personname]">
    </asp:SqlDataSource>

</div>
</div>
<div class="w3-row">
<div class="w3-col s6 w3-mobile w3-padding w3-center">
 <asp:Label ID="Label2" runat="server" Font-Bold="true" style="font-size:medium" Text="Loan Amount "></asp:Label>
    <asp:TextBox ID="txtamount" CssClass="w3-border w3-border-teal w3-large w3-input w3-sand" TextMode="Number" placeholder="Enter Amount" runat="server"></asp:TextBox>
</div>
<div class="w3-col s6 w3-mobile w3-padding w3-center">
 <asp:Label ID="Label3" runat="server" Font-Bold="true" style="font-size:medium" Text="Date "></asp:Label>
    <asp:TextBox ID="txtdate" AutoComplete="off" CssClass="w3-border w3-border-teal w3-large w3-input w3-sand" placeholder="Select Date" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<center>
    <asp:Button ID="btsubmit" runat="server" Text="Add Income" 
        CssClass="w3-large w3-button w3-round-large at-menubutton w3-teal" 
        onclick="btsubmit_Click"/>
</center>
</div>
</div>
</div>
</div>
<div class="w3-col s3 w3-padding w3-center w3-mobile">
<br />
</div>
</div>
<div class="w3-row">
<div class="w3-col s2 w3-mobile"><br /></div>
<div class="w3-col s8 w3-padding w3-center w3-round-large w3-card-4 w3-mobile">
<center><h2><b><u>All Loans</u></b></h2></center>
    <asp:GridView ID="GridView1" CssClass="w3-table-all w3-center w3-centered" 
        Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="sno" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
           <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
            <%#LoanUtilities.GetLoanPersonNameBySno(Convert.ToInt32(Eval("loangivenpersonno"))) %>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText="Amount" 
                SortExpression="amount" />
            <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
            <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("date"))) %>
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
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
        SelectCommand="SELECT * FROM [loandata] ORDER BY [date] DESC, [amount] DESC">
    </asp:SqlDataSource>
         </div>
        <div class="w3-col s2 w3-mobile"><br /></div>
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

