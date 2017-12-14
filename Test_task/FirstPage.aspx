<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstPage.aspx.cs" Inherits="Test_task.WebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>First page</title>
    <script runat="server">
        private void Submit_AddEmploye(object sender, CommandEventArgs e)
        {
            SqlDataEmpolyee.Insert(); //SurnameField.Text, NameField.Text, PatronymicField.Text, DropDownListDepsField.SelectedValue);
        }
    </script>
</head>
<body>
    <form id="form" runat="server">

        <asp:SqlDataSource
            ID="SqlDataEmpolyee"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:LocalDB %>"
            SelectCommand="SELECT em.Id, em.Surname, em.Name, em.Patronymic, dp.Id as DepId, dp.Name as DepName 
                FROM Employeers em left join Department  dp on em.DepartmentId = dp.Id "
            UpdateCommand="UPDATE Employeers SET Surname=@Surname, Name=@Name, Patronymic=@Patronymic, 
                DepartmentId=(select Id from Department where Name=@DepName) where Id=@Id;"
            InsertCommand="INSERT INTO Employeers (Surname, Name, Patronymic, DepartmentId) VALUES (@Surname, @Name, @Patronymic, @DepId);">
            <UpdateParameters>
                <asp:FormParameter Name="Id" FormField="Id" />
                <asp:FormParameter Name="Surname" FormField="Surname" />
                <asp:FormParameter Name="Name" FormField="Name" />
                <asp:FormParameter Name="Patronymic" FormField="Patronymic" />
                <asp:FormParameter Name="DepName" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:FormParameter Name="Surname" FormField="SurnameField" />
                <asp:FormParameter Name="Name" FormField="NameField" />
                <asp:FormParameter Name="Patronymic" FormField="PatronymicField" />
                <asp:FormParameter Name="DepId" FormField="DropDownDepsField" />
            </InsertParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource
            ID="SqlDataDepartments"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:LocalDB %>"
            SelectCommand="SELECT dp.Name as DepName, dp.Id as DepId FROM Department  dp UNION Select '' as Name, null as DepId;"></asp:SqlDataSource>

        <asp:GridView
            ID="GridViewEmpoyeeDeps"
            runat="server"
            AutoGenerateColumns="False"
            AutoGenerateEditButton="True"
            DataSourceID="SqlDataEmpolyee"
            DataKeyNames="Id">
            <Columns>
                <asp:BoundField DataField="Id" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Surname" HeaderText="Фамилия" />
                <asp:BoundField DataField="Name" HeaderText="Имя" />
                <asp:BoundField DataField="Patronymic" HeaderText="Отчество" />
                <asp:TemplateField HeaderText="Отдел">
                    <ItemTemplate>
                        <asp:Label ID="DepName" runat="server" Text='<%# Eval("DepName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList
                            ID="DropDownListDeps"
                            runat="server"
                            DataTextField="DepName"
                            DataSourceID="SqlDataDepartments"
                            SelectedValue='<%# Bind("DepName") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="Surname" Text="Фамилия" runat="server"></asp:Label>
        <asp:TextBox ID="SurnameField" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Name" Text="Имя" runat="server"></asp:Label>
        <asp:TextBox ID="NameField" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Patronymic" Text="Отчество" runat="server"></asp:Label>
        <asp:TextBox ID="PatronymicField" runat="server"></asp:TextBox>
        <br />
        <asp:DropDownList
            ID="DropDownDepsField"
            runat="server"
            DataTextField="DepName"
            DataValueField="DepId"
            DataSourceID="SqlDataDepartments">
        </asp:DropDownList>
        <br />
        <asp:Button id="Submit"
          runat="server"
          text="Добавить работника"
          oncommand="Submit_AddEmploye"/>
    </form>
</body>
</html>
