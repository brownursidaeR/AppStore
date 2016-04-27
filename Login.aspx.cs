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
            string uid = "";
            mysql = "select * from tblUser where fldUsername='" + txbUserID.Text + "' and fldPassword ='" + txbPass.Text + "' and fldtype=1";
            i = db.Rownum(mysql, "test", ref uid);

            if (i > 0)
            {
                Session["uid"] = txbUserID.Text.Trim(); //Saved userID
                Response.Redirect("Manage.aspx");
            }
        }
        else if (btnU.Checked == true)
        {
            string uid = "";
            mysql = "select * from tblUser where fldUsername='" + txbUserID.Text + "' and fldPassword ='" + txbPass.Text + "' and fldtype=0";
            i = db.Rownum(mysql, "test", ref uid);

            if (i > 0)
            {
                Session["uid"] = txbUserID.Text.Trim(); //Saved userID
                Response.Redirect("index.aspx");
            }
        }
        else
        { 
            Response.Write("<script>alert('Wrong')</script>");
        }





    }

    private string getuser()
    {
        return Session["uid"].ToString();
    }
}