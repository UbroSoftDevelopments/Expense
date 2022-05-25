using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Expense.DataManager
{

    /// <summary>
    /// Summary description for HoldAmountUtilities
    /// </summary>
    public class HoldAmountUtilities
    {
        public static double GetHoldAmountByHoldNo(int holdno)
        {
            try
            {
                DataSet1TableAdapters.holdamountTableAdapter da = new DataSet1TableAdapters.holdamountTableAdapter();
                DataSet1.holdamountDataTable dt = da.GetDataBySno(holdno);
                if (dt.Rows.Count <= 0)
                    return 0;
                DataSet1.holdamountRow dr = (DataSet1.holdamountRow)dt.Rows[0];
                return dr.amount;
            }
            catch
            {
                return 0;
            }
        }
    }
}