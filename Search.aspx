<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

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
                                <div class="col-md-10 col-xs-6" style="margin-top: 15px">
                                    <asp:TextBox ID="txbSearch" runat="server" placeholder="Search" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-2 col-xs-6" style="margin-top: 15px">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" OnClick="btnSearch_Click"/>
                                </div>
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
                <div class="list-group tldr">
                    <asp:LinkButton ID="CatApp" runat="server" CssClass="list-group-item col-md-12 col-xs-2" OnClick="CatLink_Click"><i class="material-icons">shop_two</i> App</asp:LinkButton>
                    <asp:LinkButton ID="CatGame" runat="server" CssClass="list-group-item col-md-12 col-xs-2" OnClick="CatLink_Click"><i class="material-icons">devices</i> Games</asp:LinkButton>
                    <asp:LinkButton ID="CatMedia" runat="server" CssClass="list-group-item col-md-12 col-xs-2" OnClick="CatLink_Click"><i class="material-icons">headset</i> Media</asp:LinkButton>
                    <asp:LinkButton ID="CatTool" runat="server" CssClass="list-group-item col-md-12 col-xs-2" OnClick="CatLink_Click"><i class="material-icons">verified_user</i> Tools</asp:LinkButton>
                    <asp:HyperLink ID="Account" runat="server" CssClass="list-group-item col-md-12 col-xs-2" NavigateUrl="~/User.aspx"><i class="material-icons">credit_card</i> Account</asp:HyperLink>
                    <asp:HyperLink ID="Setting" runat="server" CssClass="list-group-item col-md-12 col-xs-2" NavigateUrl="#"><i class="material-icons">settings</i> Setting</asp:HyperLink>
                </div>
            </div>
            <div class="col-md-8">
                <div class="container-fluid">
                    <div class="row">
                        <% for (int i = 0; i < ds.Tables["Query"].Rows.Count; i++)
                            { %>
                        <div class="app-card col-xs-12">
                            <img class="app-img click" id="<%=ds.Tables["Query"].Rows[i][0].ToString() %>" src="img/<%=ds.Tables["Query"].Rows[i][1].ToString() %>" />
                            <small class="col-md-12 col-xs-12 app-name tldr"><%=ds.Tables["Query"].Rows[i][4].ToString() %></small>
                            <cite class=" col-md-12 col-xs-12 caption tldr"><%=ds.Tables["Query"].Rows[i][5].ToString() %></cite>
                        </div>
                        <% } %>
                    </div>
                </div>
                <div class="col-md-1">
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('img.click').click(function () {
                    window.location.href = 'App.aspx?ID=' + this.id;
                });
            });
        </script>
        
        <footer class="container-fluid" style="padding-bottom:5%;background-color:azure" >
          
              <div class="col-md-2" style="line-height:100%;">
                 
              </div>
             <div class="col-md-10" style="line-height:100%;">
                 <h1>This is a <strong>footer</strong> and nothing</h1>
                 <h2>This is a <strong>footer</strong> and nothing</h2>
                 <h3>This is a <strong>footer</strong> and nothing</h3>
                 <a href="mailto:brownursidae@gmail.com?Subject=Contact"><h4>This is a <strong>Email</strong> link</h4></a>
              </div>
             <div class="col-md-2" style="line-height:100%;">
                 <div></div>
              </div>
         
        </footer>
    </form>

</body>
</html>
