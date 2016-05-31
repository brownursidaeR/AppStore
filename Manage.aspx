﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<%@ Register Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" TagPrefix="CuteWebUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#FAFAFA" />
    <link rel="Shortcut Icon" href="img/favico.ico">
    <title>Manage</title>
    <style>
        @media (max-width:768px) {
            .table-hover > tbody > tr,
            .table-hover > tbody > tr > th,
            .table-hover > tbody > tr > td {
                display: block;
            }
        }
    </style>
</head>
<body style="background-color: #CFD8DC">
    <form id="form1" runat="server" class="form-horizontal">
        <nav class="navbar navbar-default"></nav>
        <nav class="navbar navbar-default navbar-fixed-top">

            <div class="navbar-header">
                <a class="navbar-brand" href="index.aspx">Apple store</a>
            </div>

            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="index.aspx">Home</a></li>
                </ul>
            </div>
        </nav>

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <div class="container-fluid container-mg" style="background-color: #CFD8DC">
            <div class="col-md-2"></div>
            <div class="col-md-8 cardbackground">
                <ul class="nav nav-tabs">
                    <li class=""><a href="#Application" data-toggle="tab" aria-expanded="true">Application</a></li>
                    <li class=""><a href="#Upload" data-toggle="tab" aria-expanded="true">Upload</a></li>
                    <li class=""><a href="#Orders" data-toggle="tab" aria-expanded="false">Orders</a></li>
                    
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active in" id="Application">
                        <asp:GridView ID="gv" runat="server" GridLines="None" CssClass="table table-striped table-hover" Width="100%" AutoGenerateColumns="False" DataKeyNames="fldAppID" OnRowEditing="gv_RowEditing" OnRowDeleting="gv_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Style="line-height: 100%" Height="50%" ImageUrl='<%# "~/img/" + DataBinder.Eval(Container.DataItem, "fldAppImgPath") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="fldAppName" HeaderText="Name" SortExpression="fldAppName" />
                                <asp:BoundField DataField="fldAppImgPath" HeaderText="Image Name" SortExpression="fldAppImgPath" />
                                <asp:CommandField EditText="Edit" ShowEditButton="True" HeaderText="Edit" ControlStyle-CssClass="btn btn-lg btn-primary" />
                                <asp:CommandField DeleteText="Delete" HeaderText="Delete" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-lg btn-danger" />
                            </Columns>
                        </asp:GridView>

                    </div>
                    <div class="tab-pane fade " id="Orders">
                        <asp:GridView ID="gvOrders" runat="server" GridLines="None" CssClass="table table-striped table-hover" Width="100%" AutoGenerateColumns="False" DataKeyNames="fldPurchaseID" OnRowEditing="gvOrders_ConfirmOrders" OnRowDeleting="gvOrders_DeletingOrders" OnRowDataBound="gvOrders_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="fldUsername" HeaderText="User" SortExpression="fldUsername" />
                                <asp:BoundField DataField="fldPurchaseID" HeaderText="Purchase ID" SortExpression="fldPurchaseID" />
                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                                <asp:BoundField DataField="fldAppName" HeaderText="App Name" SortExpression="fldAppName" />
                                <asp:BoundField DataField="fldPrice" HeaderText="Price" SortExpression="fldPrice" />
                                <asp:BoundField DataField="fldStatus" HeaderText="Status" SortExpression="fldStatus" />
                                <asp:CommandField EditText="Permit" ShowEditButton="True" HeaderText="Pass" ControlStyle-CssClass="btn btn-lg btn-success" />
                                <asp:CommandField DeleteText="Delete" HeaderText="Delete" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-lg btn-danger" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="tab-pane fade" id="Upload">
                        <h1>Upload a application</h1>
                         <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="form-group col-md-12 col-xs-12" style="padding-bottom: 10px;">
                            <asp:Image runat="server" ID="appimg" CssClass="app-img col-xs-12" Style="width: 50%; height: 300px; float: left; border: dashed 3px gray; padding: 5px;" />
                            <button id="panelbody1" class="col-xs-12 btn btn-primary btn-lg">Cick here to change photos</button>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">Name</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="AppName" CssClass="form-control" runat="server" data-toggle="tooltip" data-placement="right" title="" data-original-title="Tooltip on right"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-2 control-label">Info</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="AppInfo" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Detail</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="AppDetail" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Price</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="AppPrice" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-2 control-label">Type</label>
                            <div class="col-lg-10">
                                <asp:DropDownList ID="AppType" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="CatApp">App</asp:ListItem>
                                    <asp:ListItem Value="CatGame">Game</asp:ListItem>
                                    <asp:ListItem Value="CatMedia">Media</asp:ListItem>
                                    <asp:ListItem Value="CatTool">Tool</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                         <div class="form-group">
                        <div class="col-lg-10">
                            <%--<button type="button" class="btn btn-primary btn-lg">Click</button>--%>
                            <asp:Button runat="server" CssClass="btn btn-primary btn-lg" Text="Add" OnClick="Add_Application" />
                            <button type="button" class="btn btn-default btn-lg" onclick="goBack()">Close</button>
                        </div>
                    </div>


                        <div class="form-group">
                            <div class="col-lg-10">
                                <br>
                            </div>

                            <div class="col-lg-10 col-lg-offset-2">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3"></div>
                    </div>
                </div>
            </div>

            <div class="col-md-2"></div>
        </div>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function DeleteConfirm() {
                $('#DeletingApplicationRecord').modal({
                    keyboard: false
                });
            }

            function DeleteOrders() {
                $('#DeletingOrders').modal({
                    keyboard: false
                });
            }
        </script>

        <!--Modal-->
        <div class="modal fade" id="DeletingApplicationRecord" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel"><strong>Deleting Application!</strong></h4>
                    </div>
                    <div class="modal-body">
                        By clicking Confirm, I agree to Delete this Application.
          <br />
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnDelete" runat="server" Text="Confirm" CssClass="btn btn-primary" OnClick="Deleting_App" />
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>

        <!--Modal-->
        <div class="modal fade" id="DeletingOrders" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="ModalLabel"><strong>Deleting Orders!</strong></h4>
                    </div>
                    <div class="modal-body">
                        By clicking Confirm, I agree to Delete this Order record.
                    <br />
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnDeleteOrders" runat="server" Text="Confirm" CssClass="btn btn-primary" OnClick="Deleting_Orders" />
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
           
        </div> 
                    <CuteWebUI:Uploader runat="server" ManualStartUpload="true" ID="Uploader1" ShowQueueTable="false"
                        InsertButtonID="panelbody1" DropZoneID="panelbody1" OnFileValidating="Uploader1_FileValidating">
                        <ValidateOption MaxSizeKB="10240" />
                    </CuteWebUI:Uploader>

                    <div id="uploadlinks" style="padding-left: 12px;"></div>

                    <script>
                        //prevent the default handling by cancelling the event
                        document.ondragover = document.ondragenter = document.ondrop = function (e) {
                            e.preventDefault();
                            return false;
                        }

                        var uploader;
                        function CuteWebUI_AjaxUploader_OnInitialize() {
                            uploader = this;//get uploader object
                            uploader.internalobject.SetDialogAccept("image/*");
                        }

                        var uploadlinks = document.getElementById("uploadlinks");

                        //Fires after all uploads are complete and submit the form
                        function CuteWebUI_AjaxUploader_OnPostback() {
                            var files = uploader.getitems();
                            for (var i = 0; i < files.length; i++) {
                                var task = files[i];
                                //Get the information from server
                                var virpath = task.ServerData;
                                var link = document.createElement("A");
                                link.target = "_blank";
                                link.href = virpath;
                                link.innerHTML = "Upload Success" + task.FileName + " at " + virpath;
                                link.style.display = "block";
                                uploadlinks.appendChild(link);
                            }
                            ResetUpload();

                            //return false to cancel the default form submission
                            return false;
                        }

                        function StartUpload() {
                            uploader.startupload();//Start the upload of all queued files
                            uploadlinks.innerHTML = "";
                        }
                        function ResetUpload() {
                            //Clear file queue of uploader in the client side
                            uploader.reset();
                            $("#panelbody1").show();
                            $('#myModal').modal("hide")
                        }

                        //Fires when new information about the upload progress for a specific file is available.
                        function CuteWebUI_AjaxUploader_OnProgress(isuploading, filename, startTime, sentLen, totalLen) {
                            if (isuploading) {
                                $("#submitbutton").html(Math.floor(sentLen * 100 / totalLen) + "%");
                            }
                            return false;//hide the default progress bar
                        }

                        //Fires when files are selected successfully.
                        function CuteWebUI_AjaxUploader_OnSelect(files) {
                            var task = files[0];
                            //Retrieve a list of file items defined by HTML5 <input type=file/>
                            var srcfile = task.GetDomFile();
                            if (!srcfile || srcfile.type.indexOf("image/") != 0)
                                return;

                            //if the browse don't support
                            if (!window.Uint8Array || !window.ArrayBuffer)
                                return;

                            $('#myModal').modal({})
                            $("#submitbutton").html("Upload");

                            
                            var div = document.getElementById("imagecropper");
                            div.style.display = "block";
                            div.innerHTML = "";

                            var option = {};
                            //specify a file object for <input type=file/>
                            option.file = srcfile;
                            //specify an element for UI container 
                            option.container = div;
                            //specify the container padding
                            option.padding = 5;
                            //When square is set to false, uploader will use rectangular crop-area.
                            option.square = true;
                            //set the minimum width of an element
                            option.minWidth = 64;
                            //set the minimum height of an element
                            option.minHeight = 64;
                            //set the maximum height of an element
                            option.maxHeight = 170;
                            //set the maximum height of an element
                            option.maxWidth = 170;

                            //Fires after a file gets processed
                            option.onchange = function (newfile, dataurl, width, height) {

                                //use this function to overwrite the uploader file
                                task.OverrideDomFile(newfile);

                                //document.title = width + "x" + height + "," + newfile.size + " bytes";
                            }
                            uploader.cropper(option);
                        }
                        function goBack() {
                            window.history.back();
                        }
                    </script>

        <footer style="padding-bottom: 5%">
        </footer>
    </form>
</body>
</html>
