using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Runtime.Serialization;
using System.Text;
using System.Net;
using System.Runtime.Serialization.Json;
using System.IO;

public partial class Login : System.Web.UI.Page
{

    //Using CommDB Method
    CommDB db = new CommDB();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.Write("<script>alert('Check the robot validation first');</script>");
            btnSubmit.Enabled = false;
            btnSubmit.ToolTip = "Please check the validation then click 'I am not a robot'";
            txbUserID.Enabled = false;
            txbUserID.ToolTip = "Please check the validation then click 'I am not a robot'";
            txbPass.Enabled = false;
            txbPass.ToolTip = "Please check the validation then click 'I am not a robot'";
        }
    }

    protected void btnValidateReCaptcha_Click(object sender, EventArgs e)
    {
        //start building recaptch api call
        var sb = new StringBuilder();
        sb.Append("https://www.google.com/recaptcha/api/siteverify?secret=");

        //my secret key
        var secretKey = "6Ld5dCETAAAAANSUKTD7cS40GruobELKIRZiFew-";
        sb.Append(secretKey);

        //response from recaptch control
        sb.Append("&");
        sb.Append("response=");
        var reCaptchaResponse = Request["g-recaptcha-response"];
        sb.Append(reCaptchaResponse);

        //client ip address

        sb.Append("&");
        sb.Append("remoteip=");
        var clientIpAddress = GetUserIp();
        sb.Append(clientIpAddress);

        //make the api call and determine validity
        using (var client = new WebClient())
        {
            var uri = sb.ToString();
            var json = client.DownloadString(uri);
            var serializer = new DataContractJsonSerializer(typeof(RecaptchaApiResponse));
            var ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
            var result = serializer.ReadObject(ms) as RecaptchaApiResponse;

            // Check if we are able to call api or not.
            if (result == null)
            {
                lblForMessage.Text = "Captcha was unable to make the api call";
            }
            else // If Yes
            {
                //api call contains errors
                if (result.ErrorCodes != null)
                {
                    if (result.ErrorCodes.Count > 0)
                    {
                        foreach (var error in result.ErrorCodes)
                        {
                            lblForMessage.Text = "reCAPTCHA Error: " + error;
                        }
                    }
                }
                else //api does not contain errors
                {
                    if (!result.Success) //captcha was unsuccessful for some reason
                    {
                        lblForMessage.Text = "Captcha did not pass, please try again.";
                    }
                    else //---- If successfully verified. Do your rest of logic.
                    {
                        btnValidateReCaptcha.Visible = false;
                        recaptcha.Visible = false;
                        btnSubmit.Enabled = true;
                        txbUserID.Enabled = true;
                        txbPass.Enabled = true;
                    }
                }

            }

        }
    }

    [DataContract]
    public class RecaptchaApiResponse
    {
        [DataMember(Name = "success")]
        public bool Success;

        [DataMember(Name = "error-codes")]
        public List<string> ErrorCodes;
    }

    // To get user IP

    private string GetUserIp()
    {
        var visitorsIpAddr = string.Empty;

        if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            visitorsIpAddr = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        else if (!string.IsNullOrEmpty(Request.UserHostAddress))
        {
            visitorsIpAddr = Request.UserHostAddress;
        }

        return visitorsIpAddr;
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
                Response.AppendHeader("Refresh", "2;url=login.aspx");
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
                Response.AppendHeader("Refresh", "2;url=login.aspx");
            }
        }
        else
        {
            //Calling the Client Side Script for notifing User type selected needed
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { UserTypeNeeded(); });", true);
            //Refresh page
            Response.AppendHeader("Refresh", "2;url=login.aspx");
        }
    }

    private string getuser()
    {
        return Session["uid"].ToString();
    }

}
