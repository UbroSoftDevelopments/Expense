using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajaxreturntodayincome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        double hospitalincome = ExpenseUtilities.GetTotalIncomeFromHospitalByDate(System.DateTime.Now.AddHours(12.5));
        double pathologyincome=ExpenseUtilities.GetTotalIncomeFromPathologyByDate(System.DateTime.Now.AddHours(12.5));
        double medicineincome=ExpenseUtilities.GetTotalIncomeFromMedicineByDate(System.DateTime.Now.AddHours(12.5));
        double extraincome=ExpenseUtilities.GetTotalExtraIncomeByDate(System.DateTime.Now.AddHours(12.5));
        double Alltotalincome=hospitalincome+pathologyincome+medicineincome+extraincome;
        Response.Write(""+Alltotalincome);
    }
}