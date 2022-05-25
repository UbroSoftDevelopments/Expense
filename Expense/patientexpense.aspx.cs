using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patientexpense : System.Web.UI.Page
{
    int pno = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        pno = Convert.ToInt32(Request.QueryString["pno"]);
        if (pno <= 0)
            Response.Redirect("selectpatienttoaddexpense.aspx");

    }
    protected void btsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtamount.Text.Equals("") || txtamount.Text.Equals(null))
                throw new Exception("Please Enter Amount !!");
            if (Convert.ToDouble(txtamount.Text) <= 0)
                throw new Exception("Please Enter Valid Amount !!");
            double amount = Convert.ToDouble(txtamount.Text);
            if (txtdate.Text.Equals(""))
                throw new Exception("Please Enter Or Select Date !!");
            DateTime date = Convert.ToDateTime(txtdate.Text);
            string reason = txtexpensereason.Text;
            if (reason.Equals("") || reason.Equals(null))
                throw new Exception("Enter Mode Of Expense !!");
            DataSet1TableAdapters.patientexpenseTableAdapter da = new DataSet1TableAdapters.patientexpenseTableAdapter();
            da.Insert(pno, amount, date,reason);
            string patientname=PatientUtilities.GetHospitalPatientFullNameByPatientNo(pno);
            DataSet1TableAdapters.dailyexpencesTableAdapter de = new DataSet1TableAdapters.dailyexpencesTableAdapter();
            de.Insert("Paid To " + patientname, amount, date);
            GridView1.DataBind();
            lblmesaage.CssClass = "w3-large w3-text-green";
            lblmesaage.Text = "Expense Added Successfully !!";
        }
        catch (Exception ex)
        {
            lblmesaage.CssClass = "w3-large w3-text-red";
            lblmesaage.Text = ex.Message;
        }
    }
    protected void btreset_Click(object sender, EventArgs e)
    {
        lblmesaage.Text = " ";
        txtamount.Text = " ";
        txtdate.Text = " ";
        txtexpensereason.Text = " ";
    }
}