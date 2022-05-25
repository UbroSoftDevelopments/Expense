<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="doctorpayment.aspx.cs" Inherits="doctorpayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="w3-row" id="doctoraccountdiv" runat="server">
<center><h2><b>Doctor's Account</b></h2></center>
<div class="w3-col s4 w3-padding shine-me w3-center">
   
    <div class="w3-light-gray justzoom w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Total Cut Amount</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-xlarge">
                <span id="ttappliedamount" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    
</div>
<div class="w3-col s4 w3-padding shine-me w3-center">
   
    <div class="w3-pale-green justzoom w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Amount Paid </b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-xlarge">
                <span id="ttpaidamount" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    
</div>
<div class="w3-col s4 w3-padding shine-me w3-center">
   
    <div class="w3-pale-red justzoom w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Amount Left</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-xlarge">
                <span id="ttleftamount" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
        
    </div>
    
</div>
</div>
<br />

<div class="w3-row">
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-mobile w3-padding w3-center w3-round-large w3-card-4" style="border-width:medium;border-style:solid;border-color:Black">
<div class="w3-row">
<center><h2><b><u>Pay Money</u></b></h2></center>
<center> <asp:Label ID="lblmessage" CssClass="w3-large" runat="server" Font-Bold="true" Text=""></asp:Label></center>
<div class="w3-col s6 w3-padding w3-center w3-mobile w3-large">
    <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Amount"></asp:Label>
    <asp:TextBox ID="txtamount" CssClass="w3-input w3-border w3-border-black w3-sand" TextMode="Number" placeholder="Enter Amount" runat="server"></asp:TextBox>
</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile">
 <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Date"></asp:Label>
    <asp:TextBox ID="txtdate" CssClass="w3-input w3-border w3-border-black w3-sand" TextMode="Date" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<div class="w3-col s2 w3-mobile">&nbsp;</div>
<div class="w3-col s8 w3-padding w3-center w3-mobile">
 <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Comments"></asp:Label>
    <asp:TextBox ID="txtcomment" CssClass="w3-input w3-border w3-border-black w3-sand" placeholder="Enter Amount" runat="server"></asp:TextBox>
</div>
<div class="w3-col s2 w3-mobile">&nbsp;</div>
</div>
<center>
<asp:Button ID="btpay" runat="server" 
        CssClass="at-menubutton w3-button w3-card-4 w3-amber w3-large w3-padding" 
        Text="Click To Pay" onclick="btpay_Click" />
        <asp:Button ID="btreset" runat="server" 
        CssClass="at-menubutton w3-button w3-card-4 w3-amber w3-large w3-padding" 
        Text="Reset" onclick="btreset_Click" />
</center>

</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>

</div>
<div class="w3-row">
<div class="w3-col s2 w3-mobile">&nbsp;</div>
<div class="w3-col s8 w3-padding w3-mobile">
<br />
<center>
<h2><b><u>All Payment Details</u></b></h2>
</center>
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-table-all w3-center w3-centered" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EmptyDataTemplate>
        <div class="w3-pale-green w3-text-red w3-xlarge">No Payments Done Yet</div>
        </EmptyDataTemplate>
        <Columns>
           
            <asp:BoundField DataField="amountpaid" HeaderText="Amount Paid" 
                SortExpression="amountpaid" />
                <asp:BoundField DataField="comments" HeaderText="Comments" 
                SortExpression="comments" />
            <asp:TemplateField HeaderText="Date Of Payment">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
        SelectCommand="SELECT * FROM [doctorpaidamount] WHERE ([doctorno] = @doctorno) ORDER BY [sno] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="doctorno" QueryStringField="dno" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
<div class="w3-col s2">&nbsp;</div>
</div>
</asp:Content>

