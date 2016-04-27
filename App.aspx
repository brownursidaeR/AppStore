﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="App.aspx.cs" Inherits="App" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <script src="js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA">
    <link rel="Shortcut Icon" href="img/favico.ico">
    <title>App Store</title>
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
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">Help</a></li>
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
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <asp:Label ID="AppName" runat="server" CssClass="h4 col-md-12 col-xs-12"></asp:Label><br />
                            <%--Modified font size and detial position--%>
                            <asp:Label ID="AppInfo" runat="server" CssClass="h5 col-md-12 col-xs-12"></asp:Label>
                            <asp:Label ID="Appdetail" Style="word-break: break-all" runat="server" CssClass="well-sm col-md-12 col-xs-12"></asp:Label>
                        </div>
                    </div>
                    <div class="divider">
                        <br />
                    </div>
                    <div class="container-fluid">
                        <div class="col-md-4  col-xs-4">
                            <asp:Button runat="server" ID="btnNotify" CssClass="btn btn-primary" Style="float: left;" Text="Notify" />
                        </div>
                        <div class="col-md-4  col-xs-5">
                            <asp:Button runat="server" ID="btnDownload" CssClass="btn btn-warning" Style="float: left;" Text="Download" />
                        </div>
                        <div class="col-md-4  col-xs-3">
                            <asp:Button runat="server" ID="btnPush" CssClass="btn btn-success" Style="float: left;" Text="Push" />
                        </div>
                    </div>

                    <div class="divider">
                        <br />
                    </div>
                    <div class="container-fluid">
                         <img src="img/<%=ds.Tables["App"].Rows[0][2].ToString() %>" class="col-xs-12 screenshot">
                    </div>

                    <div class="divider">
                        <h5 class="container-fluid">Review</h5>
                    </div>

                    <div class="container-fluid">

                       <blockquote class="blockquote-reverse">
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
  <small>Someone famous in <cite title="Source Title">Source Title</cite></small>
</blockquote>
                        <blockquote class="blockquote-reverse">
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
  <small>Someone famous in <cite title="Source Title">Source Title</cite></small>
</blockquote>
                        <blockquote class="blockquote-reverse">
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
  <small>Someone famous in <cite title="Source Title">Source Title</cite></small>
</blockquote>
                    </div>
                </div>
            </div>
           

            <div class="col-md-4">
            </div>
        </div>

        
        <footer style="padding-bottom:5%">
            <div class="modal-footer">
            </div>
        </footer>
    </form>
</body>

</html>
