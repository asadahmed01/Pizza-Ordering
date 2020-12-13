using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalExam
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void submitName_Click(object sender, EventArgs e)
        {
            string fullName = fullname.Text;
            string[] splitNames = fullName.Split(' ');
            string firstName = splitNames[0];

            HttpCookie customerInfo = new HttpCookie("customerInfo");

            customerInfo["firstName"] = firstName;
            customerInfo["fullNames"] = fullName;
            customerInfo.Expires = DateTime.Now.AddDays(7);
            Response.Cookies.Add(customerInfo);
            Response.Redirect("Order.aspx");
        }
    }
}