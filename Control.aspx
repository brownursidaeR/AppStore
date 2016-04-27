<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Control.aspx.cs" Inherits="Control" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
<body style="background-color: #CFD8DC;">
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
        <div class="container-fluid">
  <div class="row-fluid">
    <div class="col-lg-2 col-md-2 col-xs-6" style="background-color:crimson;height:500px">
        <br />
         <br />
         <br />
      <!--Sidebar content-->
    </div>
    <div class="col-lg-10 col-md-10 col-xs-6" style="background-color:burlywood;height:500px">
      <!--Body content-->
         <br />
         <br />
         <br />
    </div>
  </div>
</div>
    </form>
</body>
</html>
