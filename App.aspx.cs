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
    string mysql, appid, uid;

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

        string appimgpath, price;

        //Query 1 application detial in 2 table, TBLAPP & TBLRES
        mysql = "SELECT TBLRES.FLDAPPID,TBLRES.FLDAPPIMGPATH,TBLRES.FLDAPPSCREENSHOT,TBLRES.FLDAPPCOVER,TBLAPP.FLDAPPNAME,TBLAPP.FLDAPPINFO,TBLAPP.FLDAPPDETAIL,TBLAPP.FLDPRICE,TBLAPP.FLDTYPE,TBLRES.FLDREVIEW,TBLRES.FLDREVIEWER FROM TBLRES, TBLAPP WHERE [TBLRES].[FLDAPPID]=[TBLAPP].[ID] AND [TBLAPP].[ID]=" + appid + "";

        //Execute the query and return data
        ds = db.ExecuteQuery(mysql, "App");

        //Get the application image path
        appimgpath = ds.Tables["App"].Rows[0][1].ToString();

        //Store the price as string
        price = ds.Tables["App"].Rows[0][7].ToString();

        //Convert the price into Integer for comparsion
        int Priceint = Convert.ToInt32(price);

        //ImageUrl on Client Side
        appimg.ImageUrl = "~/img/" + appimgpath + "";

        //Application Name on Client Side
        AppName.Text = ds.Tables["App"].Rows[0][4].ToString();

        //Application Information on Client Side
        AppInfo.Text = ds.Tables["App"].Rows[0][5].ToString();

        //Appliacation detail on Client Side
        Appdetail.Text = ds.Tables["App"].Rows[0][6].ToString();

        if (uid == "" || uid == null)
        {
            //User not login yet
        }
        else {
            //Get the user id for next
            uid = Session["uid"].ToString();

            //Check if the item already in users purchase list and its status
            mysql = "SELECT * FROM TBLPURCHASE WHERE fldPurchaseUsername='" + uid + "' AND APPID = " + appid + " ";

            //Store the record for comparsion
            int i = db.Rownum(mysql, "test", ref uid);

            if (i > 0)
            {
                btnDownload.Text = "Owned";
                btnDownload.Enabled = false;
            }
            else {
                if (Priceint > 0)
                {
                    //Change the Download button
                    Price.Text = "$ " + price.ToString();
                    btnDownload.Text = "Purchased";
                }
                else
                {
                    //Change the tips
                    Price.Text = "Free";
                }

            }

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

            //Get the appid 
            appid = Request.QueryString["ID"];

            //Get the user id
            uid = Session["uid"].ToString();

            try
            {

                //Insert a record into database for new purchase order
                mysql = "INSERT INTO TBLPURCHASE (FLDPURCHASEUSERNAME,APPID,FLDSTATUS) VALUES ('" + uid + "'," + appid + ",0)";

                //Execute the insert string
                db.ExecuteNonQuery(mysql);

                //insert item string
                string mysqlitem = "INSERT INTO TBLITEM (FLDPURCHASEID, FLDAPPID) SELECT ID, APPID FROM TBLPURCHASE WHERE NOT EXISTS(SELECT * FROM TBLITEM WHERE TBLITEM.FLDPURCHASEID = TBLPURCHASE.ID); ";

                //Execute the insert item string
                db.ExecuteNonQuery(mysqlitem);

                //Notify the user for about checking their account
                Response.Write("<script language=javascript>alert('Order sumbit! Please check your account for more detail');</script>");
            }
            catch (InvalidCastException ex)
            {
                Console.WriteLine(ex.Message);
            }



        }
    }

}