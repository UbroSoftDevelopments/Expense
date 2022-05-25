using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class returnloanamount : System.Web.UI.Page
{
    int pno = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
       pno = Convert.ToInt32(Request.QueryString["sno"]);
        if (pno <= 0)
            Response.Redirect("selecttopayloan.aspx");
        if(!Request.QueryString.HasKeys())
            Response.Redirect("selecttopayloan.aspx");
        double amount=LoanUtilities.GetReamainingLoanAmountToPayByPersonNo(pno);
        lblamounttopay.CssClass = "w3-text-red";
        lblamounttopay.Text ="Amount To Pay: "+amount+"/-";

    }
    protected void btpay_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtdate.Text.Equals("") || txtdate.Text.Equals(null))
                throw new Exception("Please Select Correct Date!!");
            DateTime dateofpayment = Convert.ToDateTime(txtdate.Text);
            if (txtamount.Text.Equals("") || txtamount.Text.Equals(null) || Convert.ToInt32(txtamount.Text) <= 0)
                throw new Exception("Please Enter Valid Amount To Pay!!");
            double amount = Convert.ToDouble(txtamount.Text);
            string comment = txtcomment.Text;
            if (comment.Equals("") || comment.Equals(null))
                throw new Exception("Please Give Comments!!");
            DataSet1TableAdapters.loanpaiddateTableAdapter pda = new DataSet1TableAdapters.loanpaiddateTableAdapter();
            pda.Insert(pno,amount,dateofpayment,comment);
            string name=LoanUtilities.GetLoanPersonNameBySno(pno);
            DataSet1TableAdapters.dailyexpencesTableAdapter dda = new DataSet1TableAdapters.dailyexpencesTableAdapter();
            dda.Insert("Paid Loan Amount To" + name, amount, dateofpayment);
            lblmessage.CssClass = "w3-large w3-text-green";
            lblmessage.Text = "Paid SuccessFully!!";
            GridView1.DataBind();

        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-large w3-text-red";
            lblmessage.Text = ex.Message;
        }
    }
   
}