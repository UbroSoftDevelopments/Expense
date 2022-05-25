using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Expense.DataManager
{

    /// <summary>
    /// Summary description for EmployeeUtilitie
    /// </summary>
    public class EmployeeUtilities
    {
        public static string GetEmployeeNameByEmployeeNo(int employeeno)
        {
            try
            {
                DataSet1TableAdapters.employeeTableAdapter da = new DataSet1TableAdapters.employeeTableAdapter();
                DataSet1.employeeDataTable dt = da.GetDataBySno(employeeno);
                if (dt.Rows.Count <= 0)
                    return " ";
                DataSet1.employeeRow dr = (DataSet1.employeeRow)dt.Rows[0];
                return dr.employeename;
            }
            catch
            {
                return " ";
            }
        }
        public static double GetTotalAmountPaidToEmployeeByEno(int eno)
        {
            try
            {
                DataSet1TableAdapters.employeepaymentTableAdapter da = new DataSet1TableAdapters.employeepaymentTableAdapter();
                DataSet1.employeepaymentDataTable dt = da.GetDataByEmployeeNo(eno);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.employeepaymentRow dr = (DataSet1.employeepaymentRow)dt.Rows[i];
                    amount += dr.paymentamount;
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