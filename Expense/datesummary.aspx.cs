using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class datesummary : System.Web.UI.Page
{
    DateTime date;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsVerifiedUserLoggedIn(Session);
        if (!b)
            Response.Redirect("allincomes.aspx");
        date = Convert.ToDateTime(Request.QueryString["d"]);
        hiddendate.Value =""+ date;
        double hospitalamount = ExpenseUtilities.GetTotalIncomeFromHospitalByDate(date);
        double pathologyamount = ExpenseUtilities.GetTotalIncomeFromPathologyByDate(date);
        double medicineamount = ExpenseUtilities.GetTotalIncomeFromMedicineByDate(date);
        double extraincomeamount = ExpenseUtilities.GetTotalExtraIncomeByDate(date);
        double expenseamount = ExpenseUtilities.GetTotalExpenseBydate(date);
        lblhospitaldetails.Text = "Income From Hospital = Rs." + hospitalamount + "/-";
        lblpathologydetails.Text = "Income From Pathology = Rs." + pathologyamount + "/-";
        lblmedicinedetails.Text = "Income From Medicine = Rs." + medicineamount + "/-";
        lblextraincomedetails.Text = "OtherSource Income = Rs." + extraincomeamount + "/-";
        lblexpensedetails.Text = "Total Expense = Rs." + expenseamount + "/-";
        double totalincome=hospitalamount+pathologyamount+medicineamount+extraincomeamount;
        lbltotalincomeondate.Text = "Total Income <br> Rs." + totalincome + "/-";
        lbltotalexpenseondate.Text = "Total Expense <br> Rs." + expenseamount + "/-";
        double totalleftamount = totalincome - expenseamount;
        lbltotalcashinhandondate.Text = "Total Profit<br> Rs." + totalleftamount + "/-";
    }
}