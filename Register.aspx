<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta name="theme-color" content="#FAFAFA" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <link rel="Shortcut Icon" href="img/favico.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Register</title>
</head>
<body style="background-color: #CFD8DC">

    <form id="form1" runat="server" class="form-horizontal">
        <nav class="navbar navbar-default"></nav>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
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
                        <li><a href="mailto:someone@example.com?Subject=Contact">Contact</a></li>
                        <li><a href="mailto:someone@example.com?Subject=I%20need%20help">Help</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid container-mg" style="background-color: #CFD8DC">
            <div class="col-md-4"></div>
            <div class="col-md-4 cardbackground">
                <fieldset>

                    <div class="col-md-12" style="text-align: center">
                        <h2>Register</h2>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txbUserID" CssClass="form-control" placeholder="UserID" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txbPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword" class="col-lg-2 control-label">Confirm</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txbConfirm" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confrim Password"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">

                        <div class="col-lg-10">
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="col-lg-10">
                            <br>
                        </div>

                        <div class="col-lg-10 col-lg-offset-2">

                            <script type="text/javascript">
                                function checkInput() {
                                    var strMsg = "";
                                    var userName = document.getElementById("<%=txbUserID.ClientID%>").value;
                                    var password = document.getElementById("<%=txbPass.ClientID%>").value;
                                    var confirm = document.getElementById("<%=txbConfirm.ClientID%>").value;
                                    if (userName == "" || userName == null) {
                                        strMsg = "username"
                                    }
                                    if (password == "" || password == null) {
                                        strMsg += " password"
                                    }
                                    if (strMsg != "") {
                                        alert(strMsg + " can not be null");
                                        return false;
                                    }
                                    if (password != confirm) {
                                        alert("two password don't match");
                                    }
                                    else {
                                        $(function () {
                                            $("#Congrat").modal({
                                                keyboard: false
                                            });
                                        });
                                    }
                                }
                            </script>

                            <%--RequiredFieldValidation--%>
                            <button type="button" id="sumbit" class="btn btn-primary" onclick="checkInput()" style="margin-left: 5px; float: right">Sumbit</button>
                            <%--call out the Modal if pass the Validation--%>
                            <button type="button" id="btncancel" class="btn btn-default" style="float: right">Cancel</button>
                        </div>
                    </div>
                </fieldset>
                <script type="text/javascript">
                    function AccountExist() {
                        $('#AccountExist').show();
                        $('.alert').delay(1000).slideUp(200, function () {
                            $(this).alert('close');
                        });
                    }
                    function RegisterSuccess() {
                        $('#RegisterSuccess').show();
                        $('.alert').delay(2000).slideUp(200, function () {
                            $(this).alert('close');
                        });
                    }
                </script>
                <div class="alert alert-dismissible alert-danger collapse" id="AccountExist">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Account already exist! </strong>please using another username
                </div>
                <div class="alert alert-dismissible alert-success collapse" id="RegisterSuccess">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Register Success! </strong>You will soon direct to Index
                </div>
            </div>

            <div class="col-md-4">
            </div>
        </div>


        <!--Modal-->
        <div class="modal fade" id="Congrat" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Creating account
                        </h4>
                    </div>
                    <div class="modal-body">
                        By clicking Confirm, I agree to the Terms of Service and Privacy Policy.
          <br />
                        <a href="www.baidu.com" style="margin-right: 5px">Terms of Service</a>
                        <a href="www.baidu.com">Privacy Policy</a>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnSubmit" runat="server" Text="Confirm" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>

    </form>



</body>
</html>
