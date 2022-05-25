using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class pathologylist : System.Web.UI.Page
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
            dt.Columns.Add("Ip No.");
            dt.Columns.Add("Patient Name");
            dt.Columns.Add("Address");
            dt.Columns.Add("Reffered By");
            dt.Columns.Add("View");
            DataSet1TableAdapters.patient_detailsTableAdapter pda = new DataSet1TableAdapters.patient_detailsTableAdapter();
            DataSet1.patient_detailsDataTable pdt = pda.GetRefferedDataOnly();

            for (int i = 0; i <= pdt.Rows.Count - 1; i++)
            {
                DataSet1.patient_detailsRow pdr = (DataSet1.patient_detailsRow)pdt.Rows[i];
                DataSet1TableAdapters.doctorcutTableAdapter dda = new DataSet1TableAdapters.doctorcutTableAdapter();
                DataSet1.doctorcutDataTable ddt = dda.GetDataByPatientPathologySno(pdr.sno);
                if (ddt.Rows.Count > 0)
                    continue;
                DataRow dr = dt.NewRow();
                dr["P. No."] = pdr.sno;
                dr["Ip No."] = pdr.Ipno;
                dr["Patient Name"] = pdr.patientname;
                dr["Address"] = pdr.address;
                dr["Reffered By"] = pdr.referedby;
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
            lb.PostBackUrl = "patienttestdetails.aspx?pno=" + e.Row.Cells[0].Text;
            //lb.ta
            e.Row.Cells[5].Controls.Add(lb);
        }
    }
}