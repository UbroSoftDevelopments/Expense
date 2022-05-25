using Expense.DataManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expense
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.IsUserLoggedIn(Session);
            if (!b)
                Response.Redirect("login.aspx");
            try
            {
                tthospitalpatients.InnerHtml = "<b>" + ExpenseUtilities.GetHospitalPatientCountOnPerticulardate(System.DateTime.Now.AddHours(12.5)) + "<br/>Patients</b>";
                ttpathologypatients.InnerHtml = "<b>" + ExpenseUtilities.GetPathologyPatientCountOnPerticulardate(System.DateTime.Now.AddHours(12.5)) + "<br/>Patients</b>";
                ttmedicalpatients.InnerHtml = "<b>" + ExpenseUtilities.GetMedicalPatientCountOnPerticulardate(System.DateTime.Now.AddHours(12.5)) + "<br/>Patients</b>";
            }
            catch (Exception ex)
            {

            }

        }
        protected void btsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string expense = txtexpenseon.Text;
                if (expense.Equals(""))
                    throw new Exception("Please Enter Expense Description!!");
                if (txtamount.Text.Equals("") || txtamount.Text.Equals(null) || Convert.ToDouble(txtamount.Text) <= 0)
                    throw new Exception("Please Enter Valid Amount!!");
                double amount = Convert.ToDouble(txtamount.Text);
                if (txtdate.Text.Equals("") || txtdate.Text.Equals(null))
                    throw new Exception("Please Enter Valid Date!!");
                DateTime date = Convert.ToDateTime(txtdate.Text);
                DataSet1TableAdapters.dailyexpencesTableAdapter da = new DataSet1TableAdapters.dailyexpencesTableAdapter();
                da.Insert(expense, amount, date);
                lblmesaage.CssClass = "w3-text-green";
                lblmesaage.Text = "Successfully Added!!";

            }
            catch (Exception ex)
            {
                lblmesaage.CssClass = "w3-text-red";
                lblmesaage.Text = ex.Message;
            }
        }
        protected void btreset_Click(object sender, EventArgs e)
        {
            lblmesaage.Text = " ";
            txtexpenseon.Text = " ";
            txtamount.Text = " ";
        }
    }
}
