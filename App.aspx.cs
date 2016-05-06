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
    //Using method CommDB
    CommDB db = new CommDB();
    //Set up a new DataSet
    public DataSet ds = new DataSet();
    //String announcement
    string mysql,appid,uid;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["uid"] == null)
            {
                
            }

            else
            {
                //Login Validation
                LoginLink.Text = Session["uid"].ToString();
                ResigterLink.Text = null;
                LoginLink.Enabled = false;
            }
        }

        //Request the ID and store into appid
        appid = Request.QueryString["ID"];
        string  appimgpath, appname, appinfo, appdetail,price;
        //Query 1 application detial in 2 table, TBLAPP & TBLRES
        mysql = "SELECT TBLRES.FLDAPPID,TBLRES.FLDAPPIMGPATH,TBLRES.FLDAPPSCREENSHOT,TBLRES.FLDAPPCOVER,TBLAPP.FLDAPPNAME,TBLAPP.FLDAPPINFO,TBLAPP.FLDAPPDETAIL,TBLAPP.FLDPRICE,TBLAPP.FLDTYPE,TBLRES.FLDREVIEW,TBLRES.FLDREVIEWER FROM TBLRES, TBLAPP WHERE [TBLRES].[FLDAPPID]=[TBLAPP].[ID] AND [TBLAPP].[ID]=" + appid+ "";
        //Execute the query and return data
        ds = db.ExecuteQuery(mysql, "App");
        //Get the application image path
        appimgpath = ds.Tables["App"].Rows[0][1].ToString();
        //Get the application name
        appname = ds.Tables["App"].Rows[0][4].ToString();
        //Get the application information
        appinfo = ds.Tables["App"].Rows[0][5].ToString();
        //Get the application detail
        appdetail = ds.Tables["App"].Rows[0][6].ToString();
        //Get the application Price
        price=ds.Tables["App"].Rows[0][7].ToString();
        //Convert the price into Integer for comparsion
        int Priceint = Convert.ToInt32(price);
        //ImageUrl on Client Side
        appimg.ImageUrl = "~/img/" + appimgpath + "";
        //Application Name on Client Side
        AppName.Text = appname;
        //Application Information on Client Side
        AppInfo.Text = appinfo;
        //Appliacation detail on Client Side
        Appdetail.Text = appdetail;
        if (Priceint > 0)
        {
            //Change the Download button
            Price.Text = "$ "+ price.ToString();
            btnDownload.Text = "Purchased";
        }
        else
        {
            //Change the tips
            Price.Text = "Free";
        }
    }


    protected void btnDownload_Click(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            //Login Validation
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { LoginFirst(); });", true);
        }
        else
        {
            appid = Request.QueryString["ID"];
            uid = Session["uid"].ToString();
            //Insert a record into database
            mysql = "INSERT INTO TBLPURCHASE (FLDPURCHASEUSERNAME,APPID,FLDSTATUS) VALUES ('" + uid + "',"+ appid +",0)";
            //Execute the insert string
            db.ExecuteNonQuery(mysql);
            //insert item string
            string mysqlitem = "INSERT INTO TBLITEM (FLDPURCHASEID, FLDAPPID) SELECT ID, APPID FROM TBLPURCHASE WHERE NOT EXISTS(SELECT * FROM TBLITEM WHERE TBLITEM.FLDPURCHASEID = TBLPURCHASE.ID); ";
            //Execute the insert item string
            db.ExecuteNonQuery(mysqlitem);
            //Notify the user for about checking their account
            Response.Write("<script language=javascript>alert('Order sumbit! Please check your account for more detail');</script>");
        }
    }

}