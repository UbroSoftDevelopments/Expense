using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class selectemployeeforpayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsVerifiedUserLoggedIn(Session);
        if (!b)
            Response.Redirect("allincomes.aspx");
    }
    protected void btsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int eno = Convert.ToInt32(ddemployee.SelectedValue);
            if (eno < 0)
                throw new Exception("Please Select Employee !!");
            Response.Redirect("employeepayment.aspx?eno=" + eno);


        }
        catch (Exception ex)
        {
            lblmesage.CssClass = "w3-text-red w3-text-large";
            lblmesage.Text = ex.Message;
        }
    }
}