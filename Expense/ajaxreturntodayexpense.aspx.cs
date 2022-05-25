using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajaxreturntodayexpense : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        double dailyexpense = ExpenseUtilities.GetTotalExpenseBydate(System.DateTime.Now.AddHours(12.5));
        double doctorpayment = ExpenseUtilities.GetTotalAmountPaidToDoctorByDate(System.DateTime.Now.AddHours(12.5));
        double totalexpense = dailyexpense + doctorpayment;
        Response.Write("" + totalexpense);
    }
}