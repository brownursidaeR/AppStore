<%@ Page Language="C#" AutoEventWireup="true" CodeFile="App.aspx.cs" Inherits="App" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA">
    <link rel="Shortcut Icon" href="img/favico.ico">
    <title>App Store</title>
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
                <a class="navbar-brand" href="#">Apple store</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <asp:HyperLink ID="ResigterLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink></li>
                </ul>
            </div>
        </nav>


        <div class="container-fluid" style="background-color: #CFD8DC">
            <div class="col-md-3">
            </div>
            <div class="col-md-5" style="border: 1px solid #eeeeee; box-shadow: 0px 2px 2px #888888; background-color: #FAFAFA; padding: 15px;">
                <div class="container-fluid">
                    <div class="container-fluid">
                        <div class="col-md-4  col-xs-6">
                            <asp:Image runat="server" ID="appimg" CssClass="app-img" Style="width: 100%; height: 100%; float: left" />
                            <asp:Label type="hidden" ID="PassID" runat="server"></asp:Label>
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <asp:Label ID="AppName" runat="server" CssClass="h4 col-md-12 col-xs-12"></asp:Label><br />
                            <%--Modified font size and detial position--%>
                            <asp:Label ID="AppInfo" runat="server" CssClass="h5 col-md-12 col-xs-12"></asp:Label>
                            <asp:Label ID="Appdetail" Style="word-break: break-all" runat="server" CssClass="well-sm col-md-12 col-xs-12"></asp:Label>
                            <asp:Label ID="Price" runat="server" CssClass="h4 col-md-12 col-xs-12"></asp:Label>
                        </div>
                    </div>
                    <div class="divider">
                        <br />
                    </div>
                    <div class="container-fluid">
                        <script type="text/javascript" src="js/jquery.min.js"></script>
                        <script type="text/javascript" src="js/bootstrap.min.js"></script>
                        <script type="text/javascript">
                            function LoginFirst() {
                                $('#LoginFail').modal({
                                    keyboard: false
                                });
                            }
                        </script>
                        <div class="col-md-6  col-xs-6">
                            <a href="mailto:someone@example.com?Subject=Here%20is%20the%20new%20App" class="btn btn-success btn-lg" style="float:left" target="_top">Notify</a>
                        </div>
                        <div class="col-md-6  col-xs-6">
                            <asp:Button ID="btnDownload" runat="server" Text="Download" Style="float: right;" CssClass="btn btn-primary btn-lg" OnClick="btnDownload_Click" />
                        </div>
                    </div>

                    <div class="divider">
                        <br />
                    </div>
                    <div class="container-fluid">
                        <img src="img/<%=ds.Tables["App"].Rows[0][2].ToString() %>" class="col-xs-12 screenshot">
                    </div>

                    <div class="divider">
                        <h2 class="container-fluid">Review</h2>
                    </div>

                    <div class="container-fluid">
                        <%for (int i = 0; i < ds.Tables["App"].Rows.Count && i < 3; i++)
                            { %>
                        <blockquote>
                            <p><%=ds.Tables["App"].Rows[i][9].ToString() %></p>
                            <small>The Reviewer <cite title="Source Title"><%=ds.Tables["App"].Rows[i][10].ToString() %></cite></small>
                        </blockquote>
                        <% } %>
                    </div>
                </div>
            </div>


            <div class="col-md-4">
            </div>
        </div>

        <!--Modal-->
        <div class="modal fade" id="LoginFail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Login Please</h4>
                    </div>
                    <div class="modal-body">
                        You must login to download or purchase apps!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <a href="Login.aspx" class="btn btn-primary">Login</a>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
        <footer style="padding-bottom: 5%">
        </footer>
    </form>

</body>

</html>
