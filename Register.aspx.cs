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
        mysql = "select * from tblLogin where fldUsername='" + txbUserID.Text + "'";
        i = db.Rownum(mysql, "test", ref uid);

        if (i>0)
        {
            Response.Write("Account already exist");
        }
        if (txbPass.Text.ToString()!=txbConfirm.Text.ToString())
        {
            Response.Write("Two password don't matched!");
        }
        else
        {
            mysql = "insert into tblLogin(fldUsername,fldPassword) values('" + txbUserID.Text + "','" + txbPass.Text + "')";
            db.ExecuteNonQuery(mysql);

        }
    }
    
}