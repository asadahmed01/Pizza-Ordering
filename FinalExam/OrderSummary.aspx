<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" Inherits="FinalExam.OrderSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SET Pizza Shop</title>

    <script src="https://use.fontawesome.com/be8d4cceb5.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="StyleSheet.css" type="text/css"/>
</head>
<body>

    <header>
        <h1>SET Pizza Shop</h1>
    </header>

    <form id="form1" runat="server">
        <div id="orderSummary">
            <h3>Order Summary</h3>
            <p>Please take a moment to review your order.</p>
        </div>
        
        <div  runat="server" id="leftSummary">

            <div>
                <h3>Toppings</h3>
               

            </div>
            <div id="item" runat="server">
               
            </div>
            <hr /> 
            <div id="bill">
                
                <p>Order Total: </p> 
                <p id="finalPrice" runat="server"></p>
                
            </div>
        </div>

        <div id="submission">
            <asp:Button Text="Cancel" runat="server" ID="cancel" OnClick="cancel_Click"/>
            <asp:Button Text="Confirm" runat="server" ID="confirm" OnClick="confirm_Click"/>
        </div>
    </form>
</body>
</html>
