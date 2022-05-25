<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  CodeBehind="Index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="ajaxscript.js" type="text/javascript"></script>
<script type="text/javascript">
    window.onload(GetIncomeData());
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
<div class="w3-row">
<div class="w3-col s12 w3-padding w3-center w3-mobile w3-card-4 w3-round-large">
<div class="w3-row">
<div class="w3-col s4 w3-padding shine-me">
    <a href="patientspaymentdetails.aspx?t=H">
    <div class=" w3-pale-yellow w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Hospital Data</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-xlarge">
                <span id="tthospitalpatients" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    </a>
</div>

<div class="w3-col s4 w3-padding shine-me">
    <a href="patientspaymentdetails.aspx?t=P">
    <div class="w3-pale-green w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Pathology Data</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-xlarge">
                <span id="ttpathologypatients" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    </a>
</div>
<div class="w3-col s4 w3-padding shine-me">
    <a href="patientspaymentdetails.aspx?t=M">
    <div class="w3-pale-red w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Medical Data</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-xlarge">
                <span id="ttmedicalpatients" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
    </a>
</div>

</div>
</div>
</div>
<br /><br />
<div class="w3-row">
<div class="w3-col s6 w3-padding w3-center w3-mobile">
<div class="w3-row">
<div class="w3-col s12 w3-padding w3-center w3-mobile w3-round-large w3-card-4" style="border-width:medium;border-style:ridge;border-color:Teal">
<center><b style="font-size:large;text-decoration:underline">Daily Expenses</b></center>
<div class="w3-row">
<center> <asp:Label ID="lblmesaage" runat="server" Font-Bold="true" style="font-size:medium" Text=""></asp:Label></center>
<div class="w3-col s12 w3-mobile w3-padding w3-center">
    <asp:Label ID="Label1" runat="server" Font-Bold="true" style="font-size:medium" Text="Expense On "></asp:Label>
    <asp:TextBox ID="txtexpenseon" CssClass="w3-border w3-border-teal w3-large" placeholder="Expense On" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<div class="w3-col s6 w3-mobile w3-padding w3-center">
 <asp:Label ID="Label2" runat="server" Font-Bold="true" style="font-size:medium" Text="Amount "></asp:Label>
    <asp:TextBox ID="txtamount" CssClass="w3-border w3-border-teal w3-large" TextMode="Number" placeholder="Enter Amount" runat="server"></asp:TextBox>
</div>
<div class="w3-col s6 w3-mobile w3-padding w3-center">
 <asp:Label ID="Label3" runat="server" Font-Bold="true" style="font-size:medium" Text="Date "></asp:Label>
    <asp:TextBox ID="txtdate" CssClass="w3-border w3-border-teal w3-large" TextMode="Date" placeholder="Enter Amount" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<center>
    <asp:Button ID="btsubmit" runat="server" Text="Add Expense" 
        CssClass="w3-large w3-button w3-round-large at-menubutton w3-teal w3-padding" 
        onclick="btsubmit_Click" />
        <asp:Button ID="btreset" runat="server" Text="Reset" 
        
        CssClass="w3-large w3-button w3-round-large at-menubutton w3-teal w3-padding" onclick="btreset_Click" 
        />
</center>
</div>
</div>
</div>
</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile">
<div class="w3-row">
 <a href="#">
<div class="w3-col s6 w3-padding w3-center">

    <div class="w3-aqua w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Today's Income</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-large">
                <span id="spntodayincome" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
   
</div>
 </a>
<a href="#">
<div class="w3-col s6 w3-padding w3-center">

    <div class="w3-sand w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Today's Expense</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-large">
                <span id="spantodayexpense" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
  
</div>
  </a>
</div>
<div class="w3-row">
<div class="w3-col s3">&nbsp;</div>
<a href="#">
<div class="w3-col s6 w3-padding w3-center">

    <div class="w3-khaki w3-card-4 w3-padding w3-round-xlarge">
        <div class="w3-round-xlarge w3-border w3-border-red">
            <label class="w3-large"><b>Today's Saving</b></label>
            <div style="border-style:solid; border-width:1px"></div>
            <br />
            <div class="w3-large">
                <span id="spantodaysaving" runat="server" style="font-weight:bold;"></span>
            </div>
            <br />
        </div>
    </div>
  
</div>
  </a>
<div class="w3-col s3">&nbsp;</div>

</div>
</div>
</div>
<br />
<br /><br /></asp:Content>

