using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class personloandetails : System.Web.UI.Page
{
    int pno;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        try
        {
            pno =Convert.ToInt32(Request.QueryString["pno"]);
            if (pno <= 0)
                Response.Redirect("selecttoviewloandetails.aspx");
            ttloantaken.InnerHtml = "<b>" + LoanUtilities.GetLoanAmountTakenFromPersonNo(pno) + "/-</b>";
            ttloanreturn.InnerHtml = "<b>" + LoanUtilities.GetPaidLoanAmountFromPersonNo(pno) + "/-</b>";
            double pending = LoanUtilities.GetLoanAmountTakenFromPersonNo(pno) - LoanUtilities.GetPaidLoanAmountFromPersonNo(pno);
            ttpendingloan.InnerHtml = "<b>" + pending + "/-</b>";
            string personname = LoanUtilities.GetLoanPersonNameBySno(pno);
            personnamediv.InnerHtml = "<h1><b><u>"+personname+" Loan Details</u></b></h1>";
        }
        catch
        {

        }
    }
}