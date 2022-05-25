using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patientcutmoney : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool b = LoginManager.IsUserLoggedIn(Session);
        if (!b)
            Response.Redirect("login.aspx");
        int sno = Convert.ToInt32(Request.QueryString["sno"]);
        if (!Request.QueryString.HasKeys())
            Response.Redirect("checkdoctorscut.aspx");
        DataSet1TableAdapters.doctorcutTableAdapter da = new DataSet1TableAdapters.doctorcutTableAdapter();
        DataSet1.doctorcutDataTable dt = da.GetDataBySno(sno);
        DataSet1.doctorcutRow dr = (DataSet1.doctorcutRow)dt.Rows[0];
        int pno=dr.patientsno;
        lblpname.Text = dr.patientname;
        lblipno.Text = dr.ipno;
        lblreffered.Text = refferedutilities.GetRefferedByNameBySno(dr.refferedfrom);
        double completecut = dr.completecut;
        double hospitalcut = dr.hospitalcut;
        double medicinecut = dr.medicinecut;
        double pathologycut = dr.pathologycut;
        if (completecut <= 0)
        {
            completediv.Visible = false;
            cutdiv.Visible = true;
            lblhospitalcut.Text = "" + hospitalcut + "%";
            lblpathologycut.Text = "" + pathologycut + "%";
            lblmedicinecut.Text = "" + medicinecut + "%";
           
           
        }
            if (completecut > 0)
            {
                completediv.Visible = true;
                cutdiv.Visible = false;
                lblcompletecut.Text = "" + completecut + "%";
                double totalpaymentapplied;
                double appliedpaymentinhospital = ExpenseUtilities.GetTotalAmountAppliedOnPatientInHospitalByPatientNo(pno);
                double appliedpaymentinpathology = ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyByPatientNo(pno);
                double appliedpaymentinmedical = ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineByPatientNo(pno);
                totalpaymentapplied = appliedpaymentinhospital + appliedpaymentinmedical + appliedpaymentinpathology;
                ttpaymentapplied.InnerHtml = "<b>" + totalpaymentapplied + "/-</b>";
                double amountpaid;
                amountpaid = ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(pno)+appliedpaymentinpathology+appliedpaymentinmedical;
                allpayments.InnerHtml = "<div class='w3-col s4 w3-padding w3-large w3-center'><b>Amount From Hospital<br/>" + appliedpaymentinhospital + "/-<b></div><div class='w3-col s4 w3-padding w3-large w3-center'>Amount From Pathology<br/>" + appliedpaymentinpathology + "/-</div><div class='w3-col s4 w3-padding w3-large w3-center'>Amount From Medical<br/>" + appliedpaymentinmedical + "/-</div>";
                double hospitaldiscount = ExpenseUtilities.GetDiscountAmountOnPatientByPatientNo(pno);
                double pathologydiscount = ExpenseUtilities.GetDiscountAmountOnPatientFromPathology(pno);
                double medicinediscount = ExpenseUtilities.GetDiscountAmountOnCustomerFromMedicineByCustomerNo(pno);
                double discountamount = hospitaldiscount+medicinediscount+pathologydiscount;
                ttacceptpayment.InnerHtml = "<b>" + amountpaid + "/-</b>";
                double amountaftercuttodoctor = 0;
                amountaftercuttodoctor = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(completecut, amountpaid);
                if (discountamount > 0)
                {
                    lbldiscount.Text = "Amount Given As Discount From Hospital=" + discountamount + "/-"+"From Pathology Discount Amount is "+pathologydiscount+"/-"+"From Medicine Discount Amount is"+medicinediscount+"/-";
                    double amountgiven = amountaftercuttodoctor - discountamount;
                    ttpaymentgiventodoctor.InnerHtml = "<b>" + amountgiven + "</b>";
                    ttamountinhand.InnerHtml = "<b>" + (amountpaid - amountgiven) + "/-</b>";
                }
                else
                {
                    lbldiscount.Text = "";
                    ttpaymentgiventodoctor.InnerHtml = "<b>" + amountaftercuttodoctor + "</b>";
                    ttamountinhand.InnerHtml = "<b>" + (amountpaid - amountaftercuttodoctor) + "/-</b>";
                }

            }
            else
            {
                if (hospitalcut > 0)
                {
                    double totalpaymentapplied;
                    double appliedpaymentinhospital = ExpenseUtilities.GetTotalAmountAppliedOnPatientInHospitalByPatientNo(pno);
                    double appliedpaymentinpathology = ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyByPatientNo(pno);
                    double appliedpaymentinmedical = ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineByPatientNo(pno);
                    totalpaymentapplied = appliedpaymentinhospital + appliedpaymentinmedical + appliedpaymentinpathology;
                    ttpaymentapplied.InnerHtml = "<b>" + totalpaymentapplied + "/-</b>";

                    double amountpaid;
                    amountpaid = ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(pno) + appliedpaymentinpathology + appliedpaymentinmedical;
                    allpayments.InnerHtml = "<div class='w3-col s4 w3-padding w3-large w3-center'><b>Amount From Hospital<br/>" + appliedpaymentinhospital + "/-<b></div><div class='w3-col s4 w3-padding w3-large w3-center'>Amount From Pathology<br/>" + appliedpaymentinpathology + "/-</div><div class='w3-col s4 w3-padding w3-large w3-center'>Amount From Medical<br/>" + appliedpaymentinmedical + "/-</div>";
                    double discountamount = ExpenseUtilities.GetDiscountAmountOnPatientByPatientNo(pno);
                    ttacceptpayment.InnerHtml = "<b>" + amountpaid + "/-</b>";
                    double amountaftercuttodoctor = 0;
                    amountaftercuttodoctor = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(hospitalcut, ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(pno));
                    if (discountamount > 0)
                    {
                        lbldiscount.Text = "Amount Given As Discount is" + discountamount + "/-";
                        double amountgiven = amountaftercuttodoctor - discountamount;
                        ttpaymentgiventodoctor.InnerHtml = "<b>" + amountgiven + "</b>";
                        ttamountinhand.InnerHtml = "<b>" + (amountpaid - amountgiven) + "/-</b>";
                    }
                    else
                    {
                        lbldiscount.Text = "";
                        ttpaymentgiventodoctor.InnerHtml = "<b>" + amountaftercuttodoctor + "</b>";
                        ttamountinhand.InnerHtml = "<b>" + (amountpaid - amountaftercuttodoctor) + "/-</b>";
                    }


                }
                else
                {
                    if(medicinecut > 0)
                    {
                        double totalpaymentapplied;
                        Title = "Here";
                        double appliedpaymentinhospital = ExpenseUtilities.GetTotalAmountAppliedOnPatientInHospitalByPatientNo(pno);
                        double appliedpaymentinpathology = ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyByPatientNo(pno);
                        double appliedpaymentinmedical = ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineByPatientNo(pno);
                        
                        totalpaymentapplied = appliedpaymentinhospital + appliedpaymentinmedical + appliedpaymentinpathology;
                        ttpaymentapplied.InnerHtml = "<b>" + totalpaymentapplied + "/-</b>";
                        
                        double amountpaid;
                        amountpaid = ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(pno) + appliedpaymentinpathology + appliedpaymentinmedical;
                        allpayments.InnerHtml = "<div class='w3-col s4 w3-padding w3-large w3-center'><b>Amount From Hospital<br/>" + appliedpaymentinhospital + "/-<b></div><div class='w3-col s4 w3-padding w3-large w3-center'>Amount From Pathology<br/>" + appliedpaymentinpathology + "/-</div><div class='w3-col s4 w3-padding w3-large w3-center'>Amount From Medical<br/>" + appliedpaymentinmedical + "/-</div>";
                        double discountamount = ExpenseUtilities.GetDiscountAmountOnCustomerFromMedicineByCustomerNo(pno);
                        ttacceptpayment.InnerHtml = "<b>" + amountpaid + "/-</b>";
                        double amountaftercuttodoctor = 0;
                        amountaftercuttodoctor = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(medicinecut, appliedpaymentinmedical);
                        if (discountamount > 0)
                        {
                            lbldiscount.Text = "Amount Given As Discount is" + discountamount + "/-";
                            double amountgiven = amountaftercuttodoctor - discountamount;
                            ttpaymentgiventodoctor.InnerHtml = "<b>" + amountgiven + "</b>";
                            ttamountinhand.InnerHtml = "<b>" + (amountpaid - amountgiven) + "/-</b>";
                        }
                        else
                        {
                            lbldiscount.Text = "";
                            ttpaymentgiventodoctor.InnerHtml = "<b>" + amountaftercuttodoctor + "</b>";
                            ttamountinhand.InnerHtml = "<b>" + (amountpaid - amountaftercuttodoctor) + "/-</b>";
                        }
                        
                    }
                    if (pathologycut > 0)
                    {
                        double totalpaymentapplied;
                        double appliedpaymentinhospital = ExpenseUtilities.GetTotalAmountAppliedOnPatientInHospitalByPatientNo(pno);
                        double appliedpaymentinpathology = ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyByPatientNo(pno);
                        double appliedpaymentinmedical = ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineByPatientNo(pno);
                        totalpaymentapplied = appliedpaymentinhospital + appliedpaymentinmedical + appliedpaymentinpathology;
                        ttpaymentapplied.InnerHtml = "<b>" + totalpaymentapplied + "/-</b>";

                        double amountpaid;
                        amountpaid = ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(pno) + appliedpaymentinpathology + appliedpaymentinmedical;
                        allpayments.InnerHtml = "<div class='w3-col s4 w3-padding w3-large w3-center'><b>Amount From Hospital<br/>" + appliedpaymentinhospital + "/-<b></div><div class='w3-col s4 w3-padding w3-large w3-center'>Amount From Pathology<br/>" + appliedpaymentinpathology + "/-</div><div class='w3-col s4 w3-padding w3-large w3-center'>Amount From Medical<br/>" + appliedpaymentinmedical + "/-</div>";
                        double discountamount = ExpenseUtilities.GetDiscountAmountOnPatientFromPathology(pno);
                        ttacceptpayment.InnerHtml = "<b>" + amountpaid + "/-</b>";
                        double amountaftercuttodoctor = 0;
                        amountaftercuttodoctor = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(pathologycut,appliedpaymentinpathology);
                        if (discountamount > 0)
                        {
                            lbldiscount.Text = "Amount Given As Discount is" + discountamount + "/-";
                            double amountgiven = amountaftercuttodoctor - discountamount;
                            ttpaymentgiventodoctor.InnerHtml = "<b>" + amountgiven + "</b>";
                            ttamountinhand.InnerHtml = "<b>" + (amountpaid - amountgiven) + "/-</b>";
                        }
                        else
                        {
                            lbldiscount.Text = "";
                            ttpaymentgiventodoctor.InnerHtml = "<b>" + amountaftercuttodoctor + "</b>";
                            ttamountinhand.InnerHtml = "<b>" + (amountpaid - amountaftercuttodoctor) + "/-</b>";
                        }

                    }
                }
            }

       
        

        
    }
}