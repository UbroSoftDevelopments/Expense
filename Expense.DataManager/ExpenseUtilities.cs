using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Expense.DataManager
{

    /// <summary>
    /// Summary description for ExpenseUtilities
    /// </summary>
    public class ExpenseUtilities
    {
        public static int GetHospitalPatientCountOnPerticulardate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.opdformTableAdapter da = new DataSet1TableAdapters.opdformTableAdapter();
                DataSet1.opdformDataTable dt = da.GetDataByDate("" + date);
                return dt.Rows.Count;


            }
            catch
            {
                return 0;
            }
        }
        public static int GetPathologyPatientCountOnPerticulardate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.patient_detailsTableAdapter da = new DataSet1TableAdapters.patient_detailsTableAdapter();
                DataSet1.patient_detailsDataTable dt = da.GetDataByDate("" + date);
                return dt.Rows.Count;


            }
            catch
            {
                return 0;
            }
        }
        public static int GetMedicalPatientCountOnPerticulardate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.customerdetailsTableAdapter da = new DataSet1TableAdapters.customerdetailsTableAdapter();
                DataSet1.customerdetailsDataTable dt = da.GetDataByDate("" + date);
                return dt.Rows.Count;


            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalAmountAppliedOnPatientInHospitalByPatientNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.expensesTableAdapter da = new DataSet1TableAdapters.expensesTableAdapter();
                DataSet1.expensesDataTable dt = da.GetDataByPatientNo(pno);
                double amount = 0;
                double discount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.expensesRow dr = (DataSet1.expensesRow)dt.Rows[i];
                    amount += dr.amount;
                }
                discount = GetDiscountAmountOnPatientByPatientNo(pno);
                return amount - discount;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public static double GetCutAmountFromPercentageAndTotalAmount(double percentage, double amount)
        {
            try
            {
                double rupees = amount * percentage / 100;
                return rupees;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalAmountPaidByPatientInPathologyByPatientNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.patient_detailsTableAdapter da = new DataSet1TableAdapters.patient_detailsTableAdapter();
                DataSet1.patient_detailsDataTable dt = da.GetDataBySno(pno);
                double amount = 0;

                DataSet1.patient_detailsRow dr = (DataSet1.patient_detailsRow)dt.Rows[0];
                DataSet1TableAdapters.patients_test_detailsTableAdapter pa = new DataSet1TableAdapters.patients_test_detailsTableAdapter();
                DataSet1.patients_test_detailsDataTable pt = pa.GetDataByPatientNo(pno);
                if (pt.Rows.Count <= 0)
                    return 0;

                for (int j = 0; j <= pt.Rows.Count - 1; j++)
                {

                    DataSet1.patients_test_detailsRow pdr = (DataSet1.patients_test_detailsRow)pt.Rows[j];
                    int testno = pdr.testno;
                    amount += GetPatientTestItemRates(pno, testno);
                }

                return amount;

            }
            catch
            {
                return 0;

            }
        }
        public static double GetTotalAmountPaidByPatientInPathologyAfterDiscountByPatientNo(int pno)
        {
            try
            {
                double amountpaid = GetTotalAmountPaidByPatientInPathologyByPatientNo(pno);
                double discount = GetDiscountAmountOnPatientFromPathology(pno);
                return amountpaid - discount;
            }
            catch
            {

                return 0;
            }
        }
        public static double GetTotalAmountPaidByPatientInMedicineByPatientNo(int receiptno)
        {
            try
            {
                DataSet1TableAdapters.receipt_itemsTableAdapter da = new DataSet1TableAdapters.receipt_itemsTableAdapter();
                DataSet1.receipt_itemsDataTable dt = da.GetDataByReceiptNo(receiptno);
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.receipt_itemsRow dr = (DataSet1.receipt_itemsRow)dt.Rows[i];
                    amount += dr.quantity * dr.price;
                }
                double discount = GetDiscountAmountOnCustomerFromMedicineByCustomerNo(receiptno);
                return amount - discount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalAmountPaidByPatientInMedicineAfterDiscountByPatientNo(int receiptno)
        {
            try
            {
                double amountpaid = GetTotalAmountPaidByPatientInMedicineByPatientNo(receiptno);
                double discount = GetDiscountAmountOnCustomerFromMedicineByCustomerNo(receiptno);
                return amountpaid - discount;
            }
            catch
            {

                return 0;
            }
        }
        public static double GetTotalAmountApplidOnPatientInHospitalByIpNo(string ipnumber)
        {
            try
            {
                DataSet1TableAdapters.opdformTableAdapter da = new DataSet1TableAdapters.opdformTableAdapter();
                DataSet1.opdformDataTable dt = da.GetDataByIpNo(ipnumber);
                DataSet1.opdformRow dr = (DataSet1.opdformRow)dt.Rows[0];
                int patientno = dr.patientno;
                double amount = GetTotalAmountAppliedOnPatientInHospitalByPatientNo(patientno);
                return amount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetDiscountAmountOnPatientByPatientNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.discountdataTableAdapter da = new DataSet1TableAdapters.discountdataTableAdapter();
                DataSet1.discountdataDataTable dt = da.GetDataByPatientNo(pno);
                if (dt.Rows.Count <= 0)
                    return 0;
                double discount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.discountdataRow dr = (DataSet1.discountdataRow)dt.Rows[i];
                    discount += dr.discountamount;

                }
                return discount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetDiscountAmountOnCustomerFromMedicineByCustomerNo(int Cno)
        {
            try
            {
                DataSet1TableAdapters.discountinmedicineTableAdapter da = new DataSet1TableAdapters.discountinmedicineTableAdapter();
                DataSet1.discountinmedicineDataTable dt = da.GetDataByCustomerNo(Cno);
                if (dt.Rows.Count <= 0)
                    return 0;
                DataSet1.discountinmedicineRow dr = (DataSet1.discountinmedicineRow)dt.Rows[0];
                return dr.discountamount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetDiscountAmountOnPatientFromPathology(int Pno)
        {
            try
            {
                DataSet1TableAdapters.discountinpathologyTableAdapter da = new DataSet1TableAdapters.discountinpathologyTableAdapter();
                DataSet1.discountinpathologyDataTable dt = da.GetDataByPatientNo(Pno);
                if (dt.Rows.Count <= 0)
                    return 0;
                double discountAmount = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataSet1.discountinpathologyRow dr = (DataSet1.discountinpathologyRow)dt.Rows[i];
                    discountAmount += dr.discountamount;
                }
                return discountAmount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetAmountPaidByPatientInHospitalByPatientNo(int pno)
        {
            try
            {
                DataSet1TableAdapters.paymentsTableAdapter da = new DataSet1TableAdapters.paymentsTableAdapter();
                DataSet1.paymentsDataTable dt = da.GetDataByPatientNo(pno);
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.paymentsRow dr = (DataSet1.paymentsRow)dt.Rows[i];
                    amount += amount + dr.amount;
                }
                return amount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalIncomeFromPathologyByDate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.patient_detailsTableAdapter pda = new DataSet1TableAdapters.patient_detailsTableAdapter();
                DataSet1.patient_detailsDataTable pdt = pda.GetDataByDate("" + date);
                if (pdt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= pdt.Rows.Count - 1; i++)
                {
                    DataSet1.patient_detailsRow dr = (DataSet1.patient_detailsRow)pdt.Rows[i];
                    int pno = dr.sno;
                    DataSet1TableAdapters.patients_test_detailsTableAdapter da = new DataSet1TableAdapters.patients_test_detailsTableAdapter();
                    DataSet1.patients_test_detailsDataTable dt = da.GetDataByPatientNo(pno);
                    if (dt.Rows.Count <= 0)
                        continue;

                    for (int j = 0; j <= dt.Rows.Count - 1; j++)
                    {

                        DataSet1.patients_test_detailsRow pdr = (DataSet1.patients_test_detailsRow)dt.Rows[j];
                        int testno = pdr.testno;
                        //double testrate = PatientTestUtilities.GetTestRateBySno(testno);
                        amount += GetPatientTestItemRates(pno, testno);
                    }

                }
                double discount = GetDiscountInPathologyOnDate(date);
                return amount - discount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalIncomeFromPathologyOfEveryDate()
        {
            try
            {
                DataSet1TableAdapters.patient_detailsTableAdapter pda = new DataSet1TableAdapters.patient_detailsTableAdapter();
                DataSet1.patient_detailsDataTable pdt = pda.GetData();
                if (pdt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                double discount = 0;
                for (int i = 0; i <= pdt.Rows.Count - 1; i++)
                {
                    DataSet1.patient_detailsRow dr = (DataSet1.patient_detailsRow)pdt.Rows[i];
                    int pno = dr.sno;
                    DataSet1TableAdapters.patients_test_detailsTableAdapter da = new DataSet1TableAdapters.patients_test_detailsTableAdapter();
                    DataSet1.patients_test_detailsDataTable dt = da.GetDataByPatientNo(pno);
                    if (dt.Rows.Count <= 0)
                        continue;// return "1-1";

                    for (int j = 0; j <= dt.Rows.Count - 1; j++)
                    {

                        DataSet1.patients_test_detailsRow pdr = (DataSet1.patients_test_detailsRow)dt.Rows[j];
                        int testno = pdr.testno;
                        //double testrate = PatientTestUtilities.GetTestRateBySno(testno);
                        amount += GetPatientTestItemRates(pno, testno);
                    }
                    discount += GetDiscountAmountOnPatientFromPathology(pno);
                }

                return amount - discount;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public static double GetTotalIncomeFromPathologyOfDaterange(string startdate, string enddate)
        {
            try
            {
                DataSet1TableAdapters.patient_detailsTableAdapter pda = new DataSet1TableAdapters.patient_detailsTableAdapter();
                DataSet1.patient_detailsDataTable pdt = pda.GetDataByStartAndEndDate(startdate, enddate);
                if (pdt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                double discount = 0;
                for (int i = 0; i <= pdt.Rows.Count - 1; i++)
                {
                    DataSet1.patient_detailsRow dr = (DataSet1.patient_detailsRow)pdt.Rows[i];
                    int pno = dr.sno;
                    DataSet1TableAdapters.patients_test_detailsTableAdapter da = new DataSet1TableAdapters.patients_test_detailsTableAdapter();
                    DataSet1.patients_test_detailsDataTable dt = da.GetDataByPatientNo(pno);
                    if (dt.Rows.Count <= 0)
                        continue;// return "1-1";

                    for (int j = 0; j <= dt.Rows.Count - 1; j++)
                    {

                        DataSet1.patients_test_detailsRow pdr = (DataSet1.patients_test_detailsRow)dt.Rows[j];
                        int testno = pdr.testno;
                        //double testrate = PatientTestUtilities.GetTestRateBySno(testno);
                        amount += GetPatientTestItemRates(pno, testno);
                        discount += GetDiscountAmountOnPatientFromPathology(pno);
                    }

                }

                return amount - discount;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public static bool FullTestApplied(int patientno, int testno)
        {
            try
            {
                DataSet1TableAdapters.patient_test_item_detailsTableAdapter da = new DataSet1TableAdapters.patient_test_item_detailsTableAdapter();
                DataSet1.patient_test_item_detailsDataTable dt = da.GetDataByPatientNoAndTestNo(patientno, testno);
                DataSet1TableAdapters.testitemsTableAdapter tda = new DataSet1TableAdapters.testitemsTableAdapter();
                DataSet1.testitemsDataTable tdt = tda.GetDataByTestNo(testno);
                if (dt.Rows.Count == tdt.Rows.Count)
                    return true;
                return false;

            }
            catch
            {
                return false;
            }

        }
        public static double GetPatientTestItemRates(int patientno, int testno)
        {
            try
            {
                bool b = FullTestApplied(patientno, testno);
                double completerate = 0;
                if (!b)
                {
                    DataSet1TableAdapters.patient_test_item_detailsTableAdapter da = new DataSet1TableAdapters.patient_test_item_detailsTableAdapter();
                    DataSet1.patient_test_item_detailsDataTable dt = da.GetDataByPatientNoAndTestNo(patientno, testno);

                    for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    {
                        DataSet1.patient_test_item_detailsRow dr = (DataSet1.patient_test_item_detailsRow)dt.Rows[i];
                        int testitemno = dr.testitemno;
                        DataSet1TableAdapters.testitemsTableAdapter tda = new DataSet1TableAdapters.testitemsTableAdapter();
                        DataSet1.testitemsDataTable tdt = tda.GetDataByTestItemNo(testitemno);
                        DataSet1.testitemsRow tdr = (DataSet1.testitemsRow)tdt.Rows[0];
                        completerate += tdr.rate;

                    }
                    return completerate;


                }
                else
                {
                    DataSet1TableAdapters.testnameTableAdapter tit = new DataSet1TableAdapters.testnameTableAdapter();
                    DataSet1.testnameDataTable tnd = tit.GetDataByTestNo(testno);
                    DataSet1.testnameRow tr = (DataSet1.testnameRow)tnd.Rows[0];
                    return tr.rate;
                }
            }
            catch
            {
                return 0;
            }
        }
        public static double GetDiscountInPathologyOnDate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.discountinpathologyTableAdapter da = new DataSet1TableAdapters.discountinpathologyTableAdapter();
                DataSet1.discountinpathologyDataTable dt = da.GetDataByDate("" + date);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.discountinpathologyRow dr = (DataSet1.discountinpathologyRow)dt.Rows[i];
                    amount += dr.discountamount;
                }
                return amount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetDiscountInMedicineOnDate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.discountinmedicineTableAdapter da = new DataSet1TableAdapters.discountinmedicineTableAdapter();
                DataSet1.discountinmedicineDataTable dt = da.GetDataByDate("" + date);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.discountinmedicineRow dr = (DataSet1.discountinmedicineRow)dt.Rows[i];
                    amount += dr.discountamount;
                }
                return amount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalDiscountInMedicineOfAllDate()
        {
            try
            {
                DataSet1TableAdapters.discountinmedicineTableAdapter da = new DataSet1TableAdapters.discountinmedicineTableAdapter();
                DataSet1.discountinmedicineDataTable dt = da.GetData();
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.discountinmedicineRow dr = (DataSet1.discountinmedicineRow)dt.Rows[i];
                    amount += dr.discountamount;
                }
                return amount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalIncomeFromMedicineByDate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.customerdetailsTableAdapter da = new DataSet1TableAdapters.customerdetailsTableAdapter();
                DataSet1.customerdetailsDataTable dt = da.GetDataByDate("" + date);
                if (dt.Rows.Count <= 0)
                    return 0;
                double totalamount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.customerdetailsRow dr = (DataSet1.customerdetailsRow)dt.Rows[i];
                    int receiptno = dr.receiptno;
                    totalamount += GetTotalPriceOnReceiptInMedicine(receiptno);
                }
                double discount = GetDiscountInMedicineOnDate(date);
                return totalamount - discount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalIncomeFromMedicineOfAllDate()
        {
            try
            {
                DataSet1TableAdapters.customerdetailsTableAdapter da = new DataSet1TableAdapters.customerdetailsTableAdapter();
                DataSet1.customerdetailsDataTable dt = da.GetData();
                if (dt.Rows.Count <= 0)
                    return 0;
                double totalamount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.customerdetailsRow dr = (DataSet1.customerdetailsRow)dt.Rows[i];
                    int receiptno = dr.receiptno;
                    double amount = GetTotalPriceOnReceiptInMedicine(receiptno);
                    totalamount += amount;
                }
                double discount = GetTotalDiscountInMedicineOfAllDate();
                return totalamount - discount;
            }
            catch
            {
                return 0;
            }

        }
        public static double GetTotalIncomeFromMedicineFromDateRange(string startdate, string enddate)
        {
            try
            {
                DataSet1TableAdapters.customerdetailsTableAdapter da = new DataSet1TableAdapters.customerdetailsTableAdapter();
                DataSet1.customerdetailsDataTable dt = da.GetDataByDateRange(startdate, enddate);
                if (dt.Rows.Count <= 0)
                    return 0;
                double totalamount = 0;
                double discount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.customerdetailsRow dr = (DataSet1.customerdetailsRow)dt.Rows[i];
                    int receiptno = dr.receiptno;
                    double amount = GetTotalPriceOnReceiptInMedicine(receiptno);
                    double discountamount = ExpenseUtilities.GetDiscountAmountOnCustomerFromMedicineByCustomerNo(dr.receiptno);
                    totalamount += amount;
                    discount += discountamount;
                }
                return totalamount - discount;
            }
            catch
            {
                return 0;
            }

        }
        public static double GetTotalPriceOnReceiptInMedicine(int receiptno)
        {
            try
            {
                DataSet1TableAdapters.receipt_itemsTableAdapter da = new DataSet1TableAdapters.receipt_itemsTableAdapter();
                DataSet1.receipt_itemsDataTable dt = da.GetDataByReceiptNo(receiptno);
                int count = dt.Rows.Count;
                if (count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= count - 1; i++)
                {
                    DataSet1.receipt_itemsRow dr = (DataSet1.receipt_itemsRow)dt.Rows[i];
                    amount += dr.quantity * dr.price;
                }
                return amount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetDiscountInHospitalOnDate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.discountdataTableAdapter da = new DataSet1TableAdapters.discountdataTableAdapter();
                DataSet1.discountdataDataTable dt = da.GetDataByDate("" + date);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.discountdataRow dr = (DataSet1.discountdataRow)dt.Rows[i];
                    amount += dr.discountamount;
                }
                return amount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalIncomeFromHospitalByDate(DateTime date)
        {

            try
            {
                DataSet1TableAdapters.paymentsTableAdapter da = new DataSet1TableAdapters.paymentsTableAdapter();
                DataSet1.paymentsDataTable dt = da.GetDataByDateOfPayment("" + date);
                int count = dt.Rows.Count;
                if (count <= 0)
                    return 0;
                double totalamount = 0;
                for (int i = 0; i <= count - 1; i++)
                {

                    DataSet1.paymentsRow dr = (DataSet1.paymentsRow)dt.Rows[i];
                    totalamount += dr.amount;

                }
                return totalamount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetAllTotalDiscountInHospital()
        {
            try
            {
                DataSet1TableAdapters.discountdataTableAdapter da = new DataSet1TableAdapters.discountdataTableAdapter();
                DataSet1.discountdataDataTable dt = da.GetData();
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.discountdataRow dr = (DataSet1.discountdataRow)dt.Rows[i];
                    amount += dr.discountamount;
                }
                return amount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalExtraIncomeByDate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.extraincomeTableAdapter da = new DataSet1TableAdapters.extraincomeTableAdapter();
                DataSet1.extraincomeDataTable dt = da.GetDataByDate("" + date);
                int count = dt.Rows.Count;
                if (count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= count - 1; i++)
                {
                    DataSet1.extraincomeRow dr = (DataSet1.extraincomeRow)dt.Rows[i];
                    amount += dr.amount;
                }
                return amount;


            }
            catch
            {
                return 0;
            }

        }
        public static double GetTotalAmountPaidToDoctorByDate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.doctorpaidamountTableAdapter da = new DataSet1TableAdapters.doctorpaidamountTableAdapter();
                DataSet1.doctorpaidamountDataTable dt = da.GetDataByDate("" + date);
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
        public static double GetTotalExpenseBydate(DateTime date)
        {
            try
            {
                DataSet1TableAdapters.dailyexpencesTableAdapter da = new DataSet1TableAdapters.dailyexpencesTableAdapter();
                DataSet1.dailyexpencesDataTable dt = da.GetDataByDate("" + date);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.dailyexpencesRow dr = (DataSet1.dailyexpencesRow)dt.Rows[i];
                    amount += dr.amount;
                }
                return amount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetAllTotalExpencesByDateIncludingAll(DateTime date)
        {
            try
            {

                double expenseamount = GetTotalExpenseBydate(date);
                return expenseamount;
            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalIncomeFromHospitalOfEveryDate()
        {

            try
            {
                DataSet1TableAdapters.paymentsTableAdapter da = new DataSet1TableAdapters.paymentsTableAdapter();
                DataSet1.paymentsDataTable dt = da.GetData();
                int count = dt.Rows.Count;
                if (count <= 0)
                    return 0;
                double totalamount = 0;
                for (int i = 0; i <= count - 1; i++)
                {

                    DataSet1.paymentsRow dr = (DataSet1.paymentsRow)dt.Rows[i];
                    totalamount += dr.amount;

                }
                //double discount = ExpenseUtilities.GetAllTotalDiscountInHospital();
                return totalamount;// -discount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetTotalIncomeFromHospitalFromDateRange(string startdate, string enddate)
        {

            try
            {
                DataSet1TableAdapters.paymentsTableAdapter da = new DataSet1TableAdapters.paymentsTableAdapter();
                DataSet1.paymentsDataTable dt = da.GetDataByDateRangeFromStartToEnd(startdate, enddate);
                int count = dt.Rows.Count;
                if (count <= 0)
                    return 0;
                double totalamount = 0;
                double discount = 0;
                for (int i = 0; i <= count - 1; i++)
                {

                    DataSet1.paymentsRow dr = (DataSet1.paymentsRow)dt.Rows[i];
                    totalamount += dr.amount;
                    //discount+= ExpenseUtilities.GetDiscountAmountOnPatientByPatientNo(dr.patientno);

                }

                return totalamount;// -discount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetExtraIncomeOFAllDate()
        {
            try
            {
                DataSet1TableAdapters.extraincomeTableAdapter da = new DataSet1TableAdapters.extraincomeTableAdapter();
                DataSet1.extraincomeDataTable dt = da.GetData();
                int count = dt.Rows.Count;
                if (count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= count - 1; i++)
                {
                    DataSet1.extraincomeRow dr = (DataSet1.extraincomeRow)dt.Rows[i];
                    amount += dr.amount;
                }
                return amount;


            }
            catch
            {
                return 0;
            }

        }
        public static double GetExtraIncomeOFDateRange(string startdate, string enddate)
        {
            try
            {
                DataSet1TableAdapters.extraincomeTableAdapter da = new DataSet1TableAdapters.extraincomeTableAdapter();
                DataSet1.extraincomeDataTable dt = da.GetDataByDateRange(startdate, enddate);
                int count = dt.Rows.Count;
                if (count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= count - 1; i++)
                {
                    DataSet1.extraincomeRow dr = (DataSet1.extraincomeRow)dt.Rows[i];
                    amount += dr.amount;
                }
                return amount;


            }
            catch
            {
                return 0;
            }

        }
        public static double GetAllTotalAmountPaidToDoctorOfEveryDate()
        {
            try
            {
                DataSet1TableAdapters.doctorpaidamountTableAdapter da = new DataSet1TableAdapters.doctorpaidamountTableAdapter();
                DataSet1.doctorpaidamountDataTable dt = da.GetData();
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
        public static double GetAllTotalExpenseOfEverydate()
        {
            try
            {
                DataSet1TableAdapters.dailyexpencesTableAdapter da = new DataSet1TableAdapters.dailyexpencesTableAdapter();
                DataSet1.dailyexpencesDataTable dt = da.GetData();
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.dailyexpencesRow dr = (DataSet1.dailyexpencesRow)dt.Rows[i];
                    amount += dr.amount;
                }
                return amount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetAllTotalExpenseOfDateRange(string startdate, string enddate)
        {
            try
            {
                DataSet1TableAdapters.dailyexpencesTableAdapter da = new DataSet1TableAdapters.dailyexpencesTableAdapter();
                DataSet1.dailyexpencesDataTable dt = da.GetDataByDateRange(startdate, enddate);
                if (dt.Rows.Count <= 0)
                    return 0;
                double amount = 0;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.dailyexpencesRow dr = (DataSet1.dailyexpencesRow)dt.Rows[i];
                    amount += dr.amount;
                }
                return amount;

            }
            catch
            {
                return 0;
            }
        }
        public static double GetAllTotalExpencesOfAllTimeIncludingAll()
        {
            try
            {
                double amount = GetAllTotalExpenseOfEverydate();

                return amount;
            }
            catch
            {
                return 0;
            }
        }


    }
}