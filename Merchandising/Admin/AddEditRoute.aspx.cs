using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.Admin
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
                RSO();
                Users();
                fillForm();
            }
        }
        public void RSO()
        {
            DataTable lstType = ObjclsFrms.loadList("DropDownRSO", "sp_Masters");
            if (lstType.Rows.Count > 0)
            {
                ddlRSO.DataSource = lstType;
                ddlRSO.DataValueField = "id";
                ddlRSO.DataTextField = "name";
                ddlRSO.DataBind();
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
                    string name, code, status, start, end, rso, user;

                    name = lstData.Rows[0]["rot_Name"].ToString();
                    code = lstData.Rows[0]["rot_Code"].ToString();
                    start = lstData.Rows[0]["rot_StartDayPassword"].ToString();
                    status = lstData.Rows[0]["Status"].ToString();
                    end = lstData.Rows[0]["rot_EndDayPassword"].ToString();
                    rso = lstData.Rows[0]["rot_rso_ID"].ToString();
                    user = lstData.Rows[0]["usr_ID"].ToString();

                    txtCode.Text = code.ToString();
                    txtName.Text = name.ToString();
                    txtStartDayPassword.Text = start.ToString();
                    txtEndDayPassword.Text = end.ToString();
                    ddlRSO.SelectedValue = rso.ToString();
                    ddlStatus.SelectedValue = status.ToString();
                    ddlUser.SelectedValue = user.ToString();
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
        protected void Save(string mode)
        {
            string user, name, code, status, start, end, rso, appUser;
            code = txtCode.Text.ToString();
            name = txtName.Text.ToString();
            start = txtStartDayPassword.Text.ToString();
            end = txtEndDayPassword.Text.ToString();
            rso = ddlRSO.SelectedValue.ToString();
            status = ddlStatus.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            appUser = ddlUser.SelectedValue.ToString();

            if (mode.Equals("I"))
            {
                string[] arr = { code.ToString(), rso.ToString(), start.ToString(), end.ToString(), user.ToString(), status.ToString(), appUser.ToString() };
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
                string[] arr = { name.ToString(), code.ToString(), rso.ToString(), start.ToString(), end.ToString(), user.ToString(), status.ToString(), appUser.ToString() };
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
        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListRoute.aspx");
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }
    }
}