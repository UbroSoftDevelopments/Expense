using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loanperson : System.Web.UI.Page
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
            if (txtname.Text.Equals(""))
                throw new Exception("Please Enter The Name!!");
            if (txtmobileno.Text.Equals("") || txtmobileno.Text.Equals(null))
                throw new Exception("Please Enter Correct Mobile No. !!");
            if (txtaddress.Text.Equals("") || txtaddress.Text.Equals(null))
                throw new Exception("Please Enter Address!!");
            string name = txtname.Text;
            string number = txtmobileno.Text;
            string address = txtaddress.Text;
            DataSet1TableAdapters.loanpersonsTableAdapter da = new DataSet1TableAdapters.loanpersonsTableAdapter();
            da.Insert(name, number, address);
            GridView1.DataBind();
            lblmessage.CssClass = "w3-large w3-text-green";
            lblmessage.Text = "Entered SuccessFully!!";
        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-large w3-text-red";
            lblmessage.Text = ex.Message;

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        lblmessage.Text = " ";
        txtname.Text = " ";
        txtmobileno.Text = " ";
        txtaddress.Text = " ";
    }
}