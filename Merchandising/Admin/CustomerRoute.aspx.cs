using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Merchandising.Admin
{
    public partial class CustomerRoute : System.Web.UI.Page
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
                ListRoute();
                ListCustomer();
            }
        }

        public void ListRoute()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectRouteName", "sp_Masters", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                string name = lstUser.Rows[0]["rot_Name"].ToString();
                ltrlRoute.Text = "Route Name : "+name.ToString();
            }
        }
        public void ListCustomer()
        {
            DataTable lstCust = default(DataTable);
            lstCust = ObjclsFrms.loadList("SelectCustomerHeader", "sp_Masters");
            ddlCust.DataSource = lstCust;
            ddlCust.DataTextField = "name";
            ddlCust.DataValueField = "id";
            ddlCust.DataBind();

            if(ViewState["customerID"] == null)
            {

            }
            else
            {
                ddlCust.SelectedValue = ViewState["customerID"].ToString();
            }
        }
        public void ListData(string customerID)
        {
            string[] arr = { customerID.ToString() };
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectAllCustomer", "sp_Masters", ResponseID.ToString(), arr);
            if (lstUser.Rows.Count > 0)
            {
                grvRpt.DataSource = lstUser;
            }
        }
        public void ListDatas()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectCustomerRoute", "sp_Masters", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                RadGrid1.DataSource = lstUser;
            }
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string customerID;
            if (ViewState["customerID"] == null)
            {
                customerID = "";
            }
            else
            {
                customerID = ViewState["customerID"].ToString();
            }
            ListData(customerID);
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Add"))
            {
                string cusID = ViewState["customerID"].ToString();
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cus_ID").ToString();
                string[] arr = { ID.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertCustomerRoute", ResponseID.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                //if (res > 0)
                //{
                //    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                //}
                ListData(cusID);
                ListDatas();
                grvRpt.Rebind();
                RadGrid1.Rebind();
            }
        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListDatas();
        }

        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Remove"))
            {
                string cusID;
                if (ViewState["customerID"] == null)
                {
                    cusID = "0";
                }
                else
                {
                    cusID = ViewState["customerID"].ToString();
                }
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("rcs_ID").ToString();
                DataTable lstClaims = ObjclsFrms.loadList("DeleteCustomerRoute", "sp_Masters", ID.ToString());
                //Page.Response.Redirect(Page.Request.Url.ToString(), true);
                ListData(cusID);
                ListDatas();
                grvRpt.Rebind();
                RadGrid1.Rebind();
            }
        }

        protected void ddlCust_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string cusID = ddlCust.SelectedValue.ToString();
            ViewState["customerID"] = cusID.ToString();
            ListData(cusID);
            ListDatas();
            grvRpt.Rebind();
            RadGrid1.Rebind();
        }

        protected void lnkAdds_Click(object sender, EventArgs e)
        {
            int addCount = Int32.Parse(grvRpt.SelectedItems.Count.ToString());
            if (addCount == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
            }
            else
            {
                foreach (GridDataItem item in grvRpt.SelectedItems)
                {
                    try
                    {
                        string ID = item.GetDataKeyValue("cus_ID").ToString();
                        string[] arr = { ID.ToString() };
                        string Value = ObjclsFrms.SaveData("sp_Masters", "InsertCustomerRoute", ResponseID.ToString(), arr);
                        int res = Int32.Parse(Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                        ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "CustomerRoute.aspx Delete()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>ErrorModal();</script>", false);
                    }
                }
                string cusID;
                if (ViewState["customerID"] == null)
                {
                    cusID = "0";
                }
                else
                {
                    cusID = ViewState["customerID"].ToString();
                }
                ListData(cusID);
                ListDatas();
                grvRpt.Rebind();
                RadGrid1.Rebind();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>SuccessModal();</script>", false);
            }
        }

        protected void lnkRemoves_Click(object sender, EventArgs e)
        {
            int removeCount = Int32.Parse(RadGrid1.SelectedItems.Count.ToString());
            if (removeCount == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
            }
            else
            {
                foreach (GridDataItem item in RadGrid1.SelectedItems)
                {
                    try
                    {
                        string ID = item.GetDataKeyValue("rcs_ID").ToString();
                        DataTable lstClaims = ObjclsFrms.loadList("DeleteCustomerRoute", "sp_Masters", ID.ToString());
                    }
                    catch (Exception ex)
                    {
                        String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                        ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "CustomerRoute.aspx Delete()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>ErrorModal();</script>", false);
                    }
                }

                string cusID;
                if (ViewState["customerID"] == null)
                {
                    cusID = "0";
                }
                else
                {
                    cusID = ViewState["customerID"].ToString();
                }
                ListData(cusID);
                ListDatas();
                grvRpt.Rebind();
                RadGrid1.Rebind();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>SuccessModal();</script>", false);
            }
        }
    }
}