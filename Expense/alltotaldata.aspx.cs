using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class alltotaldata : System.Web.UI.Page
{
    DateTime d;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        try
        {
            d = Convert.ToDateTime(Request.QueryString["d"]);
            if (!Request.QueryString.HasKeys())
                Response.Redirect("dateselectforalldate");
            double hospitalincome = ExpenseUtilities.GetTotalIncomeFromHospitalByDate(d);
            double pathologyincome = ExpenseUtilities.GetTotalIncomeFromPathologyByDate(d);
            double medicalincome = ExpenseUtilities.GetTotalIncomeFromMedicineByDate(d);
            double extraincome = ExpenseUtilities.GetTotalExtraIncomeByDate(d);
            double dailyexpense = ExpenseUtilities.GetTotalExpenseBydate(d);
            double doctorpaid = ExpenseUtilities.GetTotalAmountPaidToDoctorByDate(d);
            double totalincome = hospitalincome + pathologyincome + medicalincome + extraincome;
            double totalexpense = dailyexpense + doctorpaid;
            double saving = totalincome - totalexpense;
            hospitalincomediv.InnerHtml = "<b class='w3-text-black'>Hospital Income</br>" + hospitalincome + "</b>";
            pathologyincomediv.InnerHtml = "<b class='w3-text-black'>Pathology Income</br>" + pathologyincome + "</b>";
            medicalincomediv.InnerHtml = "<b class='w3-text-black'>Medical Income</br>" + medicalincome + "</b>";
            extraincomediv.InnerHtml = "<b class='w3-text-black'>Extra Income</br>" + extraincome + "</b>";
            dailyexpensesdiv.InnerHtml = "<b class='w3-text-black'>Daily Expenses</br>" + dailyexpense + "</b>";
            doctorpaymentdiv.InnerHtml = "<b class='w3-text-black'>Paid To Doctor</br>" + doctorpaid + "</b>";
            totalincomediv.InnerHtml = "<b class='w3-text-black'>Total Income</br>" + totalincome + "</b>";
            totalexpensediv.InnerHtml = "<b class='w3-text-black'>Total Expense</br>" + totalexpense + "</b>";
            totalsavingdiv.InnerHtml = "<b class='w3-text-black'>Total Saving</br>" + saving + "</b>";
        }
        catch
        {

        }

    }
}