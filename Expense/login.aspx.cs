using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string userid = txtUserId.Text;
            string password = txtPassword.Text;
            bool b = LoginManager.DoLogin(userid, password, Session, Response);
            if (!b)
                lblMsg.Text = "Invalid Userid Or Password!!";
        }
        catch
        {

        }

    }
}