using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CuteWebUI;
using System.Data;
using System.IO;

public partial class Add : System.Web.UI.Page
{
    //Using method CommDB
    CommDB db = new CommDB();

    //Set up a new dataset
    public DataSet ds = new DataSet();

    public string appid, appname, apptype, appinfo, appdetail, appprice,appreview;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            checkLogin();
        }

        appinfo = AppInfo.Text.ToString();

        apptype = AppType.Text.ToString();

        appname = AppName.Text.ToString();

        appdetail = AppDetail.Text.ToString();

        appprice = AppPrice.Text.ToString();

        appreview = AppReview.Text.ToString();
    }

    private void checkLogin()
    {

        if (Session["uid"] == null)
        {
            Response.Redirect("404.html");
        }
        else
        {
            //Get Session type
            string uid = Session["uid"].ToString();

            //Query string for Administrator
            string mysql = "SELECT * FROM TBLUSER WHERE FLDUSERNAME='" + uid + "' AND FLDTYPE=1";

            //store record in integer i
            int i = db.Rownum(mysql, "test", ref uid);

            if (i > 0)
            {
                adminuid.Text = "<i class=\"material-icons\">face</i> " + Session["uid"].ToString();
              
            }
            else
            {
                Response.Redirect("404.html");
            }
        }
    }

    protected void Uploader1_FileValidating(object sender, UploaderEventArgs args)
    {
        if (appinfo == "" || apptype == "" || appname == "" || appdetail == "" || appprice == "")
        {
            Response.Write("<script>alert('Please filled all blank!');</script>");
        }
        else {
            if (StatusLabel.Text == "Success!")
            {
                //Set up the upload path
                string virpath = "/img/" + args.FileGuid + System.IO.Path.GetExtension(args.FileName);

                //Set up the MapPath
                string savepath = Server.MapPath(virpath);

                //Substring the image path
                string imgpath = virpath.Substring(virpath.LastIndexOf("/") + 1, virpath.LastIndexOf(".") - 1);


                //TEXT: never override existing file unless it's uploaded by same people.
                if (System.IO.File.Exists(savepath))
                    return;

                string folder = System.IO.Path.GetDirectoryName(savepath);
                if (!System.IO.Directory.Exists(folder)) System.IO.Directory.CreateDirectory(folder);

                //now copy the file instead of 
                args.CopyTo(savepath);

                //send server information to client side.
                Uploader1.SetValidationServerData(virpath);

                //update imgpath
                string mysql = "INSERT INTO TBLAPP (FLDAPPNAME,FLDAPPINFO,FLDAPPDETAIL,FLDPRICE,FLDTYPE) VALUES ('" + appname + "','" + appinfo + "','" + appdetail + "','" + appprice + "','" + apptype + "')";

                //Execute the Update string
                db.ExecuteNonQuery(mysql);

                //The disadvantage of this method is not suitable for high concurrency which I would consider another method later
                string mysqlqaid = "SELECT MAX(Id) FROM TBLAPP";

                ds = db.ExecuteQuery(mysqlqaid, "Lastindex");

                appid = ds.Tables["Lastindex"].Rows[0][0].ToString();

                string mysqlRes = "INSERT INTO TBLRES(FLDAPPID,FLDAPPSCREENSHOT,FLDAPPIMGPATH,FLDREVIEW,FLDREVIEWER) VALUES ('" + appid + "','" + Session["filename"].ToString() + "','" + imgpath + "','" + appreview + "','" + Session["uid"].ToString() + "')";

                db.ExecuteNonQuery(mysqlRes);

                Response.Write("<script language=javascript>alert('A new app has been added');</script>");
            }
            else {
                Response.AddHeader("Refresh","1");

                Response.Write("<script language=javascript>alert('You havent upload a screenshot yet');</script>");
            }




        }


    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Response.Redirect("index.aspx");
    }

    protected void btnScreenshot_Click(object sender, EventArgs e)
    {

        if (appinfo == "" || apptype == "" || appname == "" || appdetail == "" || appprice == "")
        {
            Response.Write("<script>alert('Please filled all blank!');</script>");
        }
        else {
            if (ScreenshotU.HasFile)
            {
                try
                {
                    if (ScreenshotU.PostedFile.ContentType == "image/jpeg" || ScreenshotU.PostedFile.ContentType == "image/png")
                    {
                        if (ScreenshotU.PostedFile.ContentLength < 10485760)
                        {
                            string filename = Path.GetFileName(ScreenshotU.FileName);
                            Session["filename"] = filename;
                            ScreenshotU.SaveAs(Server.MapPath("~//img//") + filename);
                            StatusLabel.Text = "Success!";
                        }
                        else
                            StatusLabel.Text = "Upload status: The file has to be less than 10 mb!";
                    }
                    else
                        StatusLabel.Text = "Upload status: Only JPEG files are accepted!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }
    }
}