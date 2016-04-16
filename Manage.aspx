<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA" />
    <script src="js/bootstrap.min.js"></script>
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
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
            </div>


        </nav>


        <div class="container-fluid container-mg" style="background-color: #CFD8DC">
            <div class="col-md-2"></div>
            <div class="col-md-8 cardbackground">
                <fieldset>
                     <h2>Manage the application</h2>
                    <table class="table table-striped table-hover ">
                        <thead>
                           
                            <tr>
                                <th>#</th>
                                <th>Column heading</th>
                                <th>Column heading</th>
                                <th>Column heading</th>
                                 <th><br /></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td class="btn btn-primary btn-sm">Edit</td>
                                <td class="btn btn-danger btn-sm">Delete</td>
                                <td class="btn btn-default btn-sm">Cancel</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td class="btn btn-primary btn-sm">Edit</td>
                                <td class="btn btn-danger btn-sm">Delete</td>
                                <td class="btn btn-default btn-sm">Cancel</td>
                            </tr>
                            <tr class="info">
                                <td>3</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td class="btn btn-primary btn-sm">Edit</td>
                                <td class="btn btn-danger btn-sm">Delete</td>
                                <td class="btn btn-default btn-sm">Cancel</td>
                            </tr>
                            <tr class="success">
                                <td>4</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td class="btn btn-primary btn-sm">Edit</td>
                                <td class="btn btn-danger btn-sm">Delete</td>
                                <td class="btn btn-default btn-sm">Cancel</td>
                            </tr>
                            <tr class="danger">
                                <td>5</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td class="btn btn-primary btn-sm">Edit</td>
                                <td class="btn btn-danger btn-sm">Delete</td>
                                <td class="btn btn-default btn-sm">Cancel</td>
                            </tr>
                            <tr class="warning">
                                <td>6</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td class="btn btn-primary btn-sm">Edit</td>
                                <td class="btn btn-danger btn-sm">Delete</td>
                                <td class="btn btn-default btn-sm">Cancel</td>
                            </tr>

                            <tr class="active">
                                <td>7</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td class="btn btn-primary btn-sm">Edit</td>
                                <td class="btn btn-danger btn-sm">Delete</td>
                                <td class="btn btn-default btn-sm">Cancel</td>
                            </tr>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </div>
        <div class="col-md-2"></div>


    </form>
</body>
</html>
