using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class allmedicalincome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        
        try
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Date");
            dt.Columns.Add("Amount");
            dt.Columns.Add("View Details");

            DataSet1TableAdapters.customerdetailsTableAdapter da = new DataSet1TableAdapters.customerdetailsTableAdapter();
            DataSet1.customerdetailsDataTable cdt = da.GetData();
            DateTime lastDate = Convert.ToDateTime("1/1/1990");
            double amount = 0;
            for (int i = cdt.Rows.Count - 1; i >= 0; i--)
            {

                DataSet1.customerdetailsRow cdr = (DataSet1.customerdetailsRow)cdt.Rows[i];
                DataRow dr = dt.NewRow();
                string dateofPayment = "" + cdr.dateofpurchase.Month + "/" + cdr.dateofpurchase.Day + "/" + cdr.dateofpurchase.Year;
                DateTime dat = Convert.ToDateTime(dateofPayment);
                if (lastDate == dat)
                    continue;
                lastDate = dat;
                amount = ExpenseUtilities.GetTotalIncomeFromMedicineByDate(cdr.dateofpurchase);
                dr["Date"] = DateUtilties.FormattedDate(cdr.dateofpurchase);
                dr["Amount"] = amount;
                dt.Rows.Add(dr);
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        catch (Exception ex)
        {
            Response.Write("" + ex.Message);
        }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // CREATE A LinkButton AND IT TO EACH ROW.
            LinkButton lb = new LinkButton();
            lb.ID = "lbdetails";
            lb.Text = "View Details";
            lb.Style.Add("text-decoration", "none");
            lb.Style.Add("cursor", "Pointer");
            lb.PostBackUrl = "particulardatemedicineincome.aspx?d=" + Convert.ToDateTime(e.Row.Cells[0].Text);
            //lb.ta
            e.Row.Cells[2].Controls.Add(lb);
        }
    }
    protected void btsearch_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Date");
            dt.Columns.Add("Amount");
            dt.Columns.Add("View Details");
            
            DateTime date = Convert.ToDateTime(txtsearch.Text);
            DataRow dr = dt.NewRow();
            double amount = ExpenseUtilities.GetTotalIncomeFromMedicineByDate(date);
            if (amount.Equals(null))
                throw new Exception("No Payment Accepted On This Date!!");
            dr["Date"] = DateUtilties.FormattedDate(date);
            dr["Amount"] = amount;
            dt.Rows.Add(dr);

            GridView1.DataSource = dt;
            GridView1.DataBind();
            lblmessage.Text = "";
        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-text-red w3-large";
            lblmessage.Text = ex.Message;
        }

    }
}