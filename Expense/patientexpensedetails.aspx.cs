using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patientexpensedetails : System.Web.UI.Page
{
    int pno = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        pno = Convert.ToInt32(Request.QueryString["pno"]);
        if (pno <= 0)
            Response.Redirect("patientexpensedata.aspx");
        lblpatientname.CssClass = "w3-xlarge w3-text-red";
        lblpatientname.Text = "PATIENT NAME:-"+PatientUtilities.GetHospitalPatientFullNameByPatientNo(pno);
        lblpatientamount.CssClass = "w3-xlarge w3-text-red";
        lblpatientamount.Text = "Total Amount:-  " + PatientUtilities.GetPatientTotalExpenseByPatientNo(pno)+"/-";
        lblopddate.CssClass = "w3-large w3-text-black";
        lblopddate.Text = "OPD Date:- " + PatientUtilities.GetPatientOpdDateByPatientNo(pno);
        lblipddate.CssClass = "w3-large w3-text-black";
        lblipddate.Text = "IPD Date:- " + PatientUtilities.GetPatientIpdDateByPatientNo(pno);
        lbldischarge.CssClass = "w3-large w3-text-black";
        lbldischarge.Text = "Discharge On:- " + PatientUtilities.GetPatientDischargeDateByPatientNo(pno);
        
    }
}