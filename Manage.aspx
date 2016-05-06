<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA" />
    <link rel="Shortcut Icon" href="img/favico.ico">
    <title>Manage</title>
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
                <ul class="nav nav-tabs">
                    <li class=""><a href="#Application" data-toggle="tab" aria-expanded="true">Application</a></li>
                    <li class=""><a href="#Orders" data-toggle="tab" aria-expanded="false">Orders</a></li>
                    <li class=""><a href="#Pictures" data-toggle="tab" aria-expanded="true">Pictures</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="Application">
                        <asp:GridView ID="gv" runat="server" GridLines="None" CssClass="table table-striped table-hover" Width="100%" AutoGenerateColumns="False" DataKeyNames="fldAppID" OnRowEditing="gv_RowEditing" OnRowDeleting="gv_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Style="line-height: 100%" Height="50%" ImageUrl='<%# "~/img/" + DataBinder.Eval(Container.DataItem, "fldAppImgPath") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="fldAppName" HeaderText="Name" SortExpression="fldAppName" />
                                <asp:BoundField DataField="fldAppImgPath" HeaderText="Image Name" SortExpression="fldAppImgPath" />
                                <asp:CommandField EditText="Edit" ShowEditButton="True" HeaderText="Edit" ControlStyle-CssClass="btn btn-lg btn-primary" />
                                <asp:CommandField DeleteText="Delete" HeaderText="Delete" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-lg btn-danger" />
                            </Columns>
                        </asp:GridView>

                    </div>
                    <div class="tab-pane fade " id="Orders">
                        <asp:GridView ID="gvOrders" runat="server" GridLines="None" CssClass="table table-striped table-hover" Width="100%" AutoGenerateColumns="False" DataKeyNames="fldPurchaseID" OnRowEditing="gvOrders_ConfirmOrders" OnRowDeleting="gvOrders_DeletingOrders" OnRowDataBound="gvOrders_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="fldUsername" HeaderText="User" SortExpression="fldUsername" />
                                <asp:BoundField DataField="fldPurchaseID" HeaderText="Purchase ID" SortExpression="fldPurchaseID" />
                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                                <asp:BoundField DataField="fldAppName" HeaderText="App Name" SortExpression="fldAppName" />
                                <asp:BoundField DataField="fldPrice" HeaderText="Price" SortExpression="fldPrice" />
                                <asp:BoundField DataField="fldStatus" HeaderText="Status" SortExpression="fldStatus" />
                                <asp:CommandField EditText="Pass" ShowEditButton="True" HeaderText="Pass" ControlStyle-CssClass="btn btn-lg btn-success" />
                                <asp:CommandField DeleteText="Delete" HeaderText="Delete" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-lg btn-danger" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="tab-pane fade" id="Pictures">
                        <h1>This is pictures page using for testing</h1>
                        <h2>This is pictures page using for testing</h2>
                        <h3>This is pictures page using for testing</h3>
                        <h4>This is pictures page using for testing</h4>
                    </div>
                </div>
            </div>

            <div class="col-md-2"></div>
        </div>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function DeleteConfirm() {
                $('#DeletingApplicationRecord').modal({
                    keyboard: false
                });
            }

            function DeleteOrders() {
                $('#DeletingOrders').modal({
                    keyboard: false
                });
            }
        </script>

        <!--Modal-->
        <div class="modal fade" id="DeletingApplicationRecord" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel"><strong>Deleting Application!</strong></h4>
                    </div>
                    <div class="modal-body">
                        By clicking Confirm, I agree to Delete this Application.
          <br />
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnDelete" runat="server" Text="Confirm" CssClass="btn btn-primary" OnClick="Deleting_App" />
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>

        <!--Modal-->
        <div class="modal fade" id="DeletingOrders" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="ModalLabel"><strong>Deleting Orders!</strong></h4>
                    </div>
                    <div class="modal-body">
                        By clicking Confirm, I agree to Delete this Order record.
                    <br />
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnDeleteOrders" runat="server" Text="Confirm" CssClass="btn btn-primary" OnClick="Deleting_Orders" />
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>
    </form>
</body>
</html>
