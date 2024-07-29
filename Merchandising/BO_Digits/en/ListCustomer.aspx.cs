using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Merchandising.BO_Digits.en
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
                Response.Redirect("ListAssetMaster.aspx?CId=" + ID);
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
            if (e.CommandName.Equals("Map"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string geoCode = dataItem["cus_GeoLoc"].Text.ToString();
                string map = "http://maps.google.com?q=" + geoCode.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Open", "window.open('" + map + "');", true);

            }
        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditCustomer.aspx?Id=0");
        }
    }
}