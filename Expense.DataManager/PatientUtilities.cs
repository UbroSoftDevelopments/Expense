using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Expense.DataManager
{

    /// <summary>
    /// Summary description for PatientUtilities
    /// </summary>
    public class PatientUtilities
    {
        public static string GetHospitalPatientFullNameByPatientNo(int patientno)
        {
            try
            {
                DataSet1TableAdapters.opdformTableAdapter da = new DataSet1TableAdapters.opdformTableAdapter();
                DataSet1.opdformDataTable dt = da.GetDataByPatientNo(patientno);
                if (dt.Rows.Count <= 0)
                    return " ";
                DataSet1.opdformRow dr = (DataSet1.opdformRow)dt.Rows[0];
                return dr.firstname + " " + dr.lastname;
            }
            catch
            {
                return " ";
            }
        }
        public static string GetPatientOpdDateByPatientNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.opdformTableAdapter da = new DataSet1TableAdapters.opdformTableAdapter();
                DataSet1.opdformDataTable dt = da.GetDataByPatientNo(pno);
                if (dt.Rows.Count <= 0)
                    return " ";
                DataSet1.opdformRow dr = (DataSet1.opdformRow)dt.Rows[0];
                return DateUtilties.FormattedDate(dr.dateofentry);
            }
            catch
            {
                return "Wrong Details ";
            }
        }
        public static string GetPatientIpdDateByPatientNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.ipdformTableAdapter da = new DataSet1TableAdapters.ipdformTableAdapter();
                DataSet1.ipdformDataTable dt = da.GetDataByPatientNo(pno);
                if (dt.Rows.Count <= 0)
                    return " ";
                DataSet1.ipdformRow dr = (DataSet1.ipdformRow)dt.Rows[0];
                return DateUtilties.FormattedDate(dr.dateofentry);
            }
            catch
            {
                return "Patient Is Not In IPD !! ";
            }
        }
        public static string GetPatientDischargeDateByPatientNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.dischargeTableAdapter da = new DataSet1TableAdapters.dischargeTableAdapter();
                DataSet1.dischargeDataTable dt = da.GetDataByPatientNo(pno);
                if (dt.Rows.Count <= 0)
                    return "Not Discharge";
                DataSet1.dischargeRow dr = (DataSet1.dischargeRow)dt.Rows[0];
                return DateUtilties.FormattedDate(dr.dateofdischarge);
            }
            catch
            {
                return "Not Discharge!! ";
            }
        }
        public static double GetPatientTotalExpenseByPatientNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.patientexpenseTableAdapter da = new DataSet1TableAdapters.patientexpenseTableAdapter();
                DataSet1.patientexpenseDataTable dt = da.GetDataByPatientNo(pno);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.patientexpenseRow dr = (DataSet1.patientexpenseRow)dt.Rows[i];
                    amount += dr.amount;
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