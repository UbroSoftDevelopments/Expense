using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dateselectforalldata : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
    }
    protected void btsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtdate.Text.Equals("") || txtdate.Text.Equals(null))
                throw new Exception("Select Valid Date");
            DateTime date = Convert.ToDateTime(txtdate.Text);
            Response.Redirect("alltotaldata.aspx?d=" + date);
        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-text-large w3-text-red";
            lblmessage.Text = ex.Message;
        }
    }
}