using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doctorpayment : System.Web.UI.Page
{
    int dno;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
         dno = Convert.ToInt32(Request.QueryString["dno"]);
        if (!Request.QueryString.HasKeys())
            Response.Redirect("selectdoctortopay.aspx");
        if(dno<=0||dno.Equals(null))
            Response.Redirect("selectdoctortopay.aspx");
        double amountapplied = refferedutilities.GetDoctorsTotalPaymentFromDoctorCutThroughDoctorNo(dno);
        double amountpaid = refferedutilities.GetTotalPaymentDoneToDoctorByDoctorNo(dno);
        ttappliedamount.InnerHtml = "<b>" + amountapplied + "/-</b>";
        ttpaidamount.InnerHtml = "<b>" + amountpaid + "/-</b>";
        double amountleft = amountapplied - amountpaid;
        ttleftamount.InnerHtml = "<b>" + amountleft + "</b>";
    }
    protected void btpay_Click(object sender, EventArgs e)
    {
        try
        {
            double amount = Convert.ToDouble(txtamount.Text);
            if (amount <= 0)
                throw new Exception("Please Enter Valid Amount!!");
            if (txtdate.Text.Equals("") || txtdate.Text.Equals(null))
                throw new Exception("Please Enter Valid Date!!");
            DateTime date=Convert.ToDateTime(txtdate.Text);
            string comments = txtcomment.Text;
            if (comments.Equals(""))
                comments = " ";
            DataSet1TableAdapters.doctorpaidamountTableAdapter da = new DataSet1TableAdapters.doctorpaidamountTableAdapter();
            da.Insert(dno, amount, date,comments);
            string doctorname=refferedutilities.GetRefferedByNameBySno(dno);
            DataSet1TableAdapters.dailyexpencesTableAdapter de = new DataSet1TableAdapters.dailyexpencesTableAdapter();
            de.Insert("Paid To Doctor " + doctorname, amount, date);
            lblmessage.CssClass = "w3-text-green w3-large";
            lblmessage.Text = "Successfully Paid!!";
            GridView1.DataBind();
            Page_Load(sender, e);
            
        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-text-red w3-large";
            lblmessage.Text = ex.Message;
        }

    }
    protected void btreset_Click(object sender, EventArgs e)
    {
        lblmessage.Text = " ";
        txtamount.Text = " ";
        txtcomment.Text = " ";
    }
}