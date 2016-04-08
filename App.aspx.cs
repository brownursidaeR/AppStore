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

    DataSet ds = new DataSet();

    OleDbDataAdapter da = new OleDbDataAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Request.QueryString["ID"];
        
        string temp = Request.QueryString["ID"];

        //Convert the query string you captured to an int and store it in an int.
        int i = Convert.ToInt32(temp);

        string mysql, appimgpath, appname, appinfo,appdetail;
        mysql = "select * from tblApp";
        ds = db.ExecuteQuery(mysql, "App");
        appimgpath = ds.Tables["App"].Rows[i][4].ToString();
        appname = ds.Tables["App"].Rows[i][1].ToString();
        appinfo = ds.Tables["App"].Rows[i][2].ToString();
        appdetail = ds.Tables["App"].Rows[i][3].ToString();
        appimg.ImageUrl = "~/img/"+ appimgpath + "";
        AppName.Text = appname;
        AppInfo.Text = appinfo;
        Appdetail.Text = appdetail;


    }
    
}