<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="theme-color" content="#FAFAFA"/>
<script src="js/bootstrap.min.js"></script>
<link rel = "Shortcut Icon" href=img/favico.ico> 
    <title>Login</title>
</head>
<body style="background-color: #CFD8DC">
    
    <form id="form1" runat="server" class="form-horizontal">
         <nav class="navbar navbar-default navbar-fixed-top">

    <div class="navbar-header"">
      <a class="navbar-brand" href="#">Apple store</a>
    </div>

    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li> <a href="index.aspx">Home</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Help</a></li>
      </ul>
    </div>

      
</nav >

   <div class="container-fluid container-mg" style="background-color: #CFD8DC">     
        <div class="col-md-4"></div>
        <div class="col-md-4" style="background-color: #FAFAFA;border: 1px solid #eeeeee;box-shadow: 0px 2px 2px #888888;">
          <fieldset >
              <div class="col-md-12" style="text-align:center"><h2>Login</h2></div>
            <div class="form-group">
              <label for="inputEmail" class="col-lg-2 control-label">Email</label>
              <div class="col-lg-10">
                <asp:TextBox ID="txbUserID" CssClass="form-control" placeholder="UserID" runat="server"></asp:TextBox>
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword" class="col-lg-2 control-label">Password</label>
              <div class="col-lg-10">
                  <asp:TextBox ID="txbPass" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
              </div>
            </div> 
    
            <div class="form-group">
              <div class="col-lg-10">
                <br>
                  </div>
       
              <div class="col-lg-10 col-lg-offset-2">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-default"/>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click"/>
              </div>
            </div>
          </fieldset>
            </div>
       
        <div class="col-md-4"></div>
       </div>

</form>
   
</body>
</html>
