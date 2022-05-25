using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Expense.DataManager
{

    /// <summary>
    /// Summary description for refferedutilities
    /// </summary>
    public class refferedutilities
    {
        public static string GetRefferedByNameBySno(int sno)
        {
            try
            {
                DataSet1TableAdapters.refferedpersonsTableAdapter da = new DataSet1TableAdapters.refferedpersonsTableAdapter();
                DataSet1.refferedpersonsDataTable dt = da.GetDataBySno(sno);
                DataSet1.refferedpersonsRow dr = (DataSet1.refferedpersonsRow)dt.Rows[0];
                return dr.name;
            }
            catch
            {
                return "";
            }
        }
        public static double GetDoctorsTotalPaymentFromDoctorCutThroughDoctorNo(int DoctorNo)
        {
            try
            {
                DataSet1TableAdapters.doctorcutTableAdapter da = new DataSet1TableAdapters.doctorcutTableAdapter();
                DataSet1.doctorcutDataTable dt = da.GetDataByRefferedNo(DoctorNo);
                if (dt.Rows.Count <= 0)
                    return 0;
                double totalamounttopaidtodoctor = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.doctorcutRow dr = (DataSet1.doctorcutRow)dt.Rows[i];
                    if (dr.completecut > 0)
                    {
                        double totalpaymentapplied;
                        double appliedpaymentinhospital = ExpenseUtilities.GetTotalAmountAppliedOnPatientInHospitalByPatientNo(dr.patientsno);
                        double appliedpaymentinpathology = ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyByPatientNo(dr.patientsno);
                        double appliedpaymentinmedical = ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineByPatientNo(dr.patientsno);
                        totalpaymentapplied = appliedpaymentinhospital + appliedpaymentinmedical + appliedpaymentinpathology;
                        double amountpaid;
                        amountpaid = ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(dr.patientsno) + appliedpaymentinpathology + appliedpaymentinmedical;
                        double hospitaldiscount = ExpenseUtilities.GetDiscountAmountOnPatientByPatientNo(dr.patientsno);
                        double pathologydiscount = ExpenseUtilities.GetDiscountAmountOnPatientFromPathology(dr.patientsno);
                        double medicinediscount = ExpenseUtilities.GetDiscountAmountOnCustomerFromMedicineByCustomerNo(dr.patientsno);
                        double discountamount = hospitaldiscount + medicinediscount + pathologydiscount;

                        double amountaftercuttodoctor = 0;
                        amountaftercuttodoctor = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(dr.completecut, amountpaid);
                        if (discountamount > 0)
                        {

                            double amountgiven = amountaftercuttodoctor - discountamount;
                            totalamounttopaidtodoctor += amountgiven;
                        }
                        else
                        {
                            totalamounttopaidtodoctor = amountaftercuttodoctor;
                        }
                    }
                    else
                    {

                        if (dr.hospitalcut > 0)
                        {

                            double totalpaymentapplied;
                            double appliedpaymentinhospital = ExpenseUtilities.GetTotalAmountAppliedOnPatientInHospitalByPatientNo(dr.patientsno);
                            double appliedpaymentinpathology = ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyByPatientNo(dr.patientsno);
                            double appliedpaymentinmedical = ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineByPatientNo(dr.patientsno);
                            totalpaymentapplied = appliedpaymentinhospital + appliedpaymentinmedical + appliedpaymentinpathology;
                            double amountpaid;
                            amountpaid = ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(dr.patientsno) + appliedpaymentinpathology + appliedpaymentinmedical;
                            double discountamount = ExpenseUtilities.GetDiscountAmountOnPatientByPatientNo(dr.patientsno);
                            double amountaftercuttodoctor = 0;
                            amountaftercuttodoctor = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(dr.hospitalcut, ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(dr.patientsno));
                            if (discountamount > 0)
                            {
                                double amountgiven = amountaftercuttodoctor - discountamount;
                                totalamounttopaidtodoctor += amountgiven;
                            }
                            else
                            {
                                totalamounttopaidtodoctor += amountaftercuttodoctor;
                            }

                        }
                        else
                        {
                            if (dr.medicinecut > 0)
                            {
                                double totalpaymentapplied;
                                double appliedpaymentinhospital = ExpenseUtilities.GetTotalAmountAppliedOnPatientInHospitalByPatientNo(dr.patientsno);
                                double appliedpaymentinpathology = ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyByPatientNo(dr.patientsno);
                                double appliedpaymentinmedical = ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineByPatientNo(dr.patientsno);
                                totalpaymentapplied = appliedpaymentinhospital + appliedpaymentinmedical + appliedpaymentinpathology;
                                double amountpaid;
                                amountpaid = ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(dr.patientsno) + appliedpaymentinpathology + appliedpaymentinmedical;
                                double discountamount = ExpenseUtilities.GetDiscountAmountOnCustomerFromMedicineByCustomerNo(dr.patientsno);
                                double amountaftercuttodoctor = 0;
                                amountaftercuttodoctor = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(dr.medicinecut, appliedpaymentinmedical);
                                if (discountamount > 0)
                                {
                                    double amountgiven = amountaftercuttodoctor - discountamount;
                                    totalamounttopaidtodoctor += amountgiven;
                                }
                                else
                                {
                                    totalamounttopaidtodoctor += amountaftercuttodoctor;
                                }
                            }
                            else
                            {
                                if (dr.pathologycut > 0)
                                {

                                    double totalpaymentapplied;
                                    double appliedpaymentinhospital = ExpenseUtilities.GetTotalAmountAppliedOnPatientInHospitalByPatientNo(dr.patientsno);
                                    double appliedpaymentinpathology = ExpenseUtilities.GetTotalAmountPaidByPatientInPathologyByPatientNo(dr.patientsno);
                                    double appliedpaymentinmedical = ExpenseUtilities.GetTotalAmountPaidByPatientInMedicineByPatientNo(dr.patientsno);
                                    totalpaymentapplied = appliedpaymentinhospital + appliedpaymentinmedical + appliedpaymentinpathology;
                                    double amountpaid;
                                    amountpaid = ExpenseUtilities.GetAmountPaidByPatientInHospitalByPatientNo(dr.patientsno) + appliedpaymentinpathology + appliedpaymentinmedical;
                                    double discountamount = ExpenseUtilities.GetDiscountAmountOnPatientFromPathology(dr.patientsno);
                                    double amountaftercuttodoctor = 0;
                                    amountaftercuttodoctor = ExpenseUtilities.GetCutAmountFromPercentageAndTotalAmount(dr.pathologycut, appliedpaymentinpathology);
                                    if (discountamount > 0)
                                    {
                                        double amountgiven = amountaftercuttodoctor - discountamount;
                                        totalamounttopaidtodoctor += amountgiven;
                                    }
                                    else
                                    {
                                        totalamounttopaidtodoctor += amountaftercuttodoctor;
                                    }
                                }
                            }
                        }
                    }
                }
                return totalamounttopaidtodoctor;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalPaymentDoneToDoctorByDoctorNo(int doctorno)
        {
            try
            {
                DataSet1TableAdapters.doctorpaidamountTableAdapter da = new DataSet1TableAdapters.doctorpaidamountTableAdapter();
                DataSet1.doctorpaidamountDataTable dt = da.GetDataByDoctorNo(doctorno);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.doctorpaidamountRow dr = (DataSet1.doctorpaidamountRow)dt.Rows[i];
                    amount += dr.amountpaid;
                }
                return amount;

            }
            catch
            {
                return 0;
            }
        }
    }
}