<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script src="js/recaptcha.js"></script>
    <link type="text/css" rel="Stylesheet" href="StyleSheet.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA" />
    <link rel="Shortcut Icon" href="img/favico.ico">
    <title>Login</title>
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
                    <li><a href="mailto:someone@example.com?Subject=Contact">Contact</a></li>
                    <li><a href="mailto:someone@example.com?Subject=I%20need%20help">Help</a></li>
                </ul>
            </div>


        </nav>

        <div class="container-fluid container-mg" style="background-color: #CFD8DC">
            <div class="col-md-4"></div>
            <div class="col-md-4 cardbackground">
                <fieldset>
                    <div class="col-md-12" style="text-align: center">
                        <h2>Login</h2>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-lg-3 control-label"><i class="material-icons">account_circle</i> Username</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txbUserID" CssClass="form-control" placeholder="UserID" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-lg-3 control-label"><i class="material-icons">https</i> Password</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txbPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 control-label">Type</label>
                        <div class="col-lg-10" style="margin: 0">
                            <asp:RadioButton GroupName="type" ID="btnA" runat="server" Text="Admin" CssClass="radio" Style="float: left; margin-left: 30px" />
                            <asp:RadioButton GroupName="type" ID="btnU" runat="server" Text="User" CssClass="radio" Style="float: left; margin-left: 30px" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-10">
                            <div class="g-recaptcha col-lg-12 col-lg-offset-2" data-sitekey="6Ld5dCETAAAAAEGVZxwc7DhTldNdE_mjfG2SYU9L" runat="server" id="recaptcha"></div>
                            <asp:Label runat="server" CssClass="col-lg-offset-2" ID="lblForMessage"></asp:Label>
                            <asp:Button OnClick="btnValidateReCaptcha_Click" CssClass="btn btn-success col-md-12 col-lg-offset-2" Text="I AM NOT A ROBOT" ID="btnValidateReCaptcha" runat="server" />
                        </div>
                    </div>

                    <div class="form-group">
                        <br />
                        <div class="col-lg-10 col-lg-offset-2">
                            <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-primary" Style="margin-left: 5px; float: right" OnClick="btnSubmit_Click" />
                            <button id="back" style="float: right" onclick="history.go(-1);" class="btn btn-default">Cancel</button>

                        </div>
                    </div>
                </fieldset>
                <script type="text/javascript" src="js/jquery.min.js"></script>
                <script type="text/javascript" src="js/bootstrap.min.js"></script>
                <script type="text/javascript">
                    function LoginFail() {
                        $('#passwordsNoMatchRegister').show();
                        $('.alert').delay(3000).slideUp(200, function () {
                            $(this).alert('hide');
                        });
                    }
                    function LoginSuccess() {
                        $('#LoginSuccess').show();
                        $('.alert').delay(1000).slideUp(200, function () {
                            $(this).alert('close');
                        });
                    }
                    function UserTypeNeeded() {
                        $('#UserTypeNeeded').show();
                        $('.alert').delay(3000).slideUp(200, function () {
                            $(this).alert('close');
                        });
                    }
                </script>
                <div class="alert alert-dismissible alert-success collapse" id="LoginSuccess">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Login Success!</strong>
                </div>
                <div class="alert alert-dismissible alert-warning collapse" id="UserTypeNeeded">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <i class="material-icons">warning</i> <strong>Please Select Your User Type </strong>and try again
                </div>
                <div class="alert alert-dismissible alert-danger collapse" id="passwordsNoMatchRegister">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <i class="material-icons">warning</i> <strong>Oh Snap! </strong>It seems like username or password is wrong.
                </div>
            </div>

            <div class="col-md-4"></div>
        </div>
        <footer style="padding-bottom: 5%">
        </footer>

        <!--Modal-->
        <div class="modal fade" id="Robotic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="Order">Robotic Validation</h4>
                    </div>
                    <div class="modal-body">
                        Always Pass the Robotic Validation and click the <strong style="color: green">Green</strong>  button!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function Robotic() {
                $('#Robotic').modal({
                    keyboard: false
                });
            }
        </script>
    </form>

</body>
</html>
