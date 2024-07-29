using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Merchandising.Admin
{
    public partial class CustomerGeoLocation : System.Web.UI.Page
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
            DataTable lstData = ObjclsFrms.loadList("SelectCustomerGeoLoc", "sp_Masters");
            grvRpt.DataSource = lstData;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("GeoLoc"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cgl_ID").ToString();
                string cusID = dataItem["cus_ID"].Text.ToString();
                string geoCode = dataItem["cgl_CusGeoLoc"].Text.ToString();
                ViewState["ID"] = ID.ToString();
                ViewState["cusID"] = cusID.ToString();
                ViewState["GeoLoc"] = geoCode.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confirm();</script>", false);
            }
            if (e.CommandName.Equals("Map"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string geoCode = dataItem["cgl_CusGeoLoc"].Text.ToString();
                string map = "http://maps.google.com?q=" + geoCode.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Open", "window.open('" + map + "');", true);
              
            }
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
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "CustomerGeoLocation.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        public void Save()
        {
            string id = ViewState["ID"].ToString();
            string cusId = ViewState["cusID"].ToString();
            string geoLoc = ViewState["GeoLoc"].ToString();
            string[] arr = { geoLoc.ToString(), id.ToString() };
            string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateCustomerGeoLocation", cusId.ToString(), arr);
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
}