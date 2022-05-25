using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifiedlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btlogin_Click(object sender, EventArgs e)
    {
        try
        {
            string code = txtcode.Text;
            if (code.Equals("") || code.Equals(null))
                throw new Exception("Please Enter Code !!");
            bool b = LoginManager.DoVerifiedLogin(code, Session, Response);
            if (!b)
                throw new Exception("Invalid Login !!");
        }
        catch(Exception ex)
        {
            lblmessage.CssClass = "w3-large w3-text-red";
            lblmessage.Text = ex.Message;
        }
    }
}