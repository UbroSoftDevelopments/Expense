<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkdoctorscut.aspx.cs" Inherits="checkdoctorscut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br />
<div class="w3-row">
<div class="w3-col s3 w3-mobile">&nbsp;</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile w3-round-large w3-card-4" style="border-width:medium;border-style:solid;border-color:Blue">
<div class="w3-row">
<center><b class="w3-xlarge">Select Doctor To Check Cut</b>
<br />
    <asp:Label ID="lblmessage" runat="server" Font-Bold="true" Text=""></asp:Label>
</center>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
<div class="w3-col s10 w3-padding w3-mobile w3-center">
    <asp:DropDownList ID="ddrefferedlist" 
        CssClass="w3-input w3-round-large w3-border w3-border-black w3-card-4" AutoPostBack="true" 
        runat="server" DataSourceID="SqlDataSource1" DataTextField="name" 
        DataValueField="sno">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
        SelectCommand="SELECT * FROM [refferedpersons] ORDER BY [name]">
    </asp:SqlDataSource>
    <br /><br />
    <asp:Button ID="brcheck" runat="server" 
        CssClass="w3-button w3-blue at-menubutton w3-round-large w3-card-4 w3-large" 
        Text="Check All Details" onclick="brcheck_Click" />
    <br />
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>
</div>
<div class="w3-col s3 w3-mobile">&nbsp;</div>
</div>
<br />

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
<div class="w3-col s1 w3-mobile">
&nbsp;
</div>
<div class="w3-col s10 w3-padding w3-center w3-mobile">
    <asp:GridView ID="GridView1" Width="100%" 
        CssClass="w3-center w3-centered w3-table-all" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
           
            <asp:BoundField DataField="patientname" HeaderText="Patient Name" 
                SortExpression="patientname" />
            <asp:BoundField DataField="ipno" HeaderText="Ip No" SortExpression="ipno" />
            
            <asp:BoundField DataField="completecut" HeaderText="Package Cut" 
                SortExpression="completecut" />
            <asp:BoundField DataField="hospitalcut" HeaderText="Hospital Cut" 
                SortExpression="hospitalcut" />
            <asp:BoundField DataField="medicinecut" HeaderText="Medicine Cut" 
                SortExpression="medicinecut" />
            <asp:BoundField DataField="pathologycut" HeaderText="Pathology Cut" 
                SortExpression="pathologycut" />
            <asp:TemplateField HeaderText="Check Payments">
            <ItemTemplate>
            <a href="patientcutmoney.aspx?sno=<%#Eval("sno") %>">Check Details</a>
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
        SelectCommand="SELECT * FROM [doctorcut] WHERE ([refferedfrom] = @refferedfrom) ORDER BY [sno] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddrefferedlist" Name="refferedfrom" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
<div class="w3-col s1 w3-mobile">
&nbsp;
</div>
</div>
</asp:Content>

