using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkdoctorscut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        doctoraccountdiv.Visible = false;
    }
    protected void brcheck_Click(object sender, EventArgs e)
    {
        try
        {
            int doctorno = Convert.ToInt32(ddrefferedlist.SelectedValue);
            if (doctorno <= 0)
                throw new Exception("Please Select Reffered By Name!!");
            doctoraccountdiv.Visible = true;
            double amountapplied = refferedutilities.GetDoctorsTotalPaymentFromDoctorCutThroughDoctorNo(doctorno);
            double amountpaid = refferedutilities.GetTotalPaymentDoneToDoctorByDoctorNo(doctorno);
            ttappliedamount.InnerHtml = "<b>"+amountapplied+"/-</b>";
            ttpaidamount.InnerHtml = "<b>" + amountpaid + "/-</b>";
            double amountleft = amountapplied - amountpaid;
            ttleftamount.InnerHtml = "<b>"+amountleft+"</b>";
        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message;
        }
    }
}