<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA">
    <link rel="Shortcut Icon" href="img/favico.ico">
    <title>App Store</title>
    <style>
        @media (max-width:768px) {
            a.list-group-item {
                font-size: 0px;
            }
        }
    </style>
</head>

<body style="background-color: #CFD8DC;" runat="server">
    <form runat="server">
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
                        <li><a href="mailto:brownursidae@gmail.com?Subject=Contact">Contact</a></li>
                        <li><a href="mailto:brownursidae@gmail.com?Subject=I%20need%20help">Help</a></li>
                    </ul>
                    <div class="col-md-6" role="search">
                        <div class="form-group" runat="server">
                            <div class="container-fluid">
                                <div class="col-md-10 col-xs-6" style="margin-top: 20px">
                                    <asp:TextBox ID="txbSearch" runat="server" placeholder="Search" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-2 col-xs-6" style="margin-top: 15px">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <asp:HyperLink ID="ResigterLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink></li>
                        <li>
                            <asp:LinkButton ID="Logout" runat="server" OnClick="Logout_Click"></asp:LinkButton></li>
                    </ul>
                </div>
            </div>
        </nav>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <div class="container-fluid container-mg" style="background-color: #CFD8DC; margin-bottom: 5%">
            <div class="col-md-2">
                <div class="list-group tldr">
                    <asp:LinkButton ID="CatApp" runat="server" CssClass="list-group-item col-md-12 col-xs-2" OnClick="CatLink_Click"><i class="material-icons">shop_two</i> App</asp:LinkButton>
                    <asp:LinkButton ID="CatGame" runat="server" CssClass="list-group-item col-md-12 col-xs-2" OnClick="CatLink_Click"><i class="material-icons">devices</i> Games</asp:LinkButton>
                    <asp:LinkButton ID="CatMedia" runat="server" CssClass="list-group-item col-md-12 col-xs-2" OnClick="CatLink_Click"><i class="material-icons">headset</i> Media</asp:LinkButton>
                    <asp:LinkButton ID="CatTool" runat="server" CssClass="list-group-item col-md-12 col-xs-2" OnClick="CatLink_Click"><i class="material-icons">verified_user</i> Tools</asp:LinkButton>
                    <asp:HyperLink ID="Account" runat="server" CssClass="list-group-item col-md-12 col-xs-2"><i class="material-icons">credit_card</i> Account</asp:HyperLink>
                    <asp:HyperLink ID="Setting" runat="server" CssClass="list-group-item col-md-12 col-xs-2" NavigateUrl="#"><i class="material-icons">settings</i> Setting</asp:HyperLink>
                </div>
            </div>


            <div class="col-md-8">

                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <div>
                                <asp:Image ID="Image1" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c12.png" />
                                <asp:Image ID="Image2" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c24.png" />
                                <asp:Image ID="Image3" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c21.png" />
                            </div>
                        </div>
                        <div class="item">
                            <div>
                                <asp:Image ID="Image4" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c26.png" />
                                <asp:Image ID="Image5" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c14.png" />
                                <asp:Image ID="Image6" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c23.png" />
                            </div>
                        </div>
                        <div class="item">
                            <div>
                                <asp:Image ID="Image7" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c21.png" />
                                <asp:Image ID="Image8" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c16.png" />
                                <asp:Image ID="Image9" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c9.png" />
                            </div>
                        </div>

                        <div class="item">
                            <div>
                                <asp:Image ID="Image10" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c10.png" />
                                <asp:Image ID="Image11" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c15.png" />
                                <asp:Image ID="Image12" runat="server" CssClass="wrapping-img" ImageUrl="~/img/c20.png" />
                            </div>
                        </div>

                    </div>
                    <a class="carousel-control left tldr" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                    <a class="carousel-control right tldr" href="#myCarousel" data-slide="next">&rsaquo;</a>

                </div>

                <div class="divider">
                    <h2>New and update app</h2>
                </div>

                <div class="container-fluid">
                    <div class="row">
                        <% for (int i = 0; i < ds.Tables["App"].Rows.Count && i < 6; i++)
                            { %>
                        <div class="app-card col-xs-12">
                            <img class="app-img click" id="<%=ds.Tables["App"].Rows[i][0].ToString() %>" src="img/<%=ds.Tables["App"].Rows[i][1].ToString() %>" />
                            <small class="col-md-12 col-xs-12 app-name tldr"><%=ds.Tables["App"].Rows[i][4].ToString() %></small>
                            <cite class=" col-md-12 col-xs-12 caption tldr"><%=ds.Tables["App"].Rows[i][5].ToString() %></cite>
                        </div>
                        <% } %>
                    </div>
                </div>

                <div class="divider">
                    <h2>More free Apps</h2>
                </div>

                <div class="container-fluid">
                    <div class="row">

                        <% for (int j = 6; j < ds.Tables["App"].Rows.Count && j < 12; j++)
                            { %>
                        <div class="app-card col-xs-12">
                            <img class="app-img click" id="<%=ds.Tables["App"].Rows[j][0].ToString() %>" src="img/<%=ds.Tables["App"].Rows[j][1].ToString() %>" />
                            <small class="col-md-12 col-xs-12 app-name tldr"><%=ds.Tables["App"].Rows[j][4].ToString() %></small>
                            <cite class=" col-md-12 col-xs-12 caption tldr"><%=ds.Tables["App"].Rows[j][5].ToString() %></cite>
                        </div>
                        <% } %>
                    </div>

                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
        <script type="text/javascript">
            //Rediect on img clicking
            $(document).ready(function () {
                $('img.click').click(function () {
                    window.location.href = 'App.aspx?ID=' + this.id;
                });
            });
            function goBack() {
                window.history.back();
            }
        </script>
        <footer style="padding-bottom: 5%">
          
        </footer>
    </form>
</body>
</html>
