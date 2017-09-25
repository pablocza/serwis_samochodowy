<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2> Aby móc korzystać z naszego serwisu prosimy o zalogowanie się </h2>

        Login:<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Hasło:<br />
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Zaloguj" OnClick="Button1_Click" />
    
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        <h4>Jeżeli nie masz konta w naszym serwisie możesz <a href="Default2.aspx">zarejestrować sie</a>.</h4>
    </div>
    </form>
</body>
</html>
