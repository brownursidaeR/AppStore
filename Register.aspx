<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="css/bootstrap.css" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="theme-color" content="#FAFAFA"/>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel = "Shortcut Icon" href=img/favico.ico> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Register</title>
</head>
<body style="background-color: #CFD8DC">
    
    <form id="form1" runat="server" class="form-horizontal">
         <nav class="navbar navbar-default navbar-fixed-top">

    <div class="navbar-header"">
      <a class="navbar-brand" href="#">Apple store</a>
    </div>

    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li> <a href="https://www.baidu.com">Home</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Help</a></li>
      </ul>
    </div>

      
</nav >

   <div class="container-fluid" style="background-color: #CFD8DC">     
        <div class="col-md-4"></div>
        <div class="col-md-4" style="background-color: #FAFAFA;border: 1px solid #eeeeee;box-shadow: 0px 2px 2px #888888;">
            <fieldset >
    
      <div class="col-md-12" style="text-align:center"><h2>Register</h2></div>
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
      <label for="inputPassword" class="col-lg-2 control-label">Confirm</label>
      <div class="col-lg-10">
          <asp:TextBox ID="txbConfirm" runat="server" CssClass="form-control" placeholder="Confrim Password"></asp:TextBox>
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
                      
                      <script type ="text/javascript" lang="javascript">
                         function checkInput() {        
                          var strMsg = "";
                          var userName = document.getElementById("<%=txbUserID.ClientID%>").value;
                          var password = document.getElementById("<%=txbPass.ClientID%>").value;     
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
                          else
                          {
                              $(function () {
                                  $("#Congrat").modal({
                                      keyboard: false
                                  });
                              });
                          }
                      }
                    </script>   
                      
                      <%--RequiredFieldValidation--%>
                      <button type="button" id="sumbit" class="btn btn-primary" onclick="return checkInput()" style="margin-left:5px;float:right">Sumbit</button>
                      <%--call out the Modal if pass the Validation--%>
                      <button type="button" id="btncancel" class="btn btn-default" style="float:right">Cancel</button> 
                  </div>
        </div>
  </fieldset>
  </div>
       
        <div class="col-md-4">
            
        </div>
       </div>


<!--Modal--> <%--data-toggle="modal" data-target="#Congrat" data-backdrop="true" --%>
<div class="modal fade" id="Congrat" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               Creating account
            </h4>
         </div>
         <div class="modal-body">
            By clicking Confirm, I agree to the Terms of Service and Privacy Policy.
          <br /><a href="www.baidu.com" style="margin-right:5px">Terms of Service</a>
          <a href="www.baidu.com">Privacy Policy</a>
         </div>
         
         <div class="modal-footer">
            <button type="button" class="btn btn-default"  data-dismiss="modal" >Close</button>
            <asp:Button ID="btnSubmit" runat="server" Text="Confirm" CssClass="btn btn-primary" OnClick="btnSubmit_Click"/>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>

</form>
   


</body>
</html>
