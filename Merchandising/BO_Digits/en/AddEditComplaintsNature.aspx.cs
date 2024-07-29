﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditComplaintsNature : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["Id"], out ResponseID);

                return ResponseID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ComplaintType();
                ViewState["claimID"] = null;
                fillForm();
            }
        }
        public void ComplaintType()
        {
            DataTable lstType = ObjclsFrms.loadList("SelectComplaintType", "sp_Masters");
            if (lstType.Rows.Count > 0)
            {
                ddlTypes.DataSource = lstType;
                ddlTypes.DataValueField = "id";
                ddlTypes.DataTextField = "name";
                ddlTypes.DataBind();
            }
        }

        protected void fillForm()
        {
            if (ResponseID == 0)
            {

            }
            else
            {
                DataTable lstData = default(DataTable);
                lstData = ObjclsFrms.loadList("SelectComplaintsNatureByID", "sp_Masters", ResponseID.ToString());
                if (lstData.Rows.Count > 0)
                {
                    string name, type, status;

                    name = lstData.Rows[0]["cmn_Name"].ToString();
                    type = lstData.Rows[0]["cmn_Type"].ToString();
                    status = lstData.Rows[0]["Status"].ToString();

                    txtName.Text = name.ToString();
                    ddlTypes.SelectedValue = type.ToString();
                    ddlStatus.SelectedValue = status.ToString();
                }
            }
        }

        protected void Save(string mode)
        {
            string user, name, type, status;
            type = ddlTypes.SelectedValue.ToString();
            name = txtName.Text.ToString();
            status = ddlStatus.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();


            if (mode.Equals("I"))
            {
                string[] arr = { type.ToString(), user.ToString(), status.ToString() };
                DataTable lstClaim = ObjclsFrms.loadList("InsertComplaintsNature", "sp_Masters", name.ToString(), arr);
                if (lstClaim.Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
            else
            {
                string id = ResponseID.ToString();
                string[] arr = { name.ToString(), type.ToString(), user.ToString(), status.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateComplaintsNature", id.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }

        }
        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                if (ResponseID == 0)
                {
                    string mode = "I";
                    Save(mode);
                }
                else
                {
                    string mode = "U";
                    Save(mode);
                }
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditComplaintsNature.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListComplaintsNature.aspx");
        }
    }
}