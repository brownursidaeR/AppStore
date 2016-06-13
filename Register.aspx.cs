using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization;
using System.Text;
using System.Net;
using System.Runtime.Serialization.Json;
using System.IO;

public partial class Register : System.Web.UI.Page
{
    CommDB db = new CommDB();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Notify the user for checking robotic validation first
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { Robotic(); });", true);

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
                        
                        recaptcha.Visible = false;
                        btnSubmit_Click();
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

    protected void btnSubmit_Click()
    {
        int i;
        string mysql;
        string uid = "";

        //Query if there already had a record
        mysql = "select * from tblUser where fldUsername='" + txbUserID.Text + "'";

        //Store the record in integer i
        i = db.Rownum(mysql, "test", ref uid);

        if (i > 0)
        {
            //Call out the Client Side Script for Account Exist
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { AccountExist(); });", true);

            Response.AppendHeader("Refresh", "2;url=Register.aspx");
        }
        else
        {
            //Encrypt Password
            string EncryptedPassword = db.Encrypt(txbPass.Text.Trim());

            //Insert a new user record
            mysql = "insert into tblUser(fldUsername,fldPassword) values('" + txbUserID.Text + "','" + EncryptedPassword + "')";

            //Execute the insert
            db.ExecuteNonQuery(mysql);

            //Call out the Client Side Script for Register Success
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { RegisterSuccess(); });", true);

            Session["uid"] = txbUserID.Text;

            //Refresh and redirect to Home page
            Response.AppendHeader("Refresh", "2;url=index.aspx");
        }
    }




}