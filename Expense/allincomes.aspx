<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="allincomes.aspx.cs" Inherits="allincomes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="w3-row">
<center><h2><b><u>All Data</u></b></h2></center>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
<div class="w3-col s10 w3-padding w3-center w3-card-4 w3-round-large w3-mobile" style="border-width:medium;border-style:solid;border-color:Black">
<div class="w3-row">
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="allhospitalincome.aspx">
<img alt="hospital" src="Resources/hospitalicon.png" width="70%" />
<b>Hospital Data</b>
</a>
</div>
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="allpathologyincome.aspx">
<img alt="pathology" src="Resources/pathologyicon.png" width="70%" />
<b>Pathology Data</b>
</a>
</div>
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="allmedicalincome.aspx">
<img alt="medicine" src="Resources/medicineicon.png" width="70%" />
<b>Medical Data</b>
</a>
</div>
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="holdamount.aspx">
<img alt="pending" src="Resources/pendingamounticon.png" width="90%" />
<b>Pending Amounts</b>
</a>
</div>
</div>
<div class="w3-row">
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="extraincome.aspx">
<img alt="extraincome" src="Resources/extraincomeicon.png" width="75%" /><br />
<b>Extra Income</b>
</a>
</div>
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="doctorpayment.aspx">
<img alt="doctorpayment" src="Resources/paydoctorsicon.png" width="68%" /><br />
<b>Doctor Payments</b>
</a>
</div>
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="dailyexpense.aspx">
<img alt="expense" src="Resources/expenseicon.png" width="70%" /><br />
<b>All Expenses</b>
</a>
</div>
<div class="w3-col s3 w3-padding w3-mobile w3-center">
<a href="receivedholdpayment.aspx">
<img alt="received" src="Resources/receivependingicon.png" width="70%" />
<b>Received Pending Amount</b>
</a>
</div>
</div>
<div class="w3-row">
<div class="w3-col s3 w3-mobile w3-padding w3-center">
 <a href="verifiedlogin.aspx">
  <img alt="pe" src="Resources/patientexpense.png" width="70%" /><br />
  <b>Add/View Expense On Patient</b>
 </a>
</div>
<div class="w3-col s3 w3-mobile w3-padding w3-center">
<a href="dateselectforalldata.aspx">
<img alt="received" src="Resources/alldataicon.png" width="70%" /><br />
<b>All Total Data</b>
</a>
</div>
<div class="w3-col s3 w3-mobile w3-padding w3-center">
<a href="loandashboard.aspx">
<img alt="loan" src="Resources/loanicon.png" width="80%" /><br />
<b>Loan</b>
</a>
</div>
<div class="w3-col s2 w3-mobile"><br /></div>
</div>
</div>
<div class="w3-col s1 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

