using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editcut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        string ipno = Request.QueryString["ipno"];
        if (ipno.Equals("") || ipno.Equals(null))
            Response.Redirect("index.aspx");
    }
}