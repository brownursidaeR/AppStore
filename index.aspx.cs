using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;


public partial class index : System.Web.UI.Page
{
    CommDB db = new CommDB();

    public DataSet ds = new DataSet();

    DataTable App = new DataTable();

    OleDbDataAdapter da = new OleDbDataAdapter();

    string mysql;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["uid"] == null)
            {
                //Response.Write("Not login yet");
            }

            else
            {
                LoginLink.Text = Session["uid"].ToString();
                ResigterLink.Text = null;
                LoginLink.Enabled = false;
            }
        }


        //Label[] AppInfo = new Label[] {  AppInfo1, AppInfo2, AppInfo3, AppInfo4, AppInfo5, AppInfo6, AppInfo7, AppInfo8, AppInfo9, AppInfo10, AppInfo11,AppInfo12 };
        //Label[] AppName = new Label[] { AppName1, AppName2, AppName3, AppName4, AppName5, AppName6, AppName7, AppName8, AppName9, AppName10, AppName11,AppName12 };
        //ImageButton[] AppImg = new ImageButton[] {appimg1, appimg2, appimg3, appimg4, appimg5, appimg6, appimg7, appimg8, appimg9, appimg10, appimg11,appimg12 };
        //Image[] Cover = new Image[] {Image1, Image2, Image3, Image4, Image5, Image6, Image7, Image8, Image9,Image10,Image11,Image12};
        
        mysql = "SELECT tblRes.fldAppID,tblRes.fldAppImgPath,tblRes.fldAppScreenshot,tblRes.fldAppCover,tblApp.fldAppName,tblApp.fldAppInfo,tblApp.fldAppdetail,tblApp.fldPrice FROM tblRes, tblApp WHERE (([tblRes].[fldAppID]=[tblApp].[ID])) order by fldAppID desc ";
        Session["QueryAppSQL"] = mysql;
        ds = db.ExecuteQuery(mysql, "App");
        string appimgpath,appid, appname, appinfo, CoverPath;
      

        //try
        //{
        //    for (int i=0;  i < 12; i++)
        //    {   
        //        //appid = ds.Tables["App"].Rows[i][0].ToString();
        //        //appimgpath = ds.Tables["App"].Rows[i][1].ToString();
        //        ////CoverPath = ds.Tables["App"].Rows[i][2].ToString();
        //        //appname = ds.Tables["App"].Rows[i][4].ToString();
        //        //appinfo = ds.Tables["App"].Rows[i][5].ToString();


        //        //AppImg[i].ImageUrl = "~/img/" + appimgpath + "";
        //        //Cover[i].ImageUrl = "~/img/" + CoverPath + "";
        //        //AppImg[i].PostBackUrl = "App.aspx?ID=" + appid + "";
        //        //AppImg[i].ToolTip = appid;
        //        //AppName[i].Text = appname;
        //        //AppInfo[i].Text = appinfo;

        //    }

        //}
        //catch (Exception ex) {
        //    Console.WriteLine(ex.Message);
        //}




    }

    //protected void AppImg_Click(object sender, EventArgs e) {

    //    Response.Write("<script language='javascript'>alert('"+ appid +"');</script>");
    //}

    protected void CatLink_Click(object sender, EventArgs e)
    {
        LinkButton b = (LinkButton)sender;
        Session["GetType"] = b.Text;
        Response.Redirect("~/More.aspx");
        ds.Tables.Clear();

    }


}