using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee : System.Web.UI.Page
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
            string name = txtemployeename.Text;
            if (name.Equals("") || name.Equals(null))
                throw new Exception("Please Enter Name Of Employee !!");
            string gender = ddgender.SelectedValue;
            if(ddgender.SelectedValue.Equals("Select"))
                throw new Exception("Please Select Gender Of Employee !!");
            string address = txtaddress.Text;
            if (address.Equals("") || address.Equals(null))
                throw new Exception("Please Enter Address Of Employee !!");
            string contactno = txtcontactno.Text;
            if (contactno.Equals("") || contactno.Equals(null))
                throw new Exception("Please Enter Contact No. !!");
            if (Convert.ToInt64(txtcontactno.Text) <= 6000000000 || Convert.ToInt64(txtcontactno.Text) >= 9999999999)
                throw new Exception("Invalid Mobile No. !!");
            DataSet1TableAdapters.employeeTableAdapter da = new DataSet1TableAdapters.employeeTableAdapter();
            DataSet1.employeeDataTable dt = da.GetDataByEmployeenameAndAddress(name, address);
            if (dt.Rows.Count > 0)
                throw new Exception("This Employee Has Already In List !!");
            da.Insert(name, gender, address, contactno, "Active");
            GridView1.DataBind();
            lblmessage.CssClass = "w3-large w3-text-green";
            lblmessage.Text = "Employee/Person Added Successfully !!";
        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-large w3-text-red";
            lblmessage.Text = ex.Message;
        }

    }
    protected void btreset_Click(object sender, EventArgs e)
    {
        lblmessage.Text = " ";
        txtemployeename.Text = " ";
        txtcontactno.Text = " ";
        txtaddress.Text = " ";
        ddgender.SelectedIndex = 0;
    }
}