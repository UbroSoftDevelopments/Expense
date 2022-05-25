using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifiedindex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsVerifiedUserLoggedIn(Session);
        if (!b)
            Response.Redirect("allincomes.aspx");

    }
}