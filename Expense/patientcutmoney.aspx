<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patientcutmoney.aspx.cs" Inherits="patientcutmoney" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div class="w3-row">
<div class="w3-col s1 w3-mobile">&nbsp;</div>
<div class="w3-col s10 w3-padding w3-center w3-mobile w3-sand w3-round-large w3-card-4" style="border-width:medium;border-style:solid;border-color:Black">
<div class="w3-row">
<div class="w3-col s4 w3-padding w3-center w3-mobile">
<b class="w3-xlarge w3-text-black">Patient Name</b><br />
    <asp:Label ID="lblpname" style="font-size:large" Font-Bold="true" runat="server" Text=""></asp:Label>
</div>
<div class="w3-col s4 w3-padding w3-center w3-mobile">
<b class="w3-xlarge w3-text-black">Reffered From</b><br />
    <asp:Label ID="lblreffered" style="font-size:large" Font-Bold="true" runat="server" Text=""></asp:Label>
</div>
<div class="w3-col s4 w3-padding w3-center w3-mobile">
<b class="w3-xlarge w3-text-black">Ip No.</b><br />
    <asp:Label ID="lblipno" style="font-size:large" Font-Bold="true" runat="server" Text=""></asp:Label>
</div>
</div>
<div class="w3-row">
<center><h2><b class="w3-text-red"><u>Cut Percentages</u></b></h2></center>
<div id="cutdiv" runat="server">
<div class="w3-col s4 w3-padding w3-center w3-mobile">
<b class="w3-xlarge w3-text-black">Hospital Cut</b><br />
    <asp:Label ID="lblhospitalcut" style="font-size:large" Font-Bold="true" runat="server" Text=""></asp:Label>
</div>
<div class="w3-col s4 w3-padding w3-center w3-mobile">
<b class="w3-xlarge w3-text-black">Pathology Cut</b><br />
    <asp:Label ID="lblpathologycut" style="font-size:large" Font-Bold="true" runat="server" Text=""></asp:Label>
</div>
<div class="w3-col s4 w3-padding w3-center w3-mobile">
<b class="w3-xlarge w3-text-black">Medicine Cut</b><br />
    <asp:Label ID="lblmedicinecut" style="font-size:large" Font-Bold="true" runat="server" Text=""></asp:Label>
</div>
</div>
<div id="completediv" runat="server">
<div class="w3-col s4 w3-padding w3-center w3-mobile">
<br />
</div>
<div class="w3-col s4 w3-padding w3-center w3-mobile">
<b class="w3-xlarge w3-text-black">Complete Cut</b><br />
    <asp:Label ID="lblcompletecut" style="font-size:large" Font-Bold="true" runat="server" Text=""></asp:Label>
</div>
<div class="w3-col s4 w3-padding w3-center w3-mobile">
<br />
</div>
</div>
</div>
<br />
<center><h2><b><u>Payment Details</u></b></h2></center>
<div class="w3-row">
<div class="w3-col s12 w3-padding w3-mobile">
<div class="w3-col s3 w3-padding shine-me">
   
    <div class="w3-light-grey justzoom w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Amount Applied</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-large">
                <span id="ttpaymentapplied" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    
</div>
<div class="w3-col s3 w3-padding shine-me">
   
    <div class="w3-pale-green justzoom w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Amount Accepted</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-large">
                <span id="ttacceptpayment" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    
</div>
<div class="w3-col s3 w3-padding shine-me">
   
    <div class="w3-pale-red justzoom w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Amount To Doctor</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-large">
                <span id="ttpaymentgiventodoctor" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    
</div>
<div class="w3-col s3 w3-padding shine-me">
   
    <div class="w3-pale-yellow justzoom w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Amount In Hand</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-large">
                <span id="ttamountinhand" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    
</div>
</div>
<div class="w3-row">
<center>

    <asp:Label ID="lbldiscount" runat="server" CssClass="w3-text-red" Font-Bold="true" Text=""></asp:Label>
</center>
</div>
<div class="w3-row" id="allpayments" runat="server">

</div>
</div>
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

