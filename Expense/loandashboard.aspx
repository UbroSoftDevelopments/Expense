<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="loandashboard.aspx.cs" Inherits="loandashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<center><h2><b><u>Loan Management</u></b></h2></center>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
<div class="w3-col s10 w3-padding w3-center w3-card-4 w3-round-large w3-mobile" style="border-width:medium;border-style:solid;border-color:Black">
<div class="w3-row">
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="loanperson.aspx">
<img alt="loanperson" src="Resources/loanpersonicon.png" width="70%" /><br />
<b>Loan Person Entry</b>
</a>
</div>
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="loans.aspx">
<img alt="loan" src="Resources/loanicon.png" width="80%" /><br />
<b>Take Loan</b>
</a>
</div>
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="selecttopayloan.aspx">
<img alt="paid" src="Resources/paidloan.png" width="70%" /><br />
<b>Pay Loan</b>
</a>
</div>
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="unpaidloan.aspx">
<img alt="pending" src="Resources/pendingamounticon.png" width="90%" /><br />
<b>Pending Loans</b>
</a>
</div>
</div>
<div class="w3-row">
<div class="w3-col s4 w3-mobile">&nbsp;</div>
<div class="w3-col s4 w3-padding w3-mobile w3-center">
<a href="selecttoviewloandetails.aspx">
<img alt="ceheck" src="Resources/checkloanicon.png" width="50%" /><br />
<b>Check Details</b>
</a>
</div>
<div class="w3-col s4 w3-mobile">&nbsp;</div>
</div>
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

