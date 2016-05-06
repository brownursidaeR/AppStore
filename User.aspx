<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA" />
    <link rel="Shortcut Icon" href="img/favico.ico">
    <title>Account</title>
</head>
<body style="background-color: #CFD8DC">
    <form id="form1" runat="server" class="form-horizontal">
        <nav class="navbar navbar-default"></nav>
        <nav class="navbar navbar-default navbar-fixed-top">

            <div class="navbar-header">
                <a class="navbar-brand" href="#">Apple store</a>
            </div>

            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="index.aspx">Home</a></li>
                </ul>
            </div>
        </nav>

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <div class="container-fluid container-mg" style="background-color: #CFD8DC">
            <div class="col-md-2"></div>
            <div class="col-md-8 cardbackground">
                 <asp:GridView ID="gvOrders" runat="server" GridLines="None" CssClass="table table-striped table-hover" Width="100%" AutoGenerateColumns="False" DataKeyNames="fldPurchaseID" OnRowDataBound="gvOrders_RowDataBound" >
                            <Columns>
                                <asp:BoundField DataField="fldUsername" HeaderText="User" SortExpression="fldUsername" />
                                <asp:BoundField DataField="fldPurchaseID" HeaderText="Purchase ID" SortExpression="fldPurchaseID" />
                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                                <asp:BoundField DataField="fldAppName" HeaderText="App Name" SortExpression="fldAppName" />
                                <asp:BoundField DataField="fldPrice" HeaderText="Price" SortExpression="fldPrice" />
                                <asp:BoundField DataField="fldStatus" HeaderText="Status" SortExpression="fldStatus" />
                            </Columns>
                        </asp:GridView>
            </div>
            <div class="col-md-2"></div>
        </div>
    </form>
</body>
</html>
