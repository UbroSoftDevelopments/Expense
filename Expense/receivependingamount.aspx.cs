using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class receivependingamount : System.Web.UI.Page
{
    int sno;
    protected void Page_Load(object sender, EventArgs e)
    {
        sno = Convert.ToInt32(Request.QueryString["sno"]);
        if (!Request.QueryString.HasKeys())
            Response.Redirect("holdamount.aspx");
        DataSet1TableAdapters.holdamountTableAdapter da = new DataSet1TableAdapters.holdamountTableAdapter();
        DataSet1.holdamountDataTable dt = da.GetDataBySno(sno);
        DataSet1.holdamountRow dr = (DataSet1.holdamountRow)dt.Rows[0];
        txtamount.Text = ""+dr.amount;
        txtcomment.Text = dr.reason;
    }
    protected void btsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtdate.Text.Equals("") || txtdate.Text.Equals(null))
                throw new Exception("Please Enter Valid Date!!");
            DateTime date = Convert.ToDateTime(txtdate.Text);
            double amount = Convert.ToDouble(txtamount.Text);
            string reason = txtcomment.Text;
            if (reason.Equals(""))
                throw new Exception("Enter Comments!!");
            DataSet1TableAdapters.receiveholdamountdataTableAdapter da = new DataSet1TableAdapters.receiveholdamountdataTableAdapter();
            da.Insert(sno, date, reason);
            DataSet1TableAdapters.holdamountTableAdapter hda = new DataSet1TableAdapters.holdamountTableAdapter();
            hda.UpdateStatusBySno("paid", sno);
            DataSet1TableAdapters.extraincomeTableAdapter xda = new DataSet1TableAdapters.extraincomeTableAdapter();
            xda.Insert(reason, amount, date);
            lblmessage.CssClass = "w3-large w3-text-green";
            lblmessage.Text = "SuccessFully Received!!";
            Response.Redirect("holdamount.aspx");
        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-large w3-text-red";
            lblmessage.Text = ex.Message;
        }

    }
}