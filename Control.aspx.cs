﻿using CuteWebUI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control : System.Web.UI.Page
{
    //Using method CommDB
    CommDB db = new CommDB();

    //Set up a new dataset
    public DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            Checklogin();

        }

    }

    private void Checklogin()
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
                bind();
            }
            else
            {
                Response.Redirect("404.html");
            }
        }
    }




    protected void Uploader1_FileValidating(object sender, UploaderEventArgs args)
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

        string appid = Request.QueryString["ID"];

        //update imgpath
        string mysql = "UPDATE TBLRES SET FLDAPPIMGPATH='" + imgpath + "' WHERE FLDAPPID =" + appid + "";

        //Execute the Update string
        db.ExecuteNonQuery(mysql);

        //Refresh in 0 sec
        Response.AddHeader("Refresh", "1");

        Response.Write("<script language=javascript>alert('Application icon Updated');</script>");

        //refresh page
        bind();

    }

    protected void Update(object sender, EventArgs e)
    {
        //Get the Query String
        string appid = Request.QueryString["ID"];

        //Update the textfield properties of the application
        string mysql = "UPDATE TBLAPP SET FLDAPPNAME='" + AppName.Text + "',FLDAPPINFO='" + AppInfo.Text + "',FLDAPPDETAIL='" + AppDetail.Text + "',FLDPRICE='" + AppPrice.Text + "',FLDTYPE='" + AppType.SelectedItem.Value.ToString() + "' WHERE ID=" + appid + "";

        //Execute the update string
        db.ExecuteNonQuery(mysql);

        string mysqlUpdateRes = "UPDATE TBLRES SET FLDREVIEW='" + AppReview.Text + "',FLDREVIEWER = '" + Session["uid"].ToString() + "' WHERE FLDAPPID=" + appid + "";

        //Update Resource file
        db.ExecuteNonQuery(mysqlUpdateRes);

        //Refresh in 0 sec
        Response.AddHeader("Refresh", "1");

        Response.Write("<script language=javascript>alert('Application data Updated');</script>");

        //Refresh the page by calling the bind();
        bind();
    }

    protected void btnScreenshot_Click(object sender, EventArgs e)
    {
        //Get the Query String
        string appid = Request.QueryString["ID"];

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

                        string mysqlUpdateRes = "UPDATE TBLRES SET FLDAPPSCREENSHOT='" + filename + "' WHERE FLDAPPID=" + appid + "";

                        //Update Resource file
                        db.ExecuteNonQuery(mysqlUpdateRes);

                        //Refresh in 0 sec
                        Response.AddHeader("Refresh", "1");

                        Response.Write("<script language=javascript>alert('Application screenshot Updated');</script>");

                        bind();
                    }
                    else
                        StatusLabel.Text = "Upload status: The file has to be less than 10 mb!";
                }
                else
                    StatusLabel.Text = "Upload status: Only JPEG and PNg files are accepted!";
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }

    protected void bind()
    {
        ds.Clear();

        //Get the QueryString
        string appid = Request.QueryString["ID"];

        //String needed
        string mysql, appimgpath;

        //Query string from 2 tables TBLAPP, TBLRES
        mysql = "SELECT TBLRES.FLDAPPID,TBLRES.FLDAPPIMGPATH,TBLRES.FLDAPPSCREENSHOT,TBLRES.FLDAPPCOVER,TBLAPP.FLDAPPNAME,TBLAPP.FLDAPPINFO,TBLAPP.FLDAPPDETAIL,TBLAPP.FLDPRICE,TBLAPP.FLDTYPE,TBLRES.FLDREVIEW,TBLRES.FLDREVIEWER FROM TBLRES, TBLAPP WHERE [TBLRES].[FLDAPPID]=[TBLAPP].[ID] AND [TBLAPP].[ID]=" + appid + "";

        //Execute the Query string and Return values
        ds = db.ExecuteQuery(mysql, "App");

        //Store the application image path
        appimgpath = ds.Tables["App"].Rows[0][1].ToString();

        //application image url
        appimg.ImageUrl = "~/img/" + appimgpath + "";

        //Application name
        AppName.Text = ds.Tables["App"].Rows[0][4].ToString();

        //Application Information
        AppInfo.Text = ds.Tables["App"].Rows[0][5].ToString();

        //Application detail
        AppDetail.Text = ds.Tables["App"].Rows[0][6].ToString();

        //Application Price
        AppPrice.Text = ds.Tables["App"].Rows[0][7].ToString();

        //Application Review
        AppReview.Text = ds.Tables["App"].Rows[0][9].ToString();
    }



}