using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;


public partial class Login : System.Web.UI.Page
{


    CommDB db = new CommDB();

    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        string mysql;
        int i;
        if (btnA.Checked == true)
        {
            //Give a "" uid
            string uid = "";
            //Query string for Administrator
            mysql = "SELECT * FROM TBLUSER WHERE FLDUSERNAME='" + txbUserID.Text + "' AND FLDPASSWORD ='" + txbPass.Text + "' AND FLDTYPE=1";
            //store record in integer i
            i = db.Rownum(mysql, "test", ref uid);
            if (i > 0)
            {
                //Calling the Client Side Script for notifing Login Success
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { LoginSuccess(); });", true);
                //Store the UserID
                Session["uid"] = txbUserID.Text.Trim();
                //Refresh Page
                Response.AppendHeader("Refresh", "2;url=Manage.aspx");
            }
            else
            {
                //Calling the Client Side Script for notifing Login Failed
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { LoginFail(); });", true);
            }
        }
        else if (btnU.Checked == true)
        {
            //Give a "" uid
            string uid = "";
            //Query string for User
            mysql = "SELECT * FROM TBLUSER WHERE FLDUSERNAME='" + txbUserID.Text + "' AND FLDPASSWORD ='" + txbPass.Text + "' AND FLDTYPE=0";
            //store record in integer i
            i = db.Rownum(mysql, "test", ref uid);
            if (i > 0)
            {
                //Calling the Client Side Script for notifing Login Success
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { LoginSuccess(); });", true);
                //Store the UserID
                Session["uid"] = txbUserID.Text.Trim();
                //Refresh Page
                Response.AppendHeader("Refresh", "2;url=index.aspx");
            }
            else
            {
                //Calling the Client Side Script for notifing Login Failed
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { LoginFail(); });", true);
            }
        }
        else
        {
            //Calling the Client Side Script for notifing User type selected needed
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { UserTypeNeeded(); });", true);
        }
    }

    private string getuser()
    {
        return Session["uid"].ToString();
    }
}