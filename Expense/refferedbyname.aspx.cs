using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class refferedbyname : System.Web.UI.Page
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
            string name = txtname.Text;
            if (name.Equals(""))
                throw new Exception("Please Enter The Name Of Person!!");
            string address = txtaddress.Text;
            if (address.Equals(""))
                throw new Exception("Please Enter The Address!!");
            DataSet1TableAdapters.refferedpersonsTableAdapter da = new DataSet1TableAdapters.refferedpersonsTableAdapter();
            DataSet1.refferedpersonsDataTable dt = da.GetDataByNameAndAddress(name,address);
            if (dt.Rows.Count > 0)
                throw new Exception("Entry of this person has already been done !!");
            da.Insert(name, address);
            GridView1.DataBind();
            lblmessage.CssClass = "w3-text-green";
            lblmessage.Text = "Successfully Inserted!!";
        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-text-red";
            lblmessage.Text = ex.Message;
        }
    }
}