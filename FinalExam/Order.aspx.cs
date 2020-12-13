using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalExam
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            HttpCookie userName = Request.Cookies["customerInfo"];
            if(userName != null)
            {
                string firstName = userName["firstName"];
                greeting.InnerHtml = "Ciao, " + firstName.ToUpper();
            }
           
            
        }

        [WebMethod]
        public static double UpdatePrice(string option)
        {
            double price = 0;
            if(option == "Pepperoni")
            {
                price = 1.5;
            }
            if(option == "Mushrooms")
            {
                price = 0.25;
            }
            return  price;
        }
    }
}