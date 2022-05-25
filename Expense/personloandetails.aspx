<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="personloandetails.aspx.cs" Inherits="personloandetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="w3-row">
<center><div id="personnamediv" runat="server"></div></center>
<div class="w3-col s4 w3-padding w3-center">
   
    <div class=" w3-pale-yellow w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Total Loan Taken</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-xlarge">
                <span id="ttloantaken" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
  
</div>
    <div class="w3-col s4 w3-padding w3-center">
    <div class="w3-pale-green w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Total Loan Return</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-xlarge">
                <span id="ttloanreturn" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    </div>
    
<div class="w3-col s4 w3-padding shine-me w3-center">
  
    <div class="w3-pale-red w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Pending To Pay</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-xlarge">
                <span id="ttpendingloan" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    
</div>

</div>
<br />
<div class="w3-row">
<center><h2><b><u>All Data</u></b></h2></center>
<div class="w3-mobile w3-padding w3-center w3-col s6 w3-card-4">
<center><b><u>Loan Taken</u></b></center>
    <asp:GridView ID="gdloantaken" Width="100%" 
        CssClass="w3-table-all w3-center w3-centered" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
           <asp:TemplateField HeaderText="Received On">
            <ItemTemplate>
            <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("date")))%>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText="Amount" 
                SortExpression="amount" />
           
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
        SelectCommand="SELECT * FROM [loandata] WHERE ([loangivenpersonno] = @loangivenpersonno) ORDER BY [date] DESC, [amount] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="loangivenpersonno" QueryStringField="pno" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>
<div class="w3-mobile w3-padding w3-center w3-col s6 w3-card-4">
<center><b><u> Return Amount</u></b></center>
   <asp:GridView ID="gdloanpaid" Width="100%" 
        CssClass="w3-table-all w3-center w3-centered" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
       <AlternatingRowStyle BackColor="White" />
      
       <Columns>
           <asp:TemplateField HeaderText="Paid On">
            <ItemTemplate>
            <%#DateUtilties.FormattedDate(Convert.ToDateTime(Eval("dateofpayment")))%>
            </ItemTemplate>
            </asp:TemplateField>
             <asp:BoundField DataField="comments" HeaderText="Comments" 
               SortExpression="comments" />
           <asp:BoundField DataField="amount" HeaderText="Amount" 
               SortExpression="amount" />
                
          
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
        SelectCommand="SELECT * FROM [loanpaiddate] WHERE ([loangivingpersonsno] = @loangivingpersonsno) ORDER BY [dateofpayment] DESC, [amount] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="loangivingpersonsno" QueryStringField="pno" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>
</div>
</asp:Content>

