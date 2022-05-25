using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class selectdoctortopay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
    }
    protected void btproceed_Click(object sender, EventArgs e)
    {
        try
        {
            int doctorno = Convert.ToInt32(ddrefferedlist.SelectedValue);
            if (doctorno <= 0)
                throw new Exception("Please Select Doctor!!");
            Response.Redirect("doctorpayment.aspx?dno=" + doctorno);

        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message;
        }

    }
}