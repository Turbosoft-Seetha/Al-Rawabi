using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.Admin
{
    public partial class AddEditDeviceRoute : System.Web.UI.Page
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
        public int RouteID
        {
            get
            {
                int RouteID;
                int.TryParse(Request.Params["DId"], out RouteID);

                return RouteID;
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
                DataTable lstData = default(DataTable);
                lstData = ObjclsFrms.loadList("SelectRouteForDeviceRoute", "sp_Masters", RouteID.ToString());
                if (lstData.Rows.Count > 0)
                {
                    txtRoute.Text = lstData.Rows[0]["rot_Name"].ToString();
                }
            }
            else
            {
                DataTable lstData = default(DataTable);
                lstData = ObjclsFrms.loadList("SelectDeviceRouteByID", "sp_Masters", ResponseID.ToString());
                if (lstData.Rows.Count > 0)
                {
                    string name, status;

                    name = lstData.Rows[0]["dir_MACID"].ToString();
                    status = lstData.Rows[0]["Status"].ToString();

                    txtRoute.Text = lstData.Rows[0]["rot_Name"].ToString();
                    txtName.Text = name.ToString();
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
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditDeviceRoute.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }
        protected void Save(string mode)
        {
            string user, name, status, route;
            name = txtName.Text.ToString();
            status = ddlStatus.SelectedValue.ToString();
            route = RouteID.ToString();
            user = UICommon.GetCurrentUserID().ToString();


            if (mode.Equals("I"))
            {
                string[] arr = { route.ToString(), user.ToString(), status.ToString() };
                DataTable lstClaim = ObjclsFrms.loadList("InsertDeviceRoute", "sp_Masters", name.ToString(), arr);
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
                string[] arr = { name.ToString(), route.ToString(), user.ToString(), status.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateDeviceRoute", id.ToString(), arr);
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
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeviceRoute.aspx?Id=" + RouteID.ToString());
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeviceRoute.aspx?Id=" + RouteID.ToString());
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }
    }
}