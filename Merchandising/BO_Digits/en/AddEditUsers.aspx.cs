using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditUsers : System.Web.UI.Page
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
                ViewState["claimID"] = null;
                fillForm();
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
                lstData = ObjclsFrms.loadList("SelectUsersById", "sp_Masters", ResponseID.ToString());
                if (lstData.Rows.Count > 0)
                {
                    string name, code, status, mobile, pass, type, isTrNeed, trDur;

                    name = lstData.Rows[0]["usr_Name"].ToString();
                    code = lstData.Rows[0]["usr_Code"].ToString();
                    mobile = lstData.Rows[0]["usr_MobileNumber"].ToString();
                    status = lstData.Rows[0]["Status"].ToString();
                    pass = lstData.Rows[0]["usr_Password"].ToString();
                    type = lstData.Rows[0]["usr_Type"].ToString();
                    isTrNeed = lstData.Rows[0]["usr_IsTrackingNeeded"].ToString();
                    trDur = lstData.Rows[0]["usr_TrackingDuration"].ToString();

                    txtCode.Text = code.ToString();
                    txtCode.Enabled = false;
                    txtName.Text = name.ToString();
                    txtMobile.Text = mobile.ToString();
                    txtPass.Text = pass.ToString();
                    ddlStatus.SelectedValue = status.ToString();
                    ddlType.SelectedValue = type.ToString();
                    ddlTrNeed.SelectedValue = isTrNeed.ToString();
                    txtTrDuration.Text = trDur.ToString();
                }
            }
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListUser.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

           
        }
        protected void Save(string mode)
        {
            string user, name, code, status, mobile, pass, type, isTrNeeded, trDuration;
            code = txtCode.Text.ToString();
            name = txtName.Text.ToString();
            mobile = txtMobile.Text.ToString();
            pass = txtPass.Text.ToString();
            status = ddlStatus.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            type = ddlType.SelectedValue.ToString();
            isTrNeeded = ddlTrNeed.SelectedValue.ToString();
            trDuration = txtTrDuration.Text.ToString();

            if (mode.Equals("I"))
            {
                string[] arr = { code.ToString(), pass.ToString(), mobile.ToString(), user.ToString(), status.ToString(), type.ToString(), isTrNeeded.ToString(), trDuration.ToString() };
                DataTable lstClaim = ObjclsFrms.loadList("InsertUsers", "sp_Masters", name.ToString(), arr);
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
                string[] arr = { name.ToString(), code.ToString(), pass.ToString(), mobile.ToString(), user.ToString(), status.ToString(), type.ToString(), isTrNeeded.ToString(), trDuration.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateUsers", id.ToString(), arr);
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
        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckUsersCode", "sp_CodeChecker", code);
            if (lstCodeChecker.Rows.Count > 0)
            {
                lblCodeDupli.Text = "Code Already Exist";
                LinkButton3.Enabled = false;
                lblCodeDupli.Visible = true;
            }
            else
            {
                LinkButton3.Enabled = true;
                lblCodeDupli.Visible = false;
            }
        }

        protected void SaveButton1_Click(object sender, EventArgs e)
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
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditUsers.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListUser.aspx");
        }
    }
}