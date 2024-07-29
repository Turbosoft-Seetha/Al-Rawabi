﻿using Ecosoft.DAL;
using Merchandising.Admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblYear.Text = DateTime.Now.Year.ToString();
        }

        protected void lnkReq_Click(object sender, EventArgs e)
        {
            Reset();
        }

        public void Reset()
        {
            string mail = this.txtMail.Text.ToString();


            //var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            //var stringChars = new char[6];
            //var random = new Random();
            //for (int i = 0; i < stringChars.Length; i++)
            //{
            //    stringChars[i] = chars[random.Next(chars.Length)];
            //}

            string password = Membership.GeneratePassword(8, 1);
            UserProfile userProfile = new UserProfile();
            MembershipUser user;
            user = Membership.GetUser(this.txtMail.Text);
            if (user != null)
            {
                
                DataTable dtLogin = ObjclsFrms.loadList("SelLoginCredentailsForReset", "sp_Masters", txtMail.Text.ToString());
                if (dtLogin.Rows.Count > 0)
                {
                    user.UnlockUser();
                    string NewPass = user.ResetPassword();

                    string[] arr = { };
                    string svd = ObjclsFrms.SaveData("sp_Masters", "UpdNewUserStatusToNull", Session["UserID"].ToString(), arr);
                    
                    MailService(dtLogin , NewPass);
                }
                else
                {
                    this.ltrlMessage.Text = UICommon.GetErrorMessage("We are facing some technical issues, please try again later");
                }
            }
            else
            {
                this.ltrlMessage.Text = UICommon.GetErrorMessage("User along with this account not Found");
            }
        }

        public void MailService(DataTable dx, string newPass)
        {

            StringBuilder sb = new StringBuilder();
            string body = dx.Rows[0]["emb_Body"].ToString();
            body = body.Replace("{0}", dx.Rows[0]["ToMail"].ToString());
            body = body.Replace("{1}" , newPass);

            MailMessage message = new MailMessage();
            message.Body = body.ToString();
            message.IsBodyHtml = true;
            message.From = new MailAddress(dx.Rows[0]["tcl_User"].ToString());
            message.To.Add(txtMail.Text.ToString());
            message.Subject = "Password Reset Successfull";
            SmtpClient smtp = new SmtpClient(dx.Rows[0]["tcl_Client"].ToString());
            smtp.Credentials = new System.Net.NetworkCredential(dx.Rows[0]["tcl_User"].ToString(), dx.Rows[0]["tcl_Pass"].ToString());
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Send(message);

            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>SuccessModal('Your Password Reset Success, Please check your mail for new password');</script>", false);

        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}