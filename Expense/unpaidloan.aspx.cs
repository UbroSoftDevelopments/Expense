using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class unpaidloan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        ttloantaken.InnerHtml = "<b>" + LoanUtilities.GetTotalLoanAmount() + "/-</b>";
        ttloanreturn.InnerHtml = "<b>"+LoanUtilities.GetTotalPaidLoanAmount()+"/-</b>";
        double pending = LoanUtilities.GetTotalLoanAmount() - LoanUtilities.GetTotalPaidLoanAmount();
        ttpendingloan.InnerHtml = "<b>" + pending + "/-</b>";
    }
}