using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Expense.DataManager
{

    /// <summary>
    /// Summary description for PatientTestUtilities
    /// </summary>
    public class PatientTestUtilities
    {
        public static string GetPatientName(int sno)
        {
            try
            {
                DataSet1TableAdapters.patient_detailsTableAdapter da = new DataSet1TableAdapters.patient_detailsTableAdapter();
                DataSet1.patient_detailsDataTable dt = da.GetDataBySno(sno);
                DataSet1.patient_detailsRow dr = (DataSet1.patient_detailsRow)dt.Rows[0];
                return dr.patientname;
            }
            catch (Exception ex)
            {
                return "" + ex.Message;
            }
        }
        public static string GetTestNameBySno(int sno)
        {
            try
            {
                DataSet1TableAdapters.testnameTableAdapter da = new DataSet1TableAdapters.testnameTableAdapter();
                DataSet1.testnameDataTable dt = da.GetDataByTestNo(sno);
                DataSet1.testnameRow dr = (DataSet1.testnameRow)dt.Rows[0];
                return dr.testname;
            }
            catch
            {
                return "";
            }
        }
        public static double GetTestRateBySno(int testno)
        {
            try
            {
                DataSet1TableAdapters.testnameTableAdapter da = new DataSet1TableAdapters.testnameTableAdapter();
                DataSet1.testnameDataTable dt = da.GetDataByTestNo(testno);
                DataSet1.testnameRow dr = (DataSet1.testnameRow)dt.Rows[0];
                return dr.rate;
            }
            catch
            {
                return 0;
            }
        }
        public static string GetIpNoFromPathology(int sno)
        {
            try
            {
                DataSet1TableAdapters.patient_detailsTableAdapter pa = new DataSet1TableAdapters.patient_detailsTableAdapter();
                DataSet1.patient_detailsDataTable pda = pa.GetDataBySno(sno);
                DataSet1.patient_detailsRow pdr = (DataSet1.patient_detailsRow)pda.Rows[0];
                return pdr.Ipno;
            }
            catch
            {
                return "";
            }
        }
        public static string GetPatientNameFromPathology(int sno)
        {
            try
            {
                DataSet1TableAdapters.patient_detailsTableAdapter pa = new DataSet1TableAdapters.patient_detailsTableAdapter();
                DataSet1.patient_detailsDataTable pda = pa.GetDataBySno(sno);
                DataSet1.patient_detailsRow pdr = (DataSet1.patient_detailsRow)pda.Rows[0];
                return pdr.patientname;
            }
            catch
            {
                return "";
            }
        }
        public static string GetIpNoFromMedicine(int sno)
        {
            try
            {
                DataSet1TableAdapters.customerdetailsTableAdapter ma = new DataSet1TableAdapters.customerdetailsTableAdapter();
                DataSet1.customerdetailsDataTable mda = ma.GetDataByReceiptNo(sno);
                DataSet1.customerdetailsRow mdr = (DataSet1.customerdetailsRow)mda.Rows[0];
                return mdr.Ipno;
            }
            catch
            {
                return "";
            }
        }
        public static string GetPatientNameFromMedicine(int sno)
        {
            try
            {
                DataSet1TableAdapters.customerdetailsTableAdapter ma = new DataSet1TableAdapters.customerdetailsTableAdapter();
                DataSet1.customerdetailsDataTable mda = ma.GetDataByReceiptNo(sno);
                DataSet1.customerdetailsRow mdr = (DataSet1.customerdetailsRow)mda.Rows[0];
                return mdr.customername;
            }
            catch
            {
                return "";
            }
        }
        public static string GetPatientNameFromHospital(int sno)
        {
            try
            {
                DataSet1TableAdapters.opdformTableAdapter oda = new DataSet1TableAdapters.opdformTableAdapter();
                DataSet1.opdformDataTable odt = oda.GetDataByPatientNo(sno);
                DataSet1.opdformRow odr = (DataSet1.opdformRow)odt.Rows[0];
                return odr.firstname + " " + odr.lastname;

            }
            catch
            {
                return "";
            }
        }
        public static string GetPatientIpNoFromHospital(int sno)
        {
            try
            {
                DataSet1TableAdapters.opdformTableAdapter oda = new DataSet1TableAdapters.opdformTableAdapter();
                DataSet1.opdformDataTable odt = oda.GetDataByPatientNo(sno);
                DataSet1.opdformRow odr = (DataSet1.opdformRow)odt.Rows[0];
                return odr.ipnumber;

            }
            catch
            {
                return "";
            }
        }
        public static int SetPatientTestNoAppliedByPatientNoPathology(int pno)
        {
            try
            {
                DataSet1TableAdapters.patients_test_detailsTableAdapter da = new DataSet1TableAdapters.patients_test_detailsTableAdapter();
                DataSet1.patients_test_detailsDataTable dt = da.GetDataByPatientNo(pno);
                DataSet1.patients_test_detailsRow dr = (DataSet1.patients_test_detailsRow)dt.Rows[0];
                return dr.testno;
            }
            catch
            {
                return 0;
            }
        }
    }
}