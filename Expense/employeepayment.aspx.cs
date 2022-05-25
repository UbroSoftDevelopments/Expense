using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeepayment : System.Web.UI.Page
{
    int eno = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsVerifiedUserLoggedIn(Session);
        if (!b)
            Response.Redirect("allincome.aspx");
        eno = Convert.ToInt32(Request.QueryString["eno"]);
        if (eno <= 0)
            Response.Redirect("selectemployeeforpayment.aspx");
        double paymentdone=EmployeeUtilities.GetTotalAmountPaidToEmployeeByEno(eno);
        lbltotalpayment.Text = "Total Payment Done Till Date:- " + paymentdone + "/-";
    }
    protected void btsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtamount.Text.Equals("") || txtamount.Text.Equals(null))
                throw new Exception("Please Enter Amount !!");
            double amount = Convert.ToDouble(txtamount.Text);
            if (amount <= 0)
                throw new Exception("Invalid Amount !!");
            if (txtdate.Text.Equals("") || txtdate.Equals(null))
                throw new Exception("Please Select Date !!");
            DateTime date = Convert.ToDateTime(txtdate.Text);
            string paymentdetails = txtpaymentdetails.Text;
            if (paymentdetails.Equals(" ") || paymentdetails.Equals(null))
                throw new Exception("Please Add Payment Details !!");
            string comment = txtcomment.Text;
            if (comment.Equals(" ") || comment.Equals(null))
                comment = " ";
            DataSet1TableAdapters.employeepaymentTableAdapter da = new DataSet1TableAdapters.employeepaymentTableAdapter();
            da.Insert(eno, amount, date, paymentdetails, comment);
            DataSet1TableAdapters.dailyexpencesTableAdapter de = new DataSet1TableAdapters.dailyexpencesTableAdapter();
           string employeename=EmployeeUtilities.GetEmployeeNameByEmployeeNo(eno);
           de.Insert("Paid To " + employeename, amount, date);
            GridView1.DataBind();
            lblmesaage.CssClass = "w3-text-green w3-large";
            lblmesaage.Text = "Payment Added Successfully !!";


        }
        catch (Exception ex)
        {
            lblmesaage.CssClass = "w3-text-red w3-large";
            lblmesaage.Text = ex.Message;
        }
    }
    protected void btreset_Click(object sender, EventArgs e)
    {
        lblmesaage.Text = " ";
        txtdate.Text = " ";
        txtamount.Text = " ";
        txtpaymentdetails.Text = " ";
        txtcomment.Text = " ";
    }
}