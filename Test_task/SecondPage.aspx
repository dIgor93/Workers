<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecondPage.aspx.cs" Inherits="Test_task.SecondPage" %>

<%@ Import Namespace="Test_task" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Вторая страница</title>
</head>
<body>

    <form id="form" runat="server">
        <div>
            <asp:TextBox ID="Separator" OnTextChanged="Separator_TextChanged" runat="server"></asp:TextBox>
            <br />
            <asp:RadioButton ID="Space" Text="Пробел" Checked="True" AutoPostBack="true" GroupName="Symbols" OnCheckedChanged="Symbols_CheckedChanged" runat="server"></asp:RadioButton>
            <asp:RadioButton ID="NewLine" Text="С новой строки" AutoPostBack="true" GroupName="Symbols" OnCheckedChanged="Symbols_CheckedChanged" runat="server"></asp:RadioButton>
            <asp:RadioButton ID="Colon" Text="Запятая" AutoPostBack="true" GroupName="Symbols" OnCheckedChanged="Symbols_CheckedChanged" runat="server"></asp:RadioButton>
            <br />
            <asp:Label ID="OutputList" runat="server"></asp:Label>
        </div>
    </form>
</body>

</html>
