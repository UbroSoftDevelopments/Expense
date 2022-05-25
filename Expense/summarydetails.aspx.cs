using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class summarydetails : System.Web.UI.Page
{
    string month;
    int year;
    int monthno;
    double HospitalDayTotal=0;
    double MedicineDayTotal=0;
    double PathologyDayTotal=0;
    double ExtraIncomeDayTotal=0;
    double TotalIncomeDayTotal=0;
    double TotalExpenseDayTotal=0;
    double CashInHandDayTotal=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsVerifiedUserLoggedIn(Session);
        if (!b)
            Response.Redirect("allincomes.aspx");
        if (!Request.QueryString.HasKeys())
            Response.Redirect("report.aspx");
        month = Request.QueryString["M"];
        year = Convert.ToInt32(Request.QueryString["y"]);
        monthno = DateUtilties.getMonthNumber(month);
        int days = DateUtilties.GetDayInMonth(monthno, year);
        string fromdate=monthno + "/01/" + year;
        string todate= monthno + "/" + days + "/" + year;
        double hospitalincomeinmonth = ExpenseUtilities.GetTotalIncomeFromHospitalFromDateRange(fromdate,todate);
        double pathologyincomeinmonth = ExpenseUtilities.GetTotalIncomeFromPathologyOfDaterange(fromdate, todate);
        double medicineincomeinmonth = ExpenseUtilities.GetTotalIncomeFromMedicineFromDateRange(fromdate, todate);
        double extraincomeinmonth = ExpenseUtilities.GetExtraIncomeOFDateRange(fromdate, todate);
        double expenseamountinmonth = ExpenseUtilities.GetAllTotalExpenseOfDateRange(fromdate, todate);
        double totalincomeinmonth = hospitalincomeinmonth + medicineincomeinmonth + pathologyincomeinmonth + extraincomeinmonth;
        lbltotalincomeinmonth.Text="Income In "+month+" Rs.<br>"+totalincomeinmonth+"/-";
        lbltotalexpenseinmonth.Text = "Expense In " + month + " Rs.<br>" + expenseamountinmonth + "/-";
        double cashinhandinmonth = totalincomeinmonth - expenseamountinmonth;
        lbltotalcashinhandinmonth.Text = "Profit In " + month + " Rs.<br>" + cashinhandinmonth + "/-";
          DataTable dt = new DataTable();
        dt.Columns.Add("Days");
        dt.Columns.Add("Hospital Income");
        dt.Columns.Add("Medicine Income");
        dt.Columns.Add("Pathology Income");
        dt.Columns.Add("Extra Income");
        dt.Columns.Add("Total Income");
        dt.Columns.Add("Expense");
        dt.Columns.Add("Cash Left In Hand");
        dt.Columns.Add("Details");

        for (int i = 0; i < DateUtilties.GetDayInMonth(monthno,year); i++)
        {
            
            
            DataRow dr = dt.NewRow();
            DateTime date=Convert.ToDateTime(monthno+"/"+(i+1)+"/"+year);
            dr[0] = "" + DateUtilties.FormattedDate(date);
            double hospitalIncome = ExpenseUtilities.GetTotalIncomeFromHospitalByDate(date);
            HospitalDayTotal += hospitalIncome;
            dr[1] = "Rs." + hospitalIncome+"/-";
            double medicineIncome = ExpenseUtilities.GetTotalIncomeFromMedicineByDate(date);
            dr[2] = "Rs." + medicineIncome+"/-";
            MedicineDayTotal += medicineIncome;
            double pathologyIncome = ExpenseUtilities.GetTotalIncomeFromPathologyByDate(date);
            dr[3] = "Rs." + pathologyIncome+"/-";
            PathologyDayTotal += pathologyIncome;
            double extraincome = ExpenseUtilities.GetTotalExtraIncomeByDate(date);
            dr[4] = "Rs." + extraincome + "/-";
            ExtraIncomeDayTotal += extraincome;
            double totalIncome=(hospitalIncome + medicineIncome + pathologyIncome+extraincome);
            dr[5] = "Rs." + totalIncome+"/-";
            TotalIncomeDayTotal += totalIncome;
            double expenses = ExpenseUtilities.GetAllTotalExpencesByDateIncludingAll(date);
            dr[6] = "Rs."+expenses+"/-";
            TotalExpenseDayTotal += expenses;
            double cashinhand = totalIncome - expenses;
            dr[7] = "Rs." + cashinhand+"/-";
            CashInHandDayTotal+= cashinhand;
            dr[8] = "View";
            dt.Rows.Add(dr);
        }
        

        Gdview.DataSource = dt;
        Gdview.DataBind();
        

    }




    protected void Gdview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        HyperLink hl = new HyperLink();
        hl.Text = "View Details";
        hl.NavigateUrl = "datesummary.aspx?d="+ e.Row.Cells[0].Text;
        if (e.Row.RowType == DataControlRowType.DataRow)
            e.Row.Cells[8].Controls.Add(hl);


       
    }
    protected void Gdview_DataBound(object sender, EventArgs e)
    {
        Gdview.FooterRow.Cells[0].Text = "Total";
        Gdview.FooterRow.Cells[1].Text = "Rs." + HospitalDayTotal + "/-";
        Gdview.FooterRow.Cells[2].Text = "Rs." + MedicineDayTotal + "/-";
        Gdview.FooterRow.Cells[3].Text = "Rs." + PathologyDayTotal + "/-";
        Gdview.FooterRow.Cells[4].Text = "Rs." + ExtraIncomeDayTotal + "/-";
        Gdview.FooterRow.Cells[5].Text = "Rs." + TotalIncomeDayTotal + "/-";
        Gdview.FooterRow.Cells[6].Text = "Rs." + TotalExpenseDayTotal + "/-";
        Gdview.FooterRow.Cells[7].Text = "Rs." + CashInHandDayTotal + "/-";
    }
}
