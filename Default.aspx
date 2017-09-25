<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(local)\SQLEXPRESS;Initial Catalog=bazaSQL;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="select * from adres" UpdateCommand="update adres set ulica = @ulica, nr_domu = @nr_domu, miasto= @miasto, kod_pocztowy =@kod_pocztowy where id=@id" DeleteCommand="delete from adres where id=@id" InsertCommand="insert into adres(ulica,nr_domu,miasto,kod_pocztowy) values(@ul,@nr,@mi,@kod)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="ul" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="nr" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox3" Name="mi" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox4" Name="kod" PropertyName="Text" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ulica" />
                <asp:Parameter Name="nr_domu" />
                <asp:Parameter Name="miasto" />
                <asp:Parameter Name="kod_pocztowy" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <h1><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h1>
        <br />
        <br />
        <h2>CRUD dla tabeli Adres</h2><br />
        <br />
        <asp:GridView  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="ulica" HeaderText="Ulica" SortExpression="ulica" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="nr_domu" HeaderText="Numer domu" SortExpression="nr_domu" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="miasto" HeaderText="Miasto" SortExpression="miasto" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="kod_pocztowy" HeaderText="Kod pocztowy" SortExpression="kod_pocztowy" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False" HeaderText="Opcje">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Aktualizuj"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń" OnClientClick="return confirm('Na pewno chcesz usunąć ten rekord?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    
        <br />
        <h3>Dodawanie adresu: </h3><br />
    
        Ulica:<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Pole Ulica jest wymagane!" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Ulica musi zaczynać się z wielkiej litery!" ForeColor="Red" ValidationExpression="[A-Z][a-z][a-z]+">*</asp:RegularExpressionValidator>
        <br />
        Numer domu:<br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Pole Numer domu jest wymagane!" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Numer domu musi zawierać przynajmniej jedną cyfrę!" ForeColor="Red" ValidationExpression="[0-9]+[aA-zZ]*">*</asp:RegularExpressionValidator>
        <br />
        Miasto:<br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Pole Miasto jest wymagane!" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Miasto musi zaczynać się z wiekiej litery i posiadać conajmniej 3 znaki!" ForeColor="Red" ValidationExpression="[A-Z][a-z][a-z]+">*</asp:RegularExpressionValidator>
        <br />
        Kod pocztowy:<br />
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Pole Kod pocztowy jest wymagane!" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Błędny kod pocztowy!" ForeColor="Red" ValidationExpression="[0-9][0-9]-[0-9][0-9][0-9]">*</asp:RegularExpressionValidator>
    
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Dodaj" />
        <br />
        <br />
    
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    
        <br />
    
    </div>
    </form>
</body>
</html>
