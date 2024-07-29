using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.Admin
{
    public partial class ListCustomerTasks : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void LoadList()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("ListCustomerTask", "sp_CustomerTasks");
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
        }

        protected void lnkSubCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditCustomerTasks.aspx?Id=0");
        }
    }
}