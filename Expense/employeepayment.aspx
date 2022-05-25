<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="employeepayment.aspx.cs" Inherits="employeepayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center><b class="w3-text-red" style="font-size:xx-large;text-decoration:underline">Payments</b></center>
 <div class="w3-row">
  <div class="w3-col w3-mobile s3">&nbsp;</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile w3-round-large w3-card-4" style="border-width:medium;border-style:ridge;border-color:Teal">
<center> <asp:Label ID="lblmesaage" runat="server" Font-Bold="true" style="font-size:medium" Text=""></asp:Label></center>
<div class="w3-row">
<div class="w3-col s6 w3-mobile w3-padding w3-center">
 <asp:Label ID="Label2" runat="server" Font-Bold="true" style="font-size:medium" Text="Amount "></asp:Label>
    <asp:TextBox ID="txtamount" CssClass="w3-border w3-border-teal w3-large w3-input" TextMode="Number" placeholder="Enter Amount" runat="server"></asp:TextBox>
</div>
<div class="w3-col s6 w3-mobile w3-padding w3-center">
 <asp:Label ID="Label3" runat="server" Font-Bold="true" style="font-size:medium" Text="Date "></asp:Label>
 <asp:TextBox ID="txtdate" AutoComplete="off" CssClass="w3-border w3-border-teal w3-large w3-input" placeholder="Enter Date" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<div class="w3-col s6 w3-mobile w3-padding w3-center">
 <asp:Label ID="Label1" runat="server" Font-Bold="true" style="font-size:medium" Text="Payment Details/Mode"></asp:Label>
    <asp:TextBox ID="txtpaymentdetails" CssClass="w3-border w3-border-teal w3-large w3-input" placeholder="Enter Payment Details" runat="server"></asp:TextBox>
</div>
<div class="w3-col s6 w3-mobile w3-padding w3-center">
 <asp:Label ID="Label4" runat="server" Font-Bold="true" style="font-size:medium" Text="Comment(If Any)"></asp:Label>
 <asp:TextBox ID="txtcomment" AutoComplete="off" CssClass="w3-border w3-border-teal w3-large w3-input" placeholder="Enter Comments(If Any)" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<center>
    <asp:Button ID="btsubmit" runat="server" Text="Submit" CssClass="w3-large w3-button w3-round-large at-menubutton w3-teal w3-padding" 
        onclick="btsubmit_Click"/>
        <asp:Button ID="btreset" runat="server" Text="Reset" 
         CssClass="w3-large w3-button w3-round-large at-menubutton w3-teal w3-padding" 
        onclick="btreset_Click"/>
</center>
</div>

</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>
 </div>
 <br />
 <div class="w3-row">
  <center>
   <asp:Label ID="lbltotalpayment" CssClass="w3-text-red w3-xxlarge" runat="server" Font-Bold="true" Text=""></asp:Label>
  </center>
  <div class="w3-col s1 w3-mobile">&nbsp;</div>
  <div class="w3-col s10 w3-padding w3-center w3-mobile">
      <asp:GridView ID="GridView1" Width="100%" 
          CssClass="w3-table-all w3-center w3-centered" runat="server" 
          AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
          DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
                
                <asp:TemplateField HeaderText="Employee/Person Name">
                 <ItemTemplate>
                  <%#EmployeeUtilities.GetEmployeeNameByEmployeeNo(Convert.ToInt32(Eval("employeeno")))%>
                 </ItemTemplate>
                </asp:TemplateField>
                 
                  <asp:BoundField DataField="paymentamount" HeaderText="Amount" 
                   SortExpression="paymentamount" />
                   <asp:TemplateField HeaderText="Date Of Payment">
                     <ItemTemplate>
                      <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("dateofpayment")))%>
                     </ItemTemplate>
                   </asp:TemplateField>
               
               <asp:BoundField DataField="paymentdetails" HeaderText="Payment Details" 
                   SortExpression="paymentdetails" />
               <asp:BoundField DataField="comment" HeaderText="Comment" 
                   SortExpression="comment" />
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

<SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
          SelectCommand="SELECT * FROM [employeepayment] WHERE ([employeeno] = @employeeno) ORDER BY [dateofpayment] DESC, [sno] DESC">
          
          <SelectParameters>
              <asp:QueryStringParameter Name="employeeno" QueryStringField="eno" 
                  Type="Int32" />
          </SelectParameters>
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

