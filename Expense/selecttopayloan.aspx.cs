using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class selecttopayloanDefault : System.Web.UI.Page
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
            int index = ddloanperson.SelectedIndex;
            if (index <= 0)
                throw new Exception("Please Select Name Of Person!!");
            int personno = Convert.ToInt32(ddloanperson.SelectedValue);
            Response.Redirect("returnloanamount.aspx?sno=" + personno);
        }
        catch (Exception ex)
        {
            lblmesaage.Text = ex.Message;
        }
    }
}