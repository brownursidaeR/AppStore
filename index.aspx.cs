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

    DataSet ds = new DataSet();

    OleDbDataAdapter da = new OleDbDataAdapter();


    protected void Page_Load(object sender, EventArgs e)
    {
        Label[] AppInfo = new Label[] { AppInfo0, AppInfo1, AppInfo2, AppInfo3, AppInfo4, AppInfo5, AppInfo6, AppInfo7, AppInfo8, AppInfo9, AppInfo10, AppInfo11 };
        Label[] AppName = new Label[] {AppName0, AppName1, AppName2, AppName3, AppName4, AppName5, AppName6, AppName7, AppName8, AppName9, AppName10, AppName11 };
        ImageButton[] AppImg = new ImageButton[] { appimg0,appimg1, appimg2, appimg3, appimg4, appimg5, appimg6, appimg7, appimg8, appimg9, appimg10, appimg11 };
        for (int i = 0; i < 12; i++)
        {
            string mysql, appimgpath,appname,appinfo;
            mysql = "select * from tblApp";
            ds = db.ExecuteQuery(mysql, "App");
            appimgpath = ds.Tables["App"].Rows[i][4].ToString();
            appname=ds.Tables["App"].Rows[i][1].ToString();
            appinfo=ds.Tables["App"].Rows[i][2].ToString();
            AppImg[i].ImageUrl = "~/img/"+appimgpath+"";
            AppImg[i].PostBackUrl = "App.aspx?ID=" + i +"";
            AppName[i].Text = appname;
            AppInfo[i].Text = appinfo;
        }

        

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
            }
        }




    }

 

}