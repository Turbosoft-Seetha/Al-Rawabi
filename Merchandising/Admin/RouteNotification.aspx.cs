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
    public partial class RouteNotification : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void LoadList()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("ListRouteNotifications", "sp_Notifications");
            grvRpt.DataSource = lstUser;
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            //if (e.CommandName.Equals("Edit"))
            //{
            //    GridDataItem dataItem = e.Item as GridDataItem;
            //    string ID = dataItem.GetDataKeyValue("rnt_ID").ToString();
            //    Response.Redirect("AddEditRouteNotification.aspx?Id=" + ID);
            //}

            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("rnt_ID").ToString();
                ViewState["delID"] = ID.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
            }
        }

        protected void lnkSubCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditRouteNotification.aspx?Id=0");
        }
        protected void btnOK_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {

            string id = ViewState["delID"].ToString();
            GeneralFunctions.loadList_Static("DeleteRouteNotification", "sp_Notifications", id);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);

        }
    }
}