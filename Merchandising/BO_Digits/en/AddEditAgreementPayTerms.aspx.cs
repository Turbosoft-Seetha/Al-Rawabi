﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditAgreementPayTerms : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillForm();
            }
        }
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);

                return ResponseID;
            }
        }
        public void FillForm()
        {
            DataTable lstDatas = ObjclsFrms.loadList("selAgreementPayTermsById", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string Code, Name, ArabicName, Status;
                Code = lstDatas.Rows[0]["apt_Code"].ToString();
                Name = lstDatas.Rows[0]["apt_Name"].ToString();
                ArabicName = lstDatas.Rows[0]["apt_ArabicName"].ToString();
                Status = lstDatas.Rows[0]["Status"].ToString();

                txtCode.Text = Code.ToString();
                txtname.Text = Name.ToString();
                txtArabicName.Text = ArabicName.ToString();
                ddlStatus.SelectedValue = Status.ToString();
                txtCode.Enabled = false;
            }
        }

        protected void Save()
        {
            string Code, Name, ArabicName, Status, user;
            Code = txtCode.Text.ToString();
            Name = txtname.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            ArabicName = txtArabicName.Text.ToString();
            Status = ddlStatus.SelectedValue.ToString();

            if (ResponseID.Equals("") || ResponseID == 0)
            {
                string[] arr = { Name, ArabicName, user, Status };
                string Value = ObjclsFrms.SaveData("sp_Masters", "insAgreementPayTerms", Code, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Agreement PayTerms  Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }


            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = { Name, ArabicName, user, Status, id };
                string Value = ObjclsFrms.SaveData("sp_Masters", "updateAgreementPayTerms", Code, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Agreement PayTerms Updated Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BO_Digits/en/ListAgreementPayTerms.aspx");

        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckAgreementPayTerms", "sp_CodeChecker", code);
            if (lstCodeChecker.Rows.Count > 0)
            {
                lblCodeDupli.Text = "Code Already Exist";
                lnkSave.Enabled = false;
                lblCodeDupli.Visible = true;
            }
            else
            {
                lnkSave.Enabled = true;
                lblCodeDupli.Visible = false;
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BO_Digits/en/ListAgreementPayTerms.aspx");

        }
    }
}