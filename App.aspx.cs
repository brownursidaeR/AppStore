using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class App : System.Web.UI.Page
{
    CommDB db = new CommDB();

    public DataSet ds = new DataSet();

    OleDbDataAdapter da = new OleDbDataAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

        string temp = Request.QueryString["ID"];

        //Convert the query string you captured to an int and store it in an int.
        //int i = Convert.ToInt32(temp);
        string appid = temp;

        string mysql, appimgpath, appname, appinfo, appdetail;
        mysql = "SELECT tblRes.fldAppID,tblRes.fldAppImgPath,tblRes.fldAppScreenshot,tblRes.fldAppCover,tblApp.fldAppName,tblApp.fldAppInfo,tblApp.fldAppdetail,tblApp.fldPrice FROM tblRes, tblApp where [tblRes].[fldAppID]=[tblApp].[ID] and [tblApp].[ID]=" + appid + "";
        ds = db.ExecuteQuery(mysql, "App");
        appimgpath = ds.Tables["App"].Rows[0][1].ToString();
        appname = ds.Tables["App"].Rows[0][4].ToString();
        appinfo = ds.Tables["App"].Rows[0][5].ToString();
        appdetail = ds.Tables["App"].Rows[0][6].ToString();
        
        appimg.ImageUrl = "~/img/" + appimgpath + "";
        AppName.Text = appname;
        AppInfo.Text = appinfo;
        Appdetail.Text = appdetail;


        //appid = ds.Tables["App"].Rows[i][0].ToString();

        //CoverPath = ds.Tables["App"].Rows[i][3].ToString();
        //Cover[i].ImageUrl = "~/img/" + CoverPath + "";
        //AppImg[i].ImageUrl = "~/img/" + appimgpath + "";
        //AppImg[i].PostBackUrl = "App.aspx?ID=" + appid + "";
        //AppName[i].Text = appname;
        //AppInfo[i].Text = appinfo;


    }

}