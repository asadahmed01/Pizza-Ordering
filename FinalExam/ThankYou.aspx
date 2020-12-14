<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="FinalExam.ThankYou" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set Pizza Shop</title>
    <link rel="stylesheet" href="StyleSheet.css" type="text/css"/>

</head>
<body>
     <header>
        <h1>SET Pizza Shop</h1>
    </header>

    <form id="form1" runat="server">
        <div id="icon"></div>
        <div class="thankU">
            <p>&#x2713;</p>
            <br /> <br />
            <h1 id="thanks" runat="server"></h1>
           
            <h5 id="preparing" runat="server"></h5>
        </div>
    </form>
</body>
</html>
