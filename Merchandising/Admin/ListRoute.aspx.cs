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
    public partial class ListRoute : System.Web.UI.Page
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
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectRoute", "sp_Masters");
            if (lstUser.Rows.Count > 0)
            {
                grvRpt.DataSource = lstUser;
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
                string ID = dataItem.GetDataKeyValue("rot_ID").ToString();
                Response.Redirect("AddEditRoute.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Device"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("rot_ID").ToString();
                Response.Redirect("DeviceRoute.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("User"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("rot_ID").ToString();
                Response.Redirect("UserRoute.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Customer"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("rot_ID").ToString();
                Response.Redirect("ListCustomerRoute.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("CWS"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("rot_ID").ToString();
                Response.Redirect("CustomerWeekRoute.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("ProAssigned"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("rot_ID").ToString();
                Response.Redirect("ListRouteProduct.aspx?Id=" + ID);
            }

        }

        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AddEditRoute.aspx");
        }
    }
}