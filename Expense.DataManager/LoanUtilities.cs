using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Expense.DataManager
{

    /// <summary>
    /// Summary description for LoanUtilities
    /// </summary>
    public class LoanUtilities
    {
        public static string GetLoanPersonNameBySno(int sno)
        {
            try
            {
                DataSet1TableAdapters.loanpersonsTableAdapter da = new DataSet1TableAdapters.loanpersonsTableAdapter();
                DataSet1.loanpersonsDataTable dt = da.GetDataBySno(sno);
                DataSet1.loanpersonsRow dr = (DataSet1.loanpersonsRow)dt.Rows[0];
                return dr.personname;
            }
            catch
            {
                return "";
            }
        }
        public static string GetLoanPersonNameByLoanNo(int loanno)
        {
            try
            {
                DataSet1TableAdapters.loandataTableAdapter da = new DataSet1TableAdapters.loandataTableAdapter();
                DataSet1.loandataDataTable dt = da.GetDataBySno(loanno);
                DataSet1.loandataRow dr = (DataSet1.loandataRow)dt.Rows[0];
                string name = GetLoanPersonNameBySno(dr.loangivenpersonno);
                return name;
            }
            catch
            {
                return "";
            }
        }
        public static double GetLoanAmountBySno(int sno)
        {
            try
            {
                DataSet1TableAdapters.loandataTableAdapter da = new DataSet1TableAdapters.loandataTableAdapter();
                DataSet1.loandataDataTable dt = da.GetDataBySno(sno);
                DataSet1.loandataRow dr = (DataSet1.loandataRow)dt.Rows[0];
                return dr.amount;
            }
            catch
            {
                return 0;
            }
        }
        public static DateTime GetLoanTakenDateBySno(int sno)
        {
            try
            {
                DataSet1TableAdapters.loandataTableAdapter da = new DataSet1TableAdapters.loandataTableAdapter();
                DataSet1.loandataDataTable dt = da.GetDataBySno(sno);
                DataSet1.loandataRow dr = (DataSet1.loandataRow)dt.Rows[0];
                return dr.date;
            }
            catch
            {
                return Convert.ToDateTime(0);
            }
        }
        public static DateTime GetLoanPaidDateByLoanGivingPersonNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.loanpaiddateTableAdapter da = new DataSet1TableAdapters.loanpaiddateTableAdapter();
                DataSet1.loanpaiddateDataTable dt = da.GetDataByLoanGivenSno(pno);
                DataSet1.loanpaiddateRow dr = (DataSet1.loanpaiddateRow)dt.Rows[0];
                return dr.dateofpayment;
            }
            catch
            {
                return Convert.ToDateTime(0);
            }
        }
        public static double GetLoanAmountTakenFromPersonNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.loandataTableAdapter da = new DataSet1TableAdapters.loandataTableAdapter();
                DataSet1.loandataDataTable dt = da.GetDataByLoanGivingPersonSno(pno);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.loandataRow dr = (DataSet1.loandataRow)dt.Rows[i];
                    amount += dr.amount;

                }
                return amount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetPaidLoanAmountFromPersonNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.loanpaiddateTableAdapter da = new DataSet1TableAdapters.loanpaiddateTableAdapter();
                DataSet1.loanpaiddateDataTable dt = da.GetDataByLoanGivenSno(pno);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.loanpaiddateRow dr = (DataSet1.loanpaiddateRow)dt.Rows[i];
                    amount += dr.amount;

                }
                return amount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetReamainingLoanAmountToPayByPersonNo(int pno)
        {
            try
            {
                double totalloantaken = GetLoanAmountTakenFromPersonNo(pno);
                double loanpaid = GetPaidLoanAmountFromPersonNo(pno);
                return totalloantaken - loanpaid;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalLoanAmount()
        {
            try
            {
                DataSet1TableAdapters.loandataTableAdapter da = new DataSet1TableAdapters.loandataTableAdapter();
                DataSet1.loandataDataTable dt = da.GetData();
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.loandataRow dr = (DataSet1.loandataRow)dt.Rows[i];
                    amount += dr.amount;
                }
                return amount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalPaidLoanAmount()
        {
            try
            {
                DataSet1TableAdapters.loanpaiddateTableAdapter da = new DataSet1TableAdapters.loanpaiddateTableAdapter();
                DataSet1.loanpaiddateDataTable dt = da.GetData();
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.loanpaiddateRow dr = (DataSet1.loanpaiddateRow)dt.Rows[i];
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