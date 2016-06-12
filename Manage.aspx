<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<%@ Register Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" TagPrefix="CuteWebUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA" />
    <link rel="Shortcut Icon" href="img/favico.ico">
    <title>Manage</title>
    <style>
        @media (max-width:768px) {
            .table-hover > tbody > tr,
            .table-hover > tbody > tr > th,
            .table-hover > tbody > tr > td {
                display: block;
            }
        }

        .back-to-top {
            background: none;
            margin: 15px;
            position: fixed;
            bottom: 15px;
            right: 15px;
            padding: 1px 1px;
            border-radius: 50%;
            box-shadow: 0 1.5px 4px rgba(0, 0, 0, 0.24), 0 1.5px 6px rgba(0, 0, 0, 0.12);
            width: 56px;
            height: 56px;
            z-index: 100;
            display: none;
            text-decoration: none;
            color: #ffffff;
            background-color: #ff9000;
        }

            .back-to-top i {
                font-size: 60px;
            }
    </style>
</head>
<body style="background-color: #CFD8DC">
    <form id="form1" runat="server" class="form-horizontal">
        <nav class="navbar navbar-default"></nav>
        <nav class="navbar navbar-default navbar-fixed-top">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.aspx">Apple Store</a>
            </div>


            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="mailto:brownursidae@gmail.com?Subject=Contact">Contact</a></li>
                </ul>
                <div class="col-md-6" role="search">
                    <div class="form-group" runat="server">
                        <div class="container-fluid">
                            <div class="col-md-2 col-xs-2" style="margin-top: 20px">
                                <asp:DropDownList ID="DropDown" CssClass="dropdown" runat="server">
                                    <asp:ListItem>App</asp:ListItem>
                                    <asp:ListItem>Order</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-8 col-xs-6" style="margin-top: 15px">
                                <asp:TextBox ID="txbSearch" runat="server" placeholder="Search" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2 col-xs-4" style="margin-top: 15px">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <asp:LinkButton runat="server" ID="adminuid"></asp:LinkButton>
                    <li>
                        <asp:LinkButton ID="Logout" runat="server" OnClick="Logout_Click">Logout</asp:LinkButton></li>
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
                    <li class=""><a href="#Upload" data-toggle="tab" aria-expanded="false">Upload</a></li>
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
                                <asp:BoundField DataField="fldTime" HeaderText="Time" SortExpression="fldTime" />
                                <asp:CommandField EditText="Pass" ShowEditButton="True" HeaderText="Pass" ControlStyle-CssClass="btn btn-lg btn-success" />
                                <asp:CommandField DeleteText="Delete" HeaderText="Delete" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-lg btn-danger" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="tab-pane fade " id="Upload">
                        <div class="col-md-2">
                            <br />
                        </div>
                        <div class="col-md-8" style="padding-top: 5%; padding-bottom: 5%;">
                            <asp:Button runat="server" Text="Upload application here" OnClick="Upload_Click" CssClass="btn btn-primary col-md-12" />
                        </div>
                        <div class="col-md-2">
                            <br />
                        </div>
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
        <footer style="padding-bottom: 5%">
        </footer>
        <a class="back-to-top" style="display: inline;">
            <i class="material-icons">arrow_drop_up</i>
        </a>
        <script>
            jQuery(document).ready(function () {
                var offset = 250;
                var duration = 300;
                jQuery(window).scroll(function () {
                    if (jQuery(this).scrollTop() > offset) {
                        jQuery('.back-to-top').fadeIn(duration);
                    } else {
                        jQuery('.back-to-top').fadeOut(duration);
                    }
                });
                jQuery('.back-to-top').click(function (event) {
                    event.preventDefault();
                    jQuery('html, body').animate({ scrollTop: 0 }, duration);
                    return false;
                })
            });
        </script>
    </form>

</body>
</html>
