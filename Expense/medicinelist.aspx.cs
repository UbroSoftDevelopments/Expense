using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class medicinelist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        try
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("C.No");
            dt.Columns.Add("Ip No.");
            dt.Columns.Add("Customer Name");
            dt.Columns.Add("Address");
            dt.Columns.Add("Reffered From");
            dt.Columns.Add("View");
            DataSet1TableAdapters.customerdetailsTableAdapter cdta = new DataSet1TableAdapters.customerdetailsTableAdapter();
            DataSet1.customerdetailsDataTable cdt = cdta.GetRefferedDataOnly();
            for (int i = 0; i < cdt.Rows.Count; i++)
            {
                DataSet1.customerdetailsRow cr = (DataSet1.customerdetailsRow)cdt.Rows[i];
                string pname = cr.customername;
                DataSet1TableAdapters.doctorcutTableAdapter da = new DataSet1TableAdapters.doctorcutTableAdapter();
                DataSet1.doctorcutDataTable ddt = da.GetDataByPatientMedicineSno(cr.receiptno);
                if (ddt.Rows.Count > 0)
                    continue;
                DataRow dr = dt.NewRow();
                dr["C.No"] = cr.receiptno;
                dr["Ip No."] = cr.Ipno;
                dr["Customer Name"] = pname;
                dr["Address"] = cr.address;
                dr["Reffered From"] = cr.refferedby;
                dt.Rows.Add(dr);

            }
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        catch(Exception ex)
        {
            Response.Write("" + ex.Message);
        }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // CREATE A LinkButton AND IT TO EACH ROW.
            LinkButton lb = new LinkButton();
            lb.ID = "lbBooks";
            lb.Text = "Select";
            lb.PostBackUrl = "setcut.aspx?pno=" + e.Row.Cells[0].Text+"&type=M";
            //lb.ta
            e.Row.Cells[5].Controls.Add(lb);
        }
    }
}