using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.Admin
{
    public partial class AddEditCoolerType : System.Web.UI.Page
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
                lstData = ObjclsFrms.loadList("SelectCoolerTypeByID", "sp_Masters", ResponseID.ToString());
                if (lstData.Rows.Count > 0)
                {
                    string name, planogram, status, capacity;

                    name = lstData.Rows[0]["clt_Name"].ToString();
                    planogram = lstData.Rows[0]["clt_Planogram"].ToString();
                    capacity = lstData.Rows[0]["clt_Capacity"].ToString();
                    status = lstData.Rows[0]["Status"].ToString();

                    txtName.Text = name.ToString();
                    txtPlanogram.Text = planogram.ToString();
                    txtCapacity.Text = capacity.ToString();
                    ddlStatus.SelectedValue = status.ToString();
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
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditCoolerType.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }
        protected void Save(string mode)
        {
            string user, name, status, planogram, capacity;
            name = txtName.Text.ToString();
            planogram = txtPlanogram.Text.ToString();
            capacity = txtCapacity.Text.ToString();
            status = ddlStatus.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();


            if (mode.Equals("I"))
            {
                string[] arr = { planogram.ToString(), capacity.ToString(), user.ToString(), status.ToString() };
                DataTable lstClaim = ObjclsFrms.loadList("InsertCoolerType", "sp_Masters", name.ToString(), arr);
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
                string[] arr = { name.ToString(), planogram.ToString(), capacity.ToString(), user.ToString(), status.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateCoolerType", id.ToString(), arr);
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
            Response.Redirect("ListCoolerType.aspx");
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }
    }
}