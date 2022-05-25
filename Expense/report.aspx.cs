using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class report : System.Web.UI.Page
{
    double HospitalYearsTotal = 0;
    double MedicineYearsTotal = 0;
    double PathologyYearsTotal = 0;
    double extraIncomeYearTotal = 0;
    double TotalIncomeYearTotal = 0;
    double TotalExpenseYeatTotal = 0;
    double CashInHandYearTotal = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsVerifiedUserLoggedIn(Session);
        if (!b)
            Response.Redirect("allincomes.aspx");
        double hospitalincome = ExpenseUtilities.GetTotalIncomeFromHospitalOfEveryDate();
        double medicineincome = ExpenseUtilities.GetTotalIncomeFromMedicineOfAllDate();
        double Pathologyincome = ExpenseUtilities.GetTotalIncomeFromPathologyOfEveryDate();
        double alltotalincome=hospitalincome+medicineincome+Pathologyincome ;
        lbltotalincometilldate.Text ="Total Income </br>"+alltotalincome +"/-";
        double expense = ExpenseUtilities.GetAllTotalExpencesOfAllTimeIncludingAll();
        lbltotalexpensetilldate.Text = "Total Expense </br>" + expense + "/-";
        double amountinhand = alltotalincome - expense;
        lbltotalcashinhand.Text = "In Hand Amount </br>" + amountinhand + "/-";
        if(!this.IsPostBack)
        SetYear();

        DataTable dt = new DataTable();
        dt.Columns.Add("Month");
        dt.Columns.Add("Hospital Income");
        dt.Columns.Add("Medicine Income");
        dt.Columns.Add("Pathology Income");
        dt.Columns.Add("Extra Income");
        dt.Columns.Add("Total Income");
        dt.Columns.Add("Expense");
        dt.Columns.Add("Cash Left In Hand");
        dt.Columns.Add("Details");
        for (int i = 0; i < DateUtilties.fullmonths.Length; i++)
        {
            int selectedYear=Convert.ToInt32(ddselectyear.SelectedValue);
            int days = DateUtilties.GetDayInMonth((i + 1), selectedYear);
            DataRow dr = dt.NewRow();
            dr[0] = "" + DateUtilties.fullmonths[i];
            double hospitalIncome = ExpenseUtilities.GetTotalIncomeFromHospitalFromDateRange((i + 1) + "/01/" + selectedYear, (i + 1) + "/" + days + "/" + selectedYear);
            HospitalYearsTotal += hospitalIncome;
            dr[1] = "Rs." + hospitalIncome+"/-";
            double medicineIncome = ExpenseUtilities.GetTotalIncomeFromMedicineFromDateRange((i + 1) + "/01/" + selectedYear, (i + 1) + "/" + days + "/" + selectedYear);
            dr[2] = "Rs." + medicineIncome+"/-";
            MedicineYearsTotal += medicineIncome;
            double pathologyIncome = ExpenseUtilities.GetTotalIncomeFromPathologyOfDaterange((i + 1) + "/01/" + selectedYear, (i + 1) + "/" + days + "/" + selectedYear);
            dr[3] = "Rs." + pathologyIncome+"/-";
            PathologyYearsTotal += pathologyIncome;
            double extraincome = ExpenseUtilities.GetExtraIncomeOFDateRange((i + 1) + "/01/" + selectedYear, (i + 1) + "/" + days + "/" + selectedYear);
            dr[4] = "Rs." + extraincome + "/-";
            extraIncomeYearTotal += extraincome;
            double totalIncome=(hospitalIncome + medicineIncome + pathologyIncome+extraincome);
            dr[5] = "Rs." + totalIncome+"/-";
            TotalIncomeYearTotal += totalIncome;
            double expenses = ExpenseUtilities.GetAllTotalExpenseOfDateRange((i + 1) + "/01/" + selectedYear, (i + 1) + "/" + days + "/" + selectedYear);
            dr[6] = "Rs."+expenses+"/-";
            TotalExpenseYeatTotal += expenses;
            double cashinhand = totalIncome - expenses;
            dr[7] = "Rs." + cashinhand+"/-";
            CashInHandYearTotal += cashinhand;
            dr[8] = "View";
            dt.Rows.Add(dr);
        }
        

        grdGv.DataSource = dt;
        grdGv.DataBind();
        

    }
    public void SetYear()
    {
        try
        {
            DateTime today = System.DateTime.Now.AddHours(12.5);
            for (int i = today.Year; i >= 2018; i--)
            {
                ListItem li = new ListItem();
                li.Text = "" + i;
                li.Value = "" + i;
                ddselectyear.Items.Add(li);
            }

        }
        catch
        {

        }
    }
  

    protected void grdGv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int year=Convert.ToInt32(ddselectyear.SelectedValue);
        HyperLink hl = new HyperLink();
        hl.Text = "View Details";
        hl.NavigateUrl = "summarydetails.aspx?y="+year+"&M="+e.Row.Cells[0].Text;
        if (e.Row.RowType == DataControlRowType.DataRow)
          e.Row.Cells[8].Controls.Add(hl);
       
    }
    protected void grdGv_DataBound(object sender, EventArgs e)
    {
        grdGv.FooterRow.Cells[0].Text = "Total";
        grdGv.FooterRow.Cells[1].Text = "Rs." + HospitalYearsTotal + "/-";
        grdGv.FooterRow.Cells[2].Text = "Rs." + MedicineYearsTotal + "/-";
        grdGv.FooterRow.Cells[3].Text = "Rs." + PathologyYearsTotal + "/-";
        grdGv.FooterRow.Cells[4].Text = "Rs." + extraIncomeYearTotal + "/-";
        grdGv.FooterRow.Cells[5].Text = "Rs." + TotalIncomeYearTotal + "/-";
        grdGv.FooterRow.Cells[6].Text = "Rs." + TotalExpenseYeatTotal + "/-";
        grdGv.FooterRow.Cells[7].Text = "Rs." + CashInHandYearTotal + "/-";
        
    }
}