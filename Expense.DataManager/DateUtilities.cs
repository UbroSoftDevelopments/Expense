using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class DateUtilties
{
    public static DateTime defaultdate = new DateTime(1970, 1, 1);
    public static string[] months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
    public static string[] fullmonths = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };

    public static int getMonthNumber(string month)
    {
        for (int i = 0; i < fullmonths.Length; i++)
        {
            if (fullmonths[i].Equals(month))
                return i + 1;
        }
        return 0;
    }
    
    public static string FormattedDate(object date)
    {
        try
        {
            return FormattedDate(Convert.ToDateTime(date));
        }
        catch
        {
            return "";
        }
    }
    public static string FormattedDate(DateTime date)
    {
        date = Midnight(date);
        if (date.Equals(defaultdate))
            return "";
        else
            return pad(date.Day) + "-" + months[date.Month - 1] + "-" + date.Year;
    }
    public static DateTime Midnight(DateTime date)
    {
        return new DateTime(date.Year, date.Month, date.Day);
    }
    public static string pad(int n)
    {
        if (n <= 9)
            return "0" + n;
        return "" + n;
    }
    public static bool IsLeapYear(int Year)
    {
        if (Year % 400 == 0)
            return true;

        if ((Year % 4 == 0) && (Year % 100 != 0))
            return true;
        return false;
    }
    public static int GetDayInMonth(int Month, int Year)
    {
        if (Month == 1 || Month == 3 || Month == 5 || Month == 7 || Month == 8 || Month == 10 || Month == 12)
            return 31;
        else
        if (Month == 4 || Month == 6 || Month == 9 || Month == 11)
            return 30;
        else
            if (IsLeapYear(Year))
                return 29;
            else
                return 28;
    }

}