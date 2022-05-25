using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class patientlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        try
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("P. No.");
            dt.Columns.Add("Ip Number");
            dt.Columns.Add("Patient Name");
            dt.Columns.Add("Address");
            dt.Columns.Add("Reffered By");
            dt.Columns.Add("Set Cut");
           
            DataSet1TableAdapters.opdformTableAdapter ota = new DataSet1TableAdapters.opdformTableAdapter();
            DataSet1.opdformDataTable odt = ota.GetReferredDataOnly();


            for (int i = 0; i < odt.Rows.Count; i++)
            {
                DataSet1.opdformRow or = (DataSet1.opdformRow)odt.Rows[i];
                string pname = or.firstname + " " + or.lastname;
                DataSet1TableAdapters.doctorcutTableAdapter da = new DataSet1TableAdapters.doctorcutTableAdapter();
                DataSet1.doctorcutDataTable ddt = da.GetDataByPatientHospitalSno(or.patientno);
                if (ddt.Rows.Count > 0)
                    continue;
                DataRow dr = dt.NewRow();
                dr["P. No."] = or.patientno;
                dr["Ip Number"] = or.ipnumber;
                dr["Patient Name"] = or.firstname + " " + or.lastname;
                dr["Address"] = or.address;
                dr["Reffered By"] = or.referredfrom;
                
                dt.Rows.Add(dr);
                
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
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
            lb.PostBackUrl = "setcut.aspx?pno=" + e.Row.Cells[0].Text + "&type=H";
            //lb.ta
            e.Row.Cells[5].Controls.Add(lb);
        }
    }
}