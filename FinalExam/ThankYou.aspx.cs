using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalExam
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userName = Request.Cookies["customerInfo"];
            HttpCookie orderStatus = Request.Cookies["order"];
            HttpCookie confirm = Request.Cookies["confirm"];


            if (userName != null && orderStatus != null)
            {
                
                string status = orderStatus["status"];
                //string conf = confirm["conStat"];
                string fullName = userName["fullNames"];
                thanks.InnerHtml = fullName.ToUpper()  + ", Thank You! " + "for " + status + " your order";
                preparing.InnerText = "We are sorry to see you go!";
            }

            if (confirm != null && userName != null)
            {
                string conf = confirm["conStat"];
                string fullName = userName["fullNames"];

                thanks.InnerHtml = fullName.ToUpper() + ", Thank You! " + "for " + conf + " your order";
                preparing.InnerText = "Your Order is Preparing...";
                
            }
        }
    }
}