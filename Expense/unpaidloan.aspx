<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="unpaidloan.aspx.cs" Inherits="unpaidloan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="w3-row">
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
<div class="w3-col s1 w3-mobile"><br /></div>
<div class="w3-col s10 w3-padding w3-center w3-round-large w3-card-4 w3-mobile">
<center><h2><b><u>All Loans Data</u></b></h2></center>
    <asp:GridView ID="GridView1" CssClass="w3-table-all w3-center w3-centered" 
        Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="sno" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
          <EmptyDataTemplate>
        <div class="w3-border w3-border-black w3-round-large w3-pale-green w3-text-red w3-xlarge">
        No. Remaining/Unpaid Loan 
        </div>
        </EmptyDataTemplate>
        <Columns>
           <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
            
            <%#LoanUtilities.GetLoanPersonNameBySno(Convert.ToInt32(Eval("sno"))) %>
           
            </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText=" Loan Amount(Rs.)">
            <ItemTemplate>
         
            <%#LoanUtilities.GetLoanAmountTakenFromPersonNo(Convert.ToInt32(Eval("sno"))) %>
            
            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount Paid(Rs.)">
            <ItemTemplate>
            <b class="w3-text-green">
            <%#LoanUtilities.GetPaidLoanAmountFromPersonNo(Convert.ToInt32(Eval("sno"))) %>
            </b>
            </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Pending Amount(Rs.)">
            <ItemTemplate>
               <b class="w3-text-red">
            <%#LoanUtilities.GetReamainingLoanAmountToPayByPersonNo(Convert.ToInt32(Eval("sno"))) %>
            </b>
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
        SelectCommand="SELECT * FROM [loanpersons] where sno in(select loangivenpersonno from loandata) ORDER BY [personname]">
    </asp:SqlDataSource>
         </div>
        <div class="w3-col s1 w3-mobile"><br /></div>
       </div>
</asp:Content>

