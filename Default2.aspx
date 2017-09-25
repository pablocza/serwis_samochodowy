<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    
        <table border="0" >
    <tr>
        <th colspan="3" style="text-align:left; ">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejestracja
        </th>
    </tr>
     <tr>
        <td style="text-align:right;">
            Imię:
        </td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Wymagane!" ForeColor="Red" ControlToValidate="TextBox1"
                runat="server" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Musi zaczynać się z wielkiej litery i mieć minimum 3 znaki!" ForeColor="Red" ValidationExpression="[A-Z][a-z]{2,}" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align:right;">
           Nazwisko:
        </td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Wymagane!" ForeColor="Red" ControlToValidate="TextBox2"
                runat="server" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Musi zaczynać się z wielkiej litery i mieć minimum 3 znaki!" ForeColor="Red" ValidationExpression="[A-Z][a-z]{2,}" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align:right;">
            Numer telefonu:
        </td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Wymagane!" ForeColor="Red" ControlToValidate="TextBox3"
                runat="server" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Błędny numer telefonu!" ForeColor="Red" ValidationExpression="[0-9]{9}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align:right;">
            Nazwa użytkownika:
        </td>
        <td>
            <asp:TextBox ID="txtUsername" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Wymagane!" ForeColor="Red" ControlToValidate="txtUsername"
                runat="server" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtUsername" ErrorMessage="Minimum 3 znaki!" ForeColor="Red" ValidationExpression="[a-z]{3,}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align:right;">
            Hasło:
        </td>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Wymagane!" ForeColor="Red" ControlToValidate="txtPassword"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td style="text-align:right;">
            Potwierdź hasło:
        </td>
        <td>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:CompareValidator ErrorMessage="Hasła są różne!" ForeColor="Red" ControlToCompare="txtPassword"
                ControlToValidate="txtConfirmPassword" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="text-align:right;">
            E-mail:
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Wymagane!" Display="Dynamic" ForeColor="Red"
                ControlToValidate="txtEmail" runat="server" />
            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Niepoprawny adres e-mail!" />
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button Text="Zarejestruj" runat="server" OnClick="RegisterUser" />
        </td>
        <td>
        </td>
    </tr>
</table>
    
    </div>
    </form>
</body>
</html>
