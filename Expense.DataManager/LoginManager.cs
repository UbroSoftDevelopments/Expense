using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Expense.DataManager
{


    /// <summary>
    /// Summary description for LoginManager
    /// </summary>
    public class LoginManager
    {
        public static bool IsUserIdandPasswordIsCorrect(String userid, string password)
        {
            try
            {
                DataSet1TableAdapters.siteuserTableAdapter da = new DataSet1TableAdapters.siteuserTableAdapter();
                DataSet1.siteuserDataTable dt = da.GetDataByUserIdAndPassword(userid, password);
                DataSet1.siteuserRow dr = (DataSet1.siteuserRow)dt.Rows[0];
                if (dt.Rows.Count <= 0)
                    return false;
                if (!userid.Equals(dr.userid))
                    return false;
                if (!password.Equals(dr.password))
                    return false;

                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool DoLogin(string userid, string password, HttpSessionState session, HttpResponse response)
        {
            try
            {
                bool b = IsUserIdandPasswordIsCorrect(userid, password);
                if (!b)
                    return false;

                session["userid"] = userid;
                response.Redirect("index.aspx");
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool IsUserLoggedIn(HttpSessionState session)
        {
            try
            {
                if (session["userid"] == null)
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool IsVerifiedUserLoggedIn(HttpSessionState session)
        {
            try
            {
                if (session["usercode"] == null)
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static string getloggedinuserid(HttpSessionState session)
        {
            try
            {
                if (session["userid"] == null)
                    return "";
                return "" + session["userid"];
            }
            catch
            {
                return "";
            }
        }


        public static void Dologout(HttpSessionState session, HttpResponse response)
        {
            try
            {
                session.Abandon();
                response.Redirect("login.aspx");
            }
            catch
            {

            }
        }
        public static bool IsVarificationcodeIsValid(string code)
        {
            try
            {
                DataSet1TableAdapters.verificationTableAdapter da = new DataSet1TableAdapters.verificationTableAdapter();
                DataSet1.verificationDataTable dt = da.GetDataByVarificationCode(code);
                if (dt.Rows.Count <= 0)
                    return false;
                DataSet1.verificationRow dr = (DataSet1.verificationRow)dt.Rows[0];
                if (!code.Equals(dr.verificationcode))
                    return false;
                if (!dr.status.Equals("Active"))
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool DoVerifiedLogin(string code, HttpSessionState session, HttpResponse response)
        {
            try
            {
                bool b = IsVarificationcodeIsValid(code);
                if (!b)
                    return false;
                session["usercode"] = code;
                response.Redirect("verifiedindex.aspx");
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}