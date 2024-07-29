using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.Admin
{
    public partial class AddEditCustomer : System.Web.UI.Page
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
                Route();
                fillForm();
            }
        }
        public void Route()
        {
            DataTable lstType = ObjclsFrms.loadList("DropDownRoute", "sp_Masters");
            if (lstType.Rows.Count > 0)
            {
                ddlRoute.DataSource = lstType;
                ddlRoute.DataValueField = "id";
                ddlRoute.DataTextField = "name";
                ddlRoute.DataBind();
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
                lstData = ObjclsFrms.loadList("SelectCustomerByID", "sp_Masters", ResponseID.ToString());
                if (lstData.Rows.Count > 0)
                {
                    string name, code, status, mobile, address, email, geo, route, locationNeeded;

                    name = lstData.Rows[0]["cus_Name"].ToString();
                    code = lstData.Rows[0]["cus_Code"].ToString();
                    mobile = lstData.Rows[0]["cus_Mobile"].ToString();
                    status = lstData.Rows[0]["Status"].ToString();
                    address = lstData.Rows[0]["cus_Address"].ToString();
                    email = lstData.Rows[0]["cus_Email"].ToString();
                    geo = lstData.Rows[0]["cus_GeoLoc"].ToString();
                    route = lstData.Rows[0]["cus_rot_ID"].ToString();
                    locationNeeded = lstData.Rows[0]["cus_IsLocationNeeded"].ToString();

                    txtCode.Text = code.ToString();
                    txtName.Text = name.ToString();
                    txtMobile.Text = mobile.ToString();
                    txtAddress.Text = address.ToString();
                    txtMail.Text = email.ToString();
                    txtGeo.Text = geo.ToString();
                    ddlRoute.SelectedValue = route.ToString();
                    ddlStatus.SelectedValue = status.ToString();
                    ddlLocationNeeded.SelectedValue = locationNeeded.ToString();
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
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditCustomer.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }
        protected void Save(string mode)
        {
            string user, name, code, status, mobile, address, email, geo, route, isLocation;
            code = txtCode.Text.ToString();
            name = txtName.Text.ToString();
            mobile = txtMobile.Text.ToString();
            address = txtAddress.Text.ToString();
            email = txtMail.Text.ToString();
            geo = txtGeo.Text.ToString();
            route = "";
            status = ddlStatus.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            isLocation = ddlLocationNeeded.SelectedValue.ToString();

            if (mode.Equals("I"))
            {
                string[] arr = { code.ToString(), address.ToString(), mobile.ToString(), email.ToString(), geo.ToString(), route.ToString(), user.ToString(), status.ToString(), isLocation.ToString() };
                DataTable lstClaim = ObjclsFrms.loadList("InsertCustomer", "sp_Masters", name.ToString(), arr);
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
                string[] arr = { name.ToString(), code.ToString(), address.ToString(), mobile.ToString(), email.ToString(), geo.ToString(), route.ToString(), user.ToString(), status.ToString(), isLocation.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateCustomer", id.ToString(), arr);
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
            Response.Redirect("ListCustomer.aspx");
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }
    }
}