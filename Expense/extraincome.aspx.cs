using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class extraincome : System.Web.UI.Page
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
            string source = txtsourceofincome.Text;
            if (source.Equals("") || source.Equals(null))
                throw new Exception("Enter Source Of Income!!");
            if (txtdate.Text.Equals("") || txtdate.Text.Equals(null))
                throw new Exception("Enter Valid Date!!");
            DateTime date = Convert.ToDateTime(txtdate.Text);
            if (txtamount.Text.Equals("") || txtamount.Text.Equals(null) || Convert.ToDouble(txtamount.Text) <= 0)
                throw new Exception("Please Enter Valid Amount!!");
            double amount = Convert.ToDouble(txtamount.Text);
            DataSet1TableAdapters.extraincomeTableAdapter da = new DataSet1TableAdapters.extraincomeTableAdapter();
            da.Insert(source, amount, date);
            GridView1.DataBind();
            lblmesaage.CssClass = "w3-large w3-text-green";
            lblmesaage.Text = "Successfully Entered!!";
        }
        catch (Exception ex)
        {
            lblmesaage.CssClass = "w3-large w3-text-red";
            lblmesaage.Text = ex.Message;
        }
    }
}