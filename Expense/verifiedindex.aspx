<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="verifiedindex.aspx.cs" Inherits="verifiedindex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br /> 
 <center><b class="w3-text-black w3-xxlarge"><u>Patient Expense Dashboard</u></b></center>
 <br />
 <div class="w3-col s2 w3-mobile">&nbsp;</div>
 <div class="w3-col s8 w3-padding w3-round-large w3-card-4 w3-mobile w3-pale-red" style="border-width:medium;border-style:solid;border-color:Black">
    <div class="w3-row">
     <div class="w3-col s3 w3-padding w3-center w3-mobile">
      <a href="selectpatienttoaddexpense.aspx"><img alt="add" src="Resources/addpatientexpense -.png" width="60%" /><br />
      <b>Add Expense On patients</b>
      </a>
     </div>
      <div class="w3-col s3 w3-padding w3-center w3-mobile">
      <a href="patientexpensedata.aspx"><img alt="details" src="Resources/patientexpensedetails.png" width="60%" /><br />
      <b>All Details</b>
      </a>
     </div>
      <div class="w3-col s3 w3-padding w3-center w3-mobile">
      <a href="employee.aspx"><img alt="add" src="Resources/addemployee.png" width="60%" /><br />
      <b>Add Employee/Person</b>
      </a>
     </div>
     <div class="w3-col s3 w3-padding w3-center w3-mobile">
      <a href="selectemployeeforpayment.aspx"><img alt="add" src="Resources/employeedetails.png" width="60%" /><br />
      <b>Employee Payment/Details</b>
      </a>
     </div>
    </div>
    <div class="w3-row">
      <div class="w3-col s3 w3-padding w3-center w3-mobile">
      <a href="report.aspx"><img alt="add" src="Resources/ledger.png" width="60%" /><br />
      <b>View Account summary</b>
      </a>
     </div>
    </div>


 </div>
 <div class="w3-col s2 w3-mobile">&nbsp;</div>
</asp:Content>

