using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Merchandising.Admin
{
    public partial class ListCustomer : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }
        }
        public void ListData()
        {
            DataTable lstDivision = ObjclsFrms.loadList("MutipleUserDivisionForUsers", "sp_Masters", UICommon.GetCurrentUserID().ToString());
            if (lstDivision.Rows.Count > 0)
            {
                string divID = lstDivision.Rows[0]["usd_sdv_ID"].ToString();
                string qry = "csh_sdv_ID in (" + divID + ")";
                DataTable lstUser = default(DataTable);
                lstUser = ObjclsFrms.loadList("SelectCustomer", "sp_Masters", qry.ToString());
                if (lstUser.Rows.Count > 0)
                {
                    grvRpt.DataSource = lstUser;
                }
            }
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cus_ID").ToString();
                Response.Redirect("AddEditCustomer.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Products"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cus_ID").ToString();
                Response.Redirect("CustomerProductMapping.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Cooler"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cus_ID").ToString();
                Response.Redirect("ListCoolerMaster.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("GeoLoc"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cus_ID").ToString();
                ViewState["ID"] = ID.ToString();
                txtGeoLocation.Text = "";
                DataTable lstDatas = ObjclsFrms.loadList("SelectCustomerByID", "sp_Masters", ID.ToString());
                if (lstDatas.Rows.Count > 0)
                {
                    string gelocs = lstDatas.Rows[0]["cus_GeoLoc"].ToString();
                    txtGeoLocation.Text = gelocs.ToString();
                }
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confirm();</script>", false);
            }
            if (e.CommandName.Equals("Survey"))
            {
                ViewState["IDs"] = null;
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cus_ID").ToString();
                //ViewState["IDs"] = ID.ToString();
                //LoadSurvey();
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Survey();</script>", false);
                Response.Redirect("ListCustomerAssignedSurvey.aspx?Id=" + ID);
            }
        }

        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AddEditCustomer.aspx");
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            
            try
            {
                Save();
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "ListCustomer.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }

        public void Save()
        {
            string id = ViewState["ID"].ToString();
            string loc = txtGeoLocation.Text.ToString();
            string[] arr = { loc.ToString() };
            string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateCustomerGeoLocation", id.ToString(), arr);
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

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        public void LoadSurvey()
        {
            ltTable.Text = "";
            string Id = ViewState["IDs"].ToString();
            DataTable lstDatas = default(DataTable);
            lstDatas = ObjclsFrms.loadList("SelectCustomerAssignedSurvey", "sp_Masters", Id.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                //Table start.
                sb.Append("<table cellpadding='8' cellspacing='0' style='border: 1px solid #ccc;font-size: 9pt;font-family:Arial;width:100%'>");

                //Adding HeaderRow.
                sb.Append("<tr>");
                sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>Route</th>");
                sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>Assigned Survey</th>");
                sb.Append("</tr>");


                //Adding DataRow.
                for (int i = 0; i < lstDatas.Rows.Count; i++)
                {
                    string route, survey;
                    route = lstDatas.Rows[i]["rot_Name"].ToString();
                    survey = lstDatas.Rows[i]["srm_Name"].ToString();
                    sb.Append("<tr>");
                    sb.AppendFormat("<td style='width:100px;border: 1px solid #ccc'>{0}</td>", route.ToString());
                    sb.AppendFormat("<td style='width:100px;border: 1px solid #ccc'>{0}</td>", survey.ToString());
                    sb.Append("</tr>");
                }

                //Table end.
                sb.Append("</table>");
                ltTable.Text = sb.ToString();
            }
            else
            {
                ltTable.Text = "No survey configured.";
            }
        }
    }
}