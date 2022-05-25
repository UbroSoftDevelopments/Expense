using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class holdamount : System.Web.UI.Page
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
                throw new Exception("Please Enter Valid Date!!");
            DateTime date = Convert.ToDateTime(txtdate.Text);
            if (txtamount.Text.Equals("") || txtamount.Text.Equals(null) || Convert.ToDouble(txtamount.Text) <= 0)
                throw new Exception("Please Enter Valid Amount!!");
            double amount = Convert.ToDouble(txtamount.Text);
            string reason=txtcomments.Text;
            if (reason.Equals(""))
                reason = " ";
            DataSet1TableAdapters.holdamountTableAdapter da = new DataSet1TableAdapters.holdamountTableAdapter();
            da.Insert(amount, reason, date, "pending");
            lblmessage.CssClass = "w3-text-green";
            lblmessage.Text = "Successfully Entered!!";
            GridView1.DataBind();
                


        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-text-red";
            lblmessage.Text = ex.Message;
        }

    }
    protected void btreset_Click(object sender, EventArgs e)
    {
        lblmessage.Text = " ";
        txtamount.Text = " ";
        txtcomments.Text = " ";
        txtdate.Text = " ";
    }
}