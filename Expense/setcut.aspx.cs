using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class setcut : System.Web.UI.Page
{
    int pno;
    string ptype;
    string ipno = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        bool d = LoginManager.IsUserLoggedIn(Session);
        if (!d)
            Response.Redirect("login.aspx");
        pno=Convert.ToInt32(Request.QueryString["pno"]);

        ptype = Request.QueryString["type"];

        rdcuttype_SelectedIndexChanged(sender, e);
        DataSet1TableAdapters.doctorcutTableAdapter dcta = new DataSet1TableAdapters.doctorcutTableAdapter();
        DataSet1.doctorcutDataTable dcdt;
        bool b=false, c=false;
        if (ptype.Equals("M"))
        {
            ipno = PatientTestUtilities.GetIpNoFromMedicine(pno);
            lblipno.Text = ipno;
            lblpname.Text = PatientTestUtilities.GetPatientNameFromMedicine(pno);
            dcdt = dcta.GetDataByPatientMedicineSno(pno);
            if (dcdt.Rows.Count > 0)
                b = true;
        }
        if (ptype.Equals("H"))
        {
            ipno = PatientTestUtilities.GetPatientIpNoFromHospital(pno);
            lblipno.Text = ipno;
            lblpname.Text = PatientTestUtilities.GetPatientNameFromHospital(pno);
            dcdt = dcta.GetDataByPatientHospitalSno(pno);
            if (dcdt.Rows.Count > 0)
                b = true;

        }
        if (ptype.Equals("P"))
        {
            ipno = PatientTestUtilities.GetIpNoFromPathology(pno);
            lblipno.Text = ipno;
            lblpname.Text = PatientTestUtilities.GetPatientNameFromPathology(pno);
            dcdt = dcta.GetDataByPatientPathologySno(pno);
            if (dcdt.Rows.Count > 0)
                b = true;
        }

        if (ipno.Equals("") || ipno.Equals(" "))
        {
            if (b)
                Response.Redirect("editcut.aspx?ipno=" + ipno);
        }
        else
        {
            dcdt = dcta.GetDataByIpNo(ipno);
            if (dcdt.Rows.Count > 0)
            {
                Response.Redirect("editcut.aspx?ipno=" + ipno);
            }
        }
       
    }
    protected void rdcuttype_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (rdcuttype.SelectedValue.Equals("partial"))
            {
                if (ptype.Equals("P"))
                {
                    refferedcutcol.Visible = true;
                    pathologycutcol.Visible = true;
                    hospitalcutcol.Visible = false;
                    medicinecutcol.Visible = false;
                    completecutcol.Visible = false;
                    btsubmit.Visible = true;
                }
                else
                {
                    if (ptype.Equals("H"))
                    {
                        refferedcutcol.Visible = true;
                        pathologycutcol.Visible = false;
                        hospitalcutcol.Visible = true;
                        medicinecutcol.Visible = false;
                        completecutcol.Visible = false;
                        btsubmit.Visible = true;
                    }
                    else
                    {
                        if (ptype.Equals("M"))
                        {
                            refferedcutcol.Visible = true;
                            pathologycutcol.Visible = false;
                            hospitalcutcol.Visible = false;
                            medicinecutcol.Visible = true;
                            completecutcol.Visible = false;
                            btsubmit.Visible = true;
                        }
                    }
                }

            }
            else
            {
                if (ipno.Equals("") || ipno.Equals(" "))
                {
                    rdcuttype.SelectedIndex = 0;
                    throw new Exception("This Patient Cannot Have Complete Cut");
                }
                if (rdcuttype.SelectedValue.Equals("complete"))
                {
                    refferedcutcol.Visible = true;
                    hospitalcutcol.Visible = false;
                    medicinecutcol.Visible = false;
                    pathologycutcol.Visible = false;
                    btsubmit.Visible = true;
                    completecutcol.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-text-red";
            lblmessage.Text = ex.Message;
        }

    }
    protected void btsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int refferedby = Convert.ToInt32(ddrefferedfrom.SelectedValue);
            if(rdcuttype.SelectedValue.Equals("partial"))
            {
            if (ptype.Equals("P"))
            {
                if (txtpathologycut.Text.Equals("") || txtpathologycut.Text.Equals(null) || (Convert.ToDouble(txtpathologycut.Text) <= 0))
                    throw new Exception("Please Enter The Valid Cut Percentage!!");
                DataSet1TableAdapters.doctorcutTableAdapter da = new DataSet1TableAdapters.doctorcutTableAdapter();
                DataSet1.doctorcutDataTable dt=da.GetDataByPatientPathologySno(pno);
                if(dt.Rows.Count>0)
                    throw new Exception("Cut For This Patient For Pathology Has Already Been Set!!");
                string ipno=PatientTestUtilities.GetIpNoFromPathology(pno);
                string pname=PatientTestUtilities.GetPatientNameFromPathology(pno);
                double pathologycut = Convert.ToDouble(txtpathologycut.Text);
                da.Insert(pname,ipno,refferedby,0,0,0,pathologycut,pno,"PATHOLOGY");
                lblmessage.CssClass="w3-text-green";
                lblmessage.Text="Percentage Set Successfully!!";
                

            }
            if (ptype.Equals("H"))
            {
                if (txthospitalcut.Text.Equals("") || txthospitalcut.Text.Equals(null) || (Convert.ToDouble(txthospitalcut.Text) <= 0))
                    throw new Exception("Please Enter The Valid Cut Percentage!!");
                DataSet1TableAdapters.doctorcutTableAdapter da=new DataSet1TableAdapters.doctorcutTableAdapter();
                DataSet1.doctorcutDataTable dt=da.GetDataByPatientHospitalSno(pno);
                if(dt.Rows.Count>0)
                    throw new Exception("Cut For This Patient For Hospital Has Already Been Set!!");
                string ipno=PatientTestUtilities.GetPatientIpNoFromHospital(pno);
                string pname=PatientTestUtilities.GetPatientNameFromHospital(pno);
                double hospitalcut = Convert.ToDouble(txthospitalcut.Text);
                da.Insert(pname,ipno,refferedby,0,hospitalcut,0,0,pno,"HOSPITAL");
                lblmessage.CssClass="w3-text-green";
                lblmessage.Text="Percentage Set Successfully!!";
                
            }
            if (ptype.Equals("M"))
            {
                 if (txtmedicinecut.Text.Equals("") || txtmedicinecut.Text.Equals(null) || (Convert.ToDouble(txtmedicinecut.Text) <= 0))
                    throw new Exception("Please Enter The Valid Cut Percentage!!");
                DataSet1TableAdapters.doctorcutTableAdapter da=new DataSet1TableAdapters.doctorcutTableAdapter();
                DataSet1.doctorcutDataTable dt=da.GetDataByPatientMedicineSno(pno);
                if(dt.Rows.Count>0)
                    throw new Exception("Cut For This Patient For Medicine Has Already Been Set!!");
                string ipno=PatientTestUtilities.GetIpNoFromMedicine(pno);
                string pname=PatientTestUtilities.GetPatientNameFromMedicine(pno);
                double medicinecut = Convert.ToDouble(txtmedicinecut.Text);
                da.Insert(pname,ipno,refferedby,0,0,medicinecut,0,pno,"MEDICINE");
                lblmessage.CssClass="w3-text-green";
                lblmessage.Text="Percentage Set Successfully!!";
                
            }
          }
            else
            {
                if(rdcuttype.SelectedValue.Equals("complete"))
                {
                     if (txtcompletecut.Text.Equals("") || txtcompletecut.Text.Equals(null) || (Convert.ToDouble(txtcompletecut.Text) <= 0))
                    throw new Exception("Please Enter The Valid Cut Percentage!!");
                DataSet1TableAdapters.doctorcutTableAdapter da=new DataSet1TableAdapters.doctorcutTableAdapter();
                string ipno = PatientTestUtilities.GetPatientIpNoFromHospital(pno);
                DataSet1.doctorcutDataTable dt=da.GetDataByIpNo(ipno);
                if(dt.Rows.Count>0)
                    throw new Exception("Any Cut For This Patient For Has Already Been Set Please Edit Cut!!");
                
                string pname=PatientTestUtilities.GetPatientNameFromHospital(pno);
                double completecut = Convert.ToDouble(txtcompletecut.Text);
                da.Insert(pname,ipno,refferedby,completecut,0,0,0,pno,"ALL");
                lblmessage.CssClass="w3-text-green";
                lblmessage.Text="Percentage Set Successfully!!";
                }
            }

        }
        catch (Exception ex)
        {
            lblmessage.CssClass = "w3-text-red";
            lblmessage.Text = ex.Message;
        }

    }
}