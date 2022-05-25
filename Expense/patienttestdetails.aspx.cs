using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patienttestdetails : System.Web.UI.Page
{
    int pno;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        pno = Convert.ToInt32(Request.QueryString["pno"]);
        if (pno <= 0)
            Response.Redirect("pathologylist.aspx");
    }
    protected void btsetcut_Click(object sender, EventArgs e)
    {
        Response.Redirect("setcut.aspx?pno=" + pno + "&type=P");
    }
}