using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Expense.DataManager
{

    /// <summary>
    /// Summary description for DepartmentUtilities
    /// </summary>
    public class DepartmentUtilities
    {
        public static string GetDepartmentNameByDepartmentNo(int departmentno)
        {
            try
            {
                DataSet1TableAdapters.departmentsTableAdapter da = new DataSet1TableAdapters.departmentsTableAdapter();
                DataSet1.departmentsDataTable dt = da.GetDataByDepartmentNo(departmentno);
                if (dt.Rows.Count <= 0)
                    return " ";
                DataSet1.departmentsRow dr = (DataSet1.departmentsRow)dt.Rows[0];
                return dr.departname;
            }
            catch (Exception ex)
            {
                return " ";
            }
        }


    }
}