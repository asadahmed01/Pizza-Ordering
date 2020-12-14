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
            if(option == "Pepperoni" || option == "Mushrooms" || option == "Green Olives" || option == "Green Peppers")
            {
                price = 1.00;
            }
            if(option == "Double Cheese")
            {
                price = 1.50;
            }
            return  price;
        }



        protected void submitOrder_Click(object sender, EventArgs e)
        {
            HttpCookie userToppings = new HttpCookie("toppings");
            

            if (pepperoni.Checked)
            {
                userToppings["1"] = "Pepperoni";
            }
            else
            {
                userToppings.Expires = DateTime.Now.AddHours(-1);
            }
            if (mushroom.Checked)
            {
                userToppings["2"] = "Mushrooms";
            }
            else
            {
                userToppings.Expires = DateTime.Now.AddHours(-1);
            }
            if (olives.Checked)
            {
                userToppings["3"] = "Green Olives";

            }
            else
            {
                userToppings.Expires = DateTime.Now.AddHours(-1);
            }
            if (peppers.Checked)
            {
                userToppings["4"] = "Green Peppers";

            }
            else
            {
                userToppings.Expires = DateTime.Now.AddHours(-1);
            }

            if (cheese.Checked)
            {
                userToppings["5"] = "Double Cheese";
            }
            else
            {
                userToppings.Expires = DateTime.Now.AddHours(-1);
            }
           
           
            userToppings.Expires = DateTime.Now.AddHours(1);
            Response.Cookies.Add(userToppings);

            HttpCookie Price = new HttpCookie("price");
            string priceTotal = hiddenPrice.Value;
            price.InnerText = priceTotal;
            Price["finalPrice"] = priceTotal;
            
            Price.Expires = DateTime.Now.AddHours(1);
            Response.Cookies.Add(Price);

          
            Response.Redirect("OrderSummary.aspx");
        }
    }
}