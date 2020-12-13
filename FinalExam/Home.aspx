<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FinalExam.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SET Pizza Shop</title>
    
    <link rel="stylesheet" href="StyleSheet.css" type="text/css"/>

    <script>


    </script>
</head>
<body>
    <form id="form1" runat="server">
      
        <label>Full Name</label>
        <asp:TextBox ID="fullname" runat="server" />
          <asp:RequiredFieldValidator id="RequiredFieldValidator2"
                    ControlToValidate="fullname"
                    Display="dynamic"
                    ErrorMessage="Please provide full name!"
                    runat="server" ForeColor="red"/>
        <asp:RegularExpressionValidator ID="validator" runat="server" ControlToValidate="fullname" ForeColor = "Red"        ValidationExpression="[a-zA-Z\s]*$" ErrorMessage="Name Cannot contain numbers!" Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:Button ID="submitName" runat="server" Text="Submit" OnClick="submitName_Click"/>
     
    </form>
</body>
</html>
