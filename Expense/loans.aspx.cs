using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loans : System.Web.UI.Page
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
            if (index <=0)
                throw new Exception("Please Select Name Of Person!!");
            int personno = Convert.ToInt32(ddloanperson.SelectedValue);
            if (txtamount.Text.Equals("") || txtamount.Text.Equals(null) || Convert.ToDouble(txtamount.Text) <= 0)
                throw new Exception("Please Enter Valid Amount!!");
            double amount = Convert.ToDouble(txtamount.Text);
            if (txtdate.Text.Equals("") || txtdate.Text.Equals(null))
                throw new Exception("Please Select Valid Date!!");
            DateTime date=Convert.ToDateTime(txtdate.Text);
            DataSet1TableAdapters.loandataTableAdapter da = new DataSet1TableAdapters.loandataTableAdapter();
            da.Insert(personno, amount, date);
            DataSet1TableAdapters.extraincomeTableAdapter xda = new DataSet1TableAdapters.extraincomeTableAdapter();
            string personname=ddloanperson.SelectedItem.Text;
            xda.Insert("Loan From" + personname, amount, date);
            GridView1.DataBind();
            lblmesaage.CssClass = "w3-large w3-text-green";
            lblmesaage.Text = "SuccessFully Added!!";

        }
        catch (Exception ex)
        {
            lblmesaage.CssClass = "w3-large w3-text-red";
            lblmesaage.Text = ex.Message;
        }
    }
}