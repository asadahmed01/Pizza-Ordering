<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="FinalExam.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheet.css" type="text/css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="https://use.fontawesome.com/be8d4cceb5.js"></script>
    
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
                        var totalPrice = (toppingPrice + parsedPrice).toFixed(2);
                        $("#price").text(totalPrice);
                        $("#hiddenPrice").val(totalPrice);
                    }
                    else if (event.checked == false) {
                        var toppingPrice = res.d;
                        var basePrice = $("#price").text();
                        var parsedPrice = parseFloat(basePrice)
                        var totalPrice = parsedPrice - toppingPrice;
                        if (totalPrice <= 10) {
                            totalPrice = 10.00;
                        }
                        $("#price").text(totalPrice);
                        $("#hiddenPrice").val(totalPrice);
                    }
                   
                },
                failure: function (response) {

                }
            })
        }
    </script>
</head>
<body>

    <header>
        <h1>SET Pizza Shop</h1>
    </header>

    <form id="form1" runat="server">
        
        <div id="checkmarks">
            <h1 id="greeting" class="greeting" runat="server"></h1> <br />
            <input type="checkbox" name="Pepperoni" value="Pepperoni" runat="server" id="pepperoni" onclick="selectedTopping(this)" autocomplete="off"/>
            <label for="Pepperoni">Pepperoni</label> <br />

            <input type="checkbox" name="Mushrooms" value="Mushrooms" runat="server" id="mushroom" onclick="selectedTopping(this)" autocomplete="off"/>
            <label for="Mushrooms">Mushrooms</label> <br />

            <input type="checkbox" name="Olives" value="Green Olives" runat="server" id="olives" onclick="selectedTopping(this)" autocomplete="off"/>
            <label for="Green Olives">Green Olives</label><br/>

            <input type="checkbox" name="Olives" value="Green Peppers" runat="server" id="peppers" onclick="selectedTopping(this)" autocomplete="off"/>
            <label for="Green Peppers">Green Peppers</label><br/>

            <input type="checkbox" name="cheese" value="Double Cheese" runat="server" id="cheese" onclick="selectedTopping(this)" autocomplete="off"/>
            <label for="Cheese">Double Cheese</label><br/>

            <p runat="server" id="priceline">Price: <span id="money">$<span id="price" runat="server">10.00</span></span></p> <br />
            <input type="hidden"  id="hiddenPrice" runat="server"/>
            <asp:Button ID="submitOrder" Text="Make It!" runat="server" OnClick="submitOrder_Click"/>
        </div>

        <div id="priceDiv">
            
            
        </div>
    </form>
</body>
</html>
