using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalExam
{
    public partial class OrderSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie options = Request.Cookies["toppings"];
            
            if (options != null)
            {
                string[] arr = options.Value.Split('&');
                StringBuilder builder = new StringBuilder();

                int count = arr.Length;
                for(int i = 0; i < count; i++)
                {
                    string items = arr[i].ToString();
                    var selected = items.Split('=');
                    string line =options[i.ToString()];
                    builder.Append("<p>" + selected[1] + "</p>");
                    
                    
                    
                }
                item.InnerHtml = builder.ToString();

            }

            HttpCookie thePrice = Request.Cookies["price"];
            string final = thePrice["finalPrice"].ToString() ;
            finalPrice.InnerText = "$"+final;
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Cookies["confirm"].Expires = DateTime.Now.AddMinutes(-1);
            HttpCookie orderStatus = new HttpCookie("order");
            orderStatus["status"] = "cancelling";
            Response.Cookies.Add(orderStatus);
            Response.Redirect("ThankYou.aspx");
        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            //Response.Cookies["order"].Expires = DateTime.Now.AddMinutes(-1);
            HttpCookie confirmStatus = new HttpCookie("confirm");
            confirmStatus["conStat"] = "confirming";
            Response.Cookies.Add(confirmStatus);
            Response.Redirect("ThankYou.aspx");
        }
    }
}