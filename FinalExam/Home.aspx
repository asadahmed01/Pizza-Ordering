<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FinalExam.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SET Pizza Shop</title>
    
    <link rel="stylesheet" href="StyleSheet.css" type="text/css"/>

  
</head>
<body>
    <header>
        <h1>SET Pizza Shop</h1>
    </header>

    <form id="form1" runat="server">
      
        
        <asp:TextBox ID="fullname" runat="server" placeholder="Enter your name to order"/>
          <asp:RequiredFieldValidator id="RequiredFieldValidator2"
                    ControlToValidate="fullname"
                    Display="dynamic"
                    ErrorMessage="Please provide full name!"
                    runat="server" ForeColor="red"/> <br />
        <asp:RegularExpressionValidator ID="validator" runat="server" ControlToValidate="fullname" ForeColor = "Red"        ValidationExpression="[a-zA-Z\s]*$" ErrorMessage="Name Cannot contain numbers!" Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:Button ID="submitName" runat="server" Text="Submit" OnClick="submitName_Click"/>
     
    </form>
</body>
</html>
