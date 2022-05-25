using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class patientspaymentdetails : System.Web.UI.Page
{
    string datatype="";
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        try
        {
            if (!Request.QueryString.HasKeys())
                Response.Redirect("index.aspx");
            datatype = Request.QueryString["t"];
            if (datatype.Equals(" ") || datatype.Equals(null))
                Response.Redirect("index.aspx");
            if (datatype.Equals("H"))
            {

                lbldatatype.Text = "HOSPITAL DATA";
                DataTable dt = new DataTable();
                dt.Columns.Add("P No.");
                dt.Columns.Add("Ip No.");
                dt.Columns.Add("Patient Name");
                dt.Columns.Add("Address");
                dt.Columns.Add("Reffered By");
                dt.Columns.Add("Amount Applied");
                dt.Columns.Add("Cut %");
                dt.Columns.Add("Cut Amount");

                DataSet1TableAdapters.opdformTableAdapter da = new DataSet1TableAdapters.opdformTableAdapter();
                DataSet1.opdformDataTable opddt = da.GetDataByDate("" + System.DateTime.Now);
                for (int i = 0; i <= opddt.Rows.Count - 1; i++)
                {
                    DataSet1.opdformRow opddr = (DataSet1.opdformRow)opddt.Rows[i];
                    string ip = opddr.ipnumber;
                    double cut = 0;
                    DataSet1TableAdapters.doctorcutTableAdapter dda = new DataSet1TableAdapters.doctorcutTableAdapter();
                    DataSet1.doctorcutDataTable ddt = dda.GetDataByIpNo(ip);
                    //Title = "" + ddt.Rows.Count + " p";
                    if (ddt.Rows.Count > 0)
                    {
                        DataSet1.doctorcutRow ddr = (DataSet1.doctorcutRow)ddt.Rows[0];
                        cut = ddr.completecut;
                        if (cut <= 0)
                            cut = ddr.hospitalcut;
                    }
                    DataRow dr = dt.NewRow();
                    dr["P No."] = opddr.patientno;
                    dr["Ip No."] = opddr.ipnumber;
                    dr["Patient Name"] = opddr.firstname + " " + opddr.lastname;
                    dr["Address"] = opddr.address;
                    dr["Reffered By"] = opddr.referredfrom;
                    double amountpaid = ExpenseUtilities.GetTotalAmountAppliedOnPatientInHospitalByPatientNo(opddr.patientno);
                    dr["Amount Applied"] = amountpaid;
                    dr["Cut %"] = cut + "%";
                    dr["Cut Amount"] = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(cut, amountpaid) + "/-";
                    dt.Rows.Add(dr);


                }
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            if (datatype.Equals("P"))
            {
                lbldatatype.Text = "PATHOLOGY DATA";
                DataTable dt = new DataTable();
                dt.Columns.Add("P No.");
                dt.Columns.Add("Ip No.");
                dt.Columns.Add("Patient Name");
                dt.Columns.Add("Address");
                dt.Columns.Add("Reffered By");
                dt.Columns.Add("Amount Applied");
                dt.Columns.Add("Cut %");
                dt.Columns.Add("Cut Amount");

                 DataSet1TableAdapters.patient_detailsTableAdapter da = new DataSet1TableAdapters.patient_detailsTableAdapter();
                DataSet1.patient_detailsDataTable pdt = da.GetDataByDate("" + System.DateTime.Now);
                for (int i = 0; i <= pdt.Rows.Count - 1; i++)
                {
                    DataSet1.patient_detailsRow pdr = (DataSet1.patient_detailsRow)pdt.Rows[i];
                    double cut = 0;
                    DataSet1TableAdapters.doctorcutTableAdapter dda = new DataSet1TableAdapters.doctorcutTableAdapter();
                    DataSet1.doctorcutDataTable ddt = dda.GetDataByPatientPathologySno(pdr.sno);
                  
                    if (ddt.Rows.Count > 0)
                    {
                        DataSet1.doctorcutRow ddr = (DataSet1.doctorcutRow)ddt.Rows[0];
                        cut = ddr.completecut;
                        if (cut <= 0)
                            cut = ddr.pathologycut;
                    }
                    DataRow dr = dt.NewRow();
                    dr["P No."] = pdr.sno;
                    dr["Ip No."] = pdr.Ipno;
                    dr["Patient Name"] = pdr.patientname;
                    dr["Address"] = pdr.address;
                    dr["Reffered By"] = pdr.referedby;

                    double amountpaid = ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyByPatientNo(pdr.sno);
                    dr["Amount Applied"] = amountpaid;
                    dr["Cut %"] = cut + "%";
                    dr["Cut Amount"] = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(cut, amountpaid) + "/-";
                    dt.Rows.Add(dr);

                }
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            if (datatype.Equals("M"))
            {
                lbldatatype.Text = "MEDICAL DATA";
               
                DataTable dt = new DataTable();
                dt.Columns.Add("P No.");
                dt.Columns.Add("Ip No.");
                dt.Columns.Add("Patient Name");
                dt.Columns.Add("Address");
                dt.Columns.Add("Reffered By");
                dt.Columns.Add("Amount Applied");
                dt.Columns.Add("Cut %");
                dt.Columns.Add("Cut Amount");

                DataSet1TableAdapters.customerdetailsTableAdapter da = new DataSet1TableAdapters.customerdetailsTableAdapter();
                DataSet1.customerdetailsDataTable cdt = da.GetDataByDate("" + System.DateTime.Now);
                for (int i = 0; i <= cdt.Rows.Count - 1; i++)
                {
                    DataSet1.customerdetailsRow cdr = (DataSet1.customerdetailsRow)cdt.Rows[i];
                    double cut = 0;
                    DataSet1TableAdapters.doctorcutTableAdapter dda = new DataSet1TableAdapters.doctorcutTableAdapter();
                    DataSet1.doctorcutDataTable ddt = dda.GetDataByPatientMedicineSno(cdr.receiptno);

                    if (ddt.Rows.Count > 0)
                    {
                        DataSet1.doctorcutRow ddr = (DataSet1.doctorcutRow)ddt.Rows[0];
                        cut = ddr.completecut;
                        if (cut <= 0)
                            cut = ddr.medicinecut;
                    }
                    DataRow dr = dt.NewRow();
                    dr["P No."] = cdr.receiptno;
                    dr["Ip No."] = cdr.Ipno;
                    dr["Patient Name"] = cdr.customername;
                    dr["Address"] = cdr.address;
                    dr["Reffered By"] = cdr.refferedby;

                    double amountpaid = ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineByPatientNo(cdr.receiptno);
                    dr["Amount Applied"] = amountpaid;
                    dr["Cut %"] = cut + "%";
                    dr["Cut Amount"] = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(cut, amountpaid) + "/-";
                    dt.Rows.Add(dr);

                }
                GridView1.DataSource = dt;
                GridView1.DataBind();


            }
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
   
}