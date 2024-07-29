using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditRoute : System.Web.UI.Page
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
              
                Users();
                fillForm();
            }
        }
       
        public void Users()
        {
            DataTable lstUser = ObjclsFrms.loadList("SelectUserForRouteID", "sp_Masters", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                ddlUser.DataSource = lstUser;
                ddlUser.DataValueField = "id";
                ddlUser.DataTextField = "name";
                ddlUser.DataBind();
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
                lstData = ObjclsFrms.loadList("SelectRouteByID", "sp_Masters", ResponseID.ToString());
                if (lstData.Rows.Count > 0)
                {
                    string name, code, status, start, end, rottype, user,routine,odometer,arabicName;

                    name = lstData.Rows[0]["rot_Name"].ToString();
                    code = lstData.Rows[0]["rot_Code"].ToString();
                    start = lstData.Rows[0]["rot_StartDayPassword"].ToString();
                    status = lstData.Rows[0]["Status"].ToString();
                    end = lstData.Rows[0]["rot_EndDayPassword"].ToString();
                    rottype = lstData.Rows[0]["rot_Type"].ToString();
                    user = lstData.Rows[0]["usr_ID"].ToString();
                    routine = lstData.Rows[0]["IsRoutineCheck"].ToString();
                    odometer = lstData.Rows[0]["rot_EnableOdometer"].ToString();
                    arabicName = lstData.Rows[0]["rot_ArabicName"].ToString();
                    txtCode.Text = code.ToString();
                    txtName.Text = name.ToString();
                    txtStartDayPassword.Text = start.ToString();
                    txtEndDayPassword.Text = end.ToString();
                    ddlrotType.SelectedValue = rottype.ToString();
                    ddlStatus.SelectedValue = status.ToString();
                    ddlOdometer.SelectedValue = odometer.ToString();
                    ddlRoutinecheck.SelectedValue = routine.ToString();
                    ddlUser.SelectedValue = user.ToString();
                    txtCode.Enabled = false;
                    txtArabName.Text = arabicName.ToString();
                }
            }
        }
        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListRoute.aspx");

        }
        protected void Save(string mode)
        {
            string user, name, code, status, start, end, rottype, appUser,routine,odometer,arabicName;
            code = txtCode.Text.ToString();
            name = txtName.Text.ToString();
            start = txtStartDayPassword.Text.ToString();
            end = txtEndDayPassword.Text.ToString();
           rottype=ddlrotType.SelectedValue;
            status = ddlStatus.SelectedValue.ToString();
            routine = ddlRoutinecheck.SelectedValue.ToString();
            odometer = ddlOdometer.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            appUser = ddlUser.SelectedValue.ToString();
            arabicName = txtArabName.Text.ToString();

            if (mode.Equals("I"))
            {
                string[] arr = { code.ToString(), start.ToString(), end.ToString(), user.ToString(), status.ToString(), appUser.ToString(),odometer.ToString(),
                routine.ToString(),arabicName.ToString(),rottype.ToString()};
                DataTable lstClaim = ObjclsFrms.loadList("InsertRoute", "sp_Masters", name.ToString(), arr);
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
                string[] arr = { name.ToString(), code.ToString(), start.ToString(), end.ToString(), user.ToString(), status.ToString(), appUser.ToString(),
                odometer.ToString(), routine.ToString(),arabicName.ToString(),rottype.ToString()};
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateRoute", id.ToString(), arr);
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
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditRoute.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListRoute.aspx");

        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckRouteCode", "sp_CodeChecker", code);
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
    }
}