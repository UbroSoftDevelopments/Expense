<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="datesummary.aspx.cs" Inherits="datesummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
 <div class="w3-col s4 w3-padding-large w3-center w3-mobile">
  <div class="w3-padding-large w3-center w3-pale-green w3-card-4 w3-round-large">
      <asp:Label ID="lbltotalincomeondate" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
  </div>
 </div>
 <div class="w3-col s4 w3-padding-large w3-center w3-mobile">
 <div class="w3-padding-large w3-center w3-pale-red w3-card-4 w3-round-large">
   <asp:Label ID="lbltotalexpenseondate" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
  </div>
 </div>
 <div class="w3-col s4 w3-padding-large w3-center w3-mobile">
  <div class="w3-padding-large w3-center w3-pale-yellow w3-card-4 w3-round-large">
   <asp:Label ID="lbltotalcashinhandondate" CssClass="w3-large" Font-Bold="true" runat="server" Text=""></asp:Label>
  </div>
 </div>
</div>
<br />
<div class="w3-row">
 <div class="w3-col s6 w3-padding w3-center w3-centered w3-mobile">
 <center>
     <asp:Label ID="lblhospitaldetails" Font-Bold="true" CssClass="w3-text-red w3-xlarge" runat="server" Text=""></asp:Label>
 </center>
     <asp:GridView ID="gdhospital" Width="100%" 
         CssClass="w3-table-all w3-center w3-centered" runat="server" 
         AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
         BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="sno" 
         DataSourceID="SqlDataSource1" GridLines="Vertical">
         <AlternatingRowStyle BackColor="#DCDCDC" />
         <EmptyDataTemplate>
          <div class="w3-padding-large w3-xlarge w3-pale-red w3-card-4 w3-border w3-border-red w3-round-large">
           There IS No Income On This Date !!
          </div>
         </EmptyDataTemplate>
         <Columns>
            
         <asp:TemplateField HeaderText="Patient Name">
          <ItemTemplate>
           <%#PatientUtilities.GetHospitalPatientFullNameByPatientNo(Convert.ToInt32(Eval("patientno")))%>
          </ItemTemplate>
         </asp:TemplateField>
             <asp:BoundField DataField="amount" HeaderText="Amount" 
                 SortExpression="amount" />
             <asp:BoundField DataField="comments" HeaderText="Comments" 
                 SortExpression="comments" />
             <asp:BoundField DataField="paymentmode" HeaderText="Payment Mode" 
                 SortExpression="paymentmode" />
          
             
         </Columns>
         <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
         <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
         <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
         <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#F1F1F1" />
         <SortedAscendingHeaderStyle BackColor="#0000A9" />
         <SortedDescendingCellStyle BackColor="#CAC9C9" />
         <SortedDescendingHeaderStyle BackColor="#000065" />
     </asp:GridView> 
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:geetahospitalConnectionString %>" 
         SelectCommand="SELECT * FROM [payments] WHERE (CAST([dateofpayment] as date) = @dateofpayment) ORDER BY [amount] DESC">
         <SelectParameters>
             <asp:ControlParameter ControlID="hiddendate" Name="dateofpayment" 
                 PropertyName="Value" Type="DateTime" />
         </SelectParameters>
     </asp:SqlDataSource>
 </div>
 <div class="w3-col s6 w3-padding w3-center w3-centered w3-mobile">
 <center>
     <asp:Label ID="lblpathologydetails" Font-Bold="true" CssClass="w3-text-red w3-xlarge" runat="server" Text=""></asp:Label>
 </center>
     <asp:GridView ID="gdpathology" Width="100%" 
         CssClass="w3-table-all w3-center w3-centered" runat="server" 
         AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
         BorderWidth="1px" CellPadding="2" DataKeyNames="sno" 
         DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="None">
         <AlternatingRowStyle BackColor="PaleGoldenrod" />
         <EmptyDataTemplate>
          <div class="w3-padding-large w3-xlarge w3-pale-red w3-card-4 w3-border w3-border-red w3-round-large">
           There IS No Income On This Date !!
          </div>
         </EmptyDataTemplate>
         <Columns>
               <asp:BoundField DataField="patientname" HeaderText="Patient Name" 
                 SortExpression="patientname" />
            <asp:BoundField DataField="gender" HeaderText="Gender" 
                 SortExpression="gender" />
             <asp:BoundField DataField="address" HeaderText="Address" 
                 SortExpression="address" />
           <asp:TemplateField HeaderText="Amount Paid">
                  <ItemTemplate>
                   <%#ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyAfterDiscountByPatientNo(Convert.ToInt32(Eval("sno"))) %>
                  </ItemTemplate>
                 </asp:TemplateField>
          
         </Columns>
         <FooterStyle BackColor="Tan" />
         <HeaderStyle BackColor="Tan" Font-Bold="True" />
         <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
             HorizontalAlign="Center" />
         <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
         <SortedAscendingCellStyle BackColor="#FAFAE7" />
         <SortedAscendingHeaderStyle BackColor="#DAC09E" />
         <SortedDescendingCellStyle BackColor="#E1DB9C" />
         <SortedDescendingHeaderStyle BackColor="#C2A47B" />
     </asp:GridView>
 
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
         ConnectionString="<%$ ConnectionStrings:geetanjalipathologyConnectionString %>" 
         SelectCommand="SELECT * FROM [patient_details] WHERE (Cast([collectiondate] as date) = @collectiondate) ORDER BY [patientname]">
         <SelectParameters>
             <asp:ControlParameter ControlID="hiddendate" Name="collectiondate" 
                 PropertyName="Value" Type="DateTime" />
         </SelectParameters>
     </asp:SqlDataSource>
 
 </div>
</div>
<br />
<div class="w3-row">
 <div class="w3-col s6 w3-padding w3-center w3-mobile">
  <center>
     <asp:Label ID="lblmedicinedetails" Font-Bold="true" CssClass="w3-text-red w3-xlarge" runat="server" Text=""></asp:Label>
 </center>
     <asp:GridView ID="gdmedicine" Width="100%" 
         CssClass="w3-table-all w3-center w3-centered" runat="server" 
         AutoGenerateColumns="False" CellPadding="4" DataKeyNames="receiptno" 
         DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
         <AlternatingRowStyle BackColor="White" />
         <EmptyDataTemplate>
          <div class="w3-padding-large w3-xlarge w3-pale-red w3-card-4 w3-border w3-border-red w3-round-large">
           There IS No Income On This Date !!
          </div>
         </EmptyDataTemplate>
         <Columns>
             <asp:BoundField DataField="receiptno" HeaderText="receiptno" 
                 InsertVisible="False" ReadOnly="True" SortExpression="receiptno" />
             <asp:BoundField DataField="customername" HeaderText="Customer Name" 
                 SortExpression="customername" />
             <asp:BoundField DataField="address" HeaderText="Address" 
                 SortExpression="address" />
                  <asp:TemplateField HeaderText="Amount Paid">
                  <ItemTemplate>
                   <%#ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineAfterDiscountByPatientNo(Convert.ToInt32(Eval("receiptno"))) %>
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
     <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
         ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
         SelectCommand="SELECT * FROM [customerdetails] WHERE (Cast([dateofpurchase] as date) = @dateofpurchase) ORDER BY [customername]">
         <SelectParameters>
             <asp:ControlParameter ControlID="hiddendate" Name="dateofpurchase" 
                 PropertyName="Value" Type="DateTime" />
         </SelectParameters>
     </asp:SqlDataSource>
 </div>
 <div class="w3-col s6 w3-padding w3-center w3-mobile">
  <center>
     <asp:Label ID="lblextraincomedetails" Font-Bold="true" CssClass="w3-text-red w3-xlarge" runat="server" Text=""></asp:Label>
 </center>
     <asp:GridView ID="gdextraincome" CssClass="w3-table-all w3-center w3-centered" 
         Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" 
         DataKeyNames="sno" DataSourceID="SqlDataSource4" ForeColor="#333333" 
         GridLines="None">
         <AlternatingRowStyle BackColor="White" />
         <EmptyDataTemplate>
          <div class="w3-padding-large w3-xlarge w3-pale-red w3-card-4 w3-border w3-border-red w3-round-large">
           There IS No Income On This Date !!
          </div>
         </EmptyDataTemplate>
         <Columns>
            
             <asp:BoundField DataField="sourceofincome" HeaderText="Source Of Income" 
                 SortExpression="sourceofincome" />
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
     <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
         ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
         SelectCommand="SELECT * FROM [extraincome] WHERE (Cast([date] as date) = @date) ORDER BY [amount] DESC">
         <SelectParameters>
             <asp:ControlParameter ControlID="hiddendate" Name="date" PropertyName="Value" 
                 Type="DateTime" />
         </SelectParameters>
     </asp:SqlDataSource>
 </div>
</div>
<br />
<div class="w3-row w3-pale-green w3-padding-large w3-card-2 w3-round-large" style="border-width:medium;border-color:Black;border-style:solid">
   <center>
    <b class="w3-xlarge">Expense Details</b>
   </center>
</div>
<br />
 <div class="w3-row w3-padding">
  <div class="w3-col s1 w3-mobile">&nbsp;</div>
  <div class="w3-col s10 w3-padding w3-center w3-card-4 w3-mobile">
   <center>
     <asp:Label ID="lblexpensedetails" Font-Bold="true" CssClass="w3-text-red w3-xlarge" runat="server" Text=""></asp:Label>
 </center>
      <asp:GridView ID="gdexpense" CssClass="w3-table-all w3-center w3-centered" 
          Width="100%" runat="server" AutoGenerateColumns="False" BackColor="White" 
          BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
          DataKeyNames="sno" DataSourceID="SqlDataSource5" GridLines="Vertical">
          <AlternatingRowStyle BackColor="#DCDCDC" />
          <Columns>
             
              <asp:BoundField DataField="expenseon" HeaderText="Expense On" 
                  SortExpression="expenseon" />
              <asp:BoundField DataField="amount" HeaderText="Amount" 
                  SortExpression="amount" />
             
          </Columns>
          <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
          <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
          <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
          <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F1F1F1" />
          <SortedAscendingHeaderStyle BackColor="#0000A9" />
          <SortedDescendingCellStyle BackColor="#CAC9C9" />
          <SortedDescendingHeaderStyle BackColor="#000065" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
          ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
          SelectCommand="SELECT * FROM [dailyexpences] WHERE (Cast([date] as date) = @date) ORDER BY [amount] DESC">
          <SelectParameters>
              <asp:ControlParameter ControlID="hiddendate" Name="date" PropertyName="Value" 
                  Type="DateTime" />
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
  <div class="w3-col s1 w3-mobile">&nbsp;</div>

 </div>
    <asp:HiddenField ID="hiddendate" runat="server" />
</asp:Content>

