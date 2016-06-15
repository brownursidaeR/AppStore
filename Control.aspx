<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Control.aspx.cs" Inherits="Control" %>

<%@ Register Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" TagPrefix="CuteWebUI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="../js/fileinput.js" type="text/javascript"></script>
    <script src="../js/fileinput_locale_fr.js" type="text/javascript"></script>
    <script src="../js/fileinput_locale_es.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
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
                </ul>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="col-lg-2 col-md-2 col-xs-12">
                    <!--Sidebar content-->
                </div>
                <div class="col-lg-8 col-md-8 col-xs-12 cardbackground">
                    <!--Body content-->
                    <h1>Applicatin Information management</h1>
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="form-group col-md-12 col-xs-12" style="padding-bottom: 10px;">
                            <asp:Image runat="server" ID="appimg" CssClass="app-img col-xs-12" Style="width: 50%; height: 50%; border: dashed 3px gray; padding: 5px;" />
                            <button id="panelbody1" class="col-xs-12 btn btn-primary btn-lg"><i class="material-icons">insert_emoticon</i> Cick here to change photos</button>
                        </div>

                        <div class="form-group">
                            <br />
                        </div>

                        <div class="form-group">
                            <div class="col-lg-1"><i class="material-icons">bookmark_border</i></div>
                            <label class="col-lg-2 control-label">Name</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="AppName" CssClass="form-control" runat="server" data-toggle="tooltip" data-placement="right" title="" data-original-title="Tooltip on right"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group">
                             <div class="col-lg-1"><i class="material-icons">subtitles</i></div>
                            <label class="col-lg-2 control-label">Info</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="AppInfo" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                             <div class="col-lg-1"><i class="material-icons">library_books</i></div>
                            <label class="col-lg-2 control-label">Detail</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="AppDetail" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-1"><i class="material-icons">account_balance_wallet</i></div>
                            <label class="col-lg-2 control-label">Price</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="AppPrice" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                         <div class="form-group">
                             <div class="col-lg-1"><i class="material-icons">border_color</i></div>
                            <label for="textArea" class="col-lg-2 control-label">Review</label>
                            <div class="col-lg-9">
                                <asp:TextBox CssClass="form-control" Rows="3" runat="server"  ID="AppReview"></asp:TextBox>
                                <span class="help-block">The review would link to you account and display to the customers.</span>
                            </div>
                        </div>

                        <div class="form-group">
                             <div class="col-lg-1"><i class="material-icons">bubble_chart</i></div>
                            <label class="col-lg-2 control-label">Type</label>
                            <div class="col-lg-9">
                                <asp:DropDownList ID="AppType" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="CatApp">App</asp:ListItem>
                                    <asp:ListItem Value="CatGame">Game</asp:ListItem>
                                    <asp:ListItem Value="CatMedia">Media</asp:ListItem>
                                    <asp:ListItem Value="CatTool">Tool</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                          <div class="form-group">
                              <div class="col-lg-1"><i class="material-icons">insert_photo</i></div>
                            <label class="col-lg-2 control-label">Screenshot</label>
                            <div class="col-lg-2">
                                <asp:FileUpload ID="ScreenshotU" CssClass="btn-default" runat="server" />
                            </div>
                            <div class="col-lg-7">
                                 <asp:button runat="server" CssClass="btn btn-primary btn-lg" style="float:right" Text="upload screenshot" OnClick="btnScreenshot_Click"/>
                            </div>
                            <div class="col-lg-12">
                                <asp:Label runat="server" ID="StatusLabel"  CssClass="control-label"></asp:Label>
                            </div>
                        </div>

                         <div class="form-group">
                        <div class="col-lg-12">
                            <a href="Manage.aspx"  class="btn btn-default btn-lg" >Close</a>
                            <asp:Button runat="server" CssClass="btn btn-primary btn-lg" style="float:right" Text="Update Application data" OnClick="Update" />
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

                <div class="col-lg-2 col-md-2 col-xs-12">
                    <!--Sidebar content-->
                </div>
            </div>
        </div>
         <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                        <div class="modal-dialog" style="width: 670px">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Crop and upload</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="imagecropper" style="width: 640px; height: 640px; position: relative;">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" onclick="StartUpload();return false;" id="submitbutton">Upload</button>
                                    <button class="btn btn-default" onclick="ResetUpload();return false;" data-dismiss="modal">Cancel</button>

                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->

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
                    </script>
                <footer style="padding-bottom: 5%">
        </footer>
    </form>
</body>
</html>
