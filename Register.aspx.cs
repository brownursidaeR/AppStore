using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    CommDB db = new CommDB();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int i;
        string mysql;
        string uid = "";

        //Query if there already had a record
        mysql = "select * from tblUser where fldUsername='" + txbUserID.Text + "'";

        //Store the record in integer i
        i = db.Rownum(mysql, "test", ref uid);

        if (i>0)
        {
            //Call out the Client Side Script for Account Exist
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { AccountExist(); });", true);
        }
        else
        {
            //Insert a new user record
            mysql = "insert into tblUser(fldUsername,fldPassword) values('" + txbUserID.Text + "','" + txbPass.Text + "')";

            //Execute the insert
            db.ExecuteNonQuery(mysql);

            //Call out the Client Side Script for Register Success
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { RegisterSuccess(); });", true);

            //Refresh and redirect to Home page
            Response.AppendHeader("Refresh", "2;url=index.aspx");
        }
    }
    
}