<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA">
    <link rel="Shortcut Icon" href="img/favico.ico">
    <title>App Store</title>
</head>

<body style="background-color: #CFD8DC;" runat="server">

    <form runat="server">
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
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Help</a></li>
                    </ul>
                    <div class="col-md-9" role="search">
                        <div class="form-group" runat="server">

                            <div class="col-md-10" style="margin-top: 15px">
                                <asp:TextBox ID="txbSearch" runat="server" placeholder="Search" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2" style="margin-top: 15px">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <asp:HyperLink ID="ResigterLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container-fluid container-mg" style="background-color: #CFD8DC;">
            <div class="col-md-2">

                <div class="list-group">
                    <asp:LinkButton ID="CatApp" runat="server" CssClass="list-group-item" OnClick="CatLink_Click" ><i class="material-icons">shop_two</i> App</asp:LinkButton>
                    <asp:LinkButton ID="CatGame" runat="server" CssClass="list-group-item" OnClick="CatLink_Click" ><i class="material-icons">devices</i> Games</asp:LinkButton>
                    <asp:LinkButton ID="CatMedia" runat="server" CssClass="list-group-item" OnClick="CatLink_Click" ><i class="material-icons">headset</i> Media</asp:LinkButton>
                    <asp:LinkButton ID="CatTool" runat="server" CssClass="list-group-item" OnClick="CatLink_Click" ><i class="material-icons">verified_user</i> Tools</asp:LinkButton>
                    <asp:HyperLink ID="Account" runat="server" CssClass="list-group-item" NavigateUrl="~/User.aspx"><i class="material-icons">credit_card</i> My account</asp:HyperLink>
                    <asp:HyperLink ID="Setting" runat="server" CssClass="list-group-item" NavigateUrl="#"><i class="material-icons">settings</i> Settings</asp:HyperLink>
                </div>
            </div>

            <div class="col-md-8">
                <script type="text/javascript" src="js/jquery.min.js"></script>
                <script type="text/javascript" src="js/bootstrap.min.js"></script>

                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <div>
                                <img src="img/5.png" class="wrapping-img">
                                <img src="img/4.png" class="wrapping-img">
                                <img src="img/6.png" class="wrapping-img">
                            </div>
                        </div>
                        <div class="item">
                            <div>
                                <img src="img/1.png" class="wrapping-img">
                                <img src="img/2.png" class="wrapping-img">
                                <img src="img/3.png" class="wrapping-img">
                            </div>
                        </div>
                        <div class="item">
                            <div>
                                <img src="img/7.png" class="wrapping-img">
                                <img src="img/8.png" class="wrapping-img">
                                <img src="img/10.png" class="wrapping-img">
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>

                </div>
                <%--<div class="division"><h3>New and update app</h3></div>--%>
                <div class="divider">
                    <h2>New and update app</h2>
                </div>

                <div class="container-fluid">
                    <div class="row">
                        <div class="app-card col-xs-12 ">
                            <asp:ImageButton ID="appimg0" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName0" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo0" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg1" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName1" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo1" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg2" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName2" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo2" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg3" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName3" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo3" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg4" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName4" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo4" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg5" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName5" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo5" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                    </div>
                </div>

                <div class="divider">
                    <h2>More free Apps</h2>
                </div>

                <div class="container-fluid">
                    <div class="row">
                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg6" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName6" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo6" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg7" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName7" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo7" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg8" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName8" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo8" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg9" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName9" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo9" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg10" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName10" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo10" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                        <div class="app-card col-xs-12">
                            <asp:ImageButton ID="appimg11" runat="server" CssClass="app-img" />
                            <asp:Label ID="AppName11" runat="server" CssClass="col-md-12 col-xs-12 app-name tldr"></asp:Label>
                            <asp:Label ID="AppInfo11" runat="server" CssClass="col-md-12 col-xs-12 caption tldr"></asp:Label>
                        </div>

                    </div>
                </div>

            </div>

            <div class="col-md-1">
                <div></div>
            </div>
        </div>


        <footer>
            <div class="modal-footer">
            </div>
        </footer>
    </form>
</body>
</html>
