<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="FinalExam.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="https://use.fontawesome.com/be8d4cceb5.js"></script>
    <link rel="stylesheet" href="StyleSheet.css" type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script type="text/javascript">
      
        function selectedTopping(event) {
           
            var choice = event.value;
            $.ajax({
                type: "POST",
                url: "Order.aspx/UpdatePrice",
                datatype: "json",
                data: JSON.stringify({ option: choice }),
                contentType: "application/json; charset=utf-8",
                success: function (res) {
                    if (event.checked) {
                        var toppingPrice = res.d;
                        var basePrice = $("#price").text();
                        var parsedPrice = parseFloat(basePrice)
                        var totalPrice = toppingPrice + parsedPrice;
                        $("#price").text(totalPrice);
                        console.log(totalPrice)
                    }
                    else if (event.checked === false) {
                        var toppingPrice = res.d;
                        var basePrice = $("#price").text();
                        var parsedPrice = parseFloat(basePrice)
                        var totalPrice = parsedPrice - toppingPrice;
                        $("#price").text(totalPrice);
                        console.log(totalPrice)
                    }
                   
                },
                failure: function (response) {

                }
            })
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h1 id="greeting" runat="server"></h1>
        <div>
            <input type="checkbox" name="Pepperoni" value="Pepperoni" runat="server" id="pepperoni" onclick="selectedTopping(this)"/>
            <label for="Pepperoni">Pepperoni</label> <br />

            <input type="checkbox" name="Mushrooms" value="Mushrooms" runat="server" id="mushroom" onclick="selectedTopping(this)"/>
            <label for="Mushrooms">Mushrooms</label> <br />

            <input type="checkbox" name="Olives" value=" Green Olives" runat="server" id="olives"/>
            <label for="Green Olives">Green Olives</label><br/>

            <input type="checkbox" name="Olives" value="Green Peppers" runat="server" id="peppers"/>
            <label for="Green Peppers">Green Peppers</label><br/>

            <input type="checkbox" name="cheese" value="Double Cheese" runat="server" id="cheese"/>
            <label for="Cheese">Double Cheese</label><br/>

            <input type="submit" value="Submit" runat="server"/>
        </div>

        <div>
            <p>&#128722;</p> 
           
            
            <p runat="server">$<span id="price">10</span></p>
        </div>
    </form>
</body>
</html>
