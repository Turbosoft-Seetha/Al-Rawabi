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
    public partial class ListCustomerOperations : System.Web.UI.Page
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
            lstUser = ObjclsFrms.loadList("SelectCustomerOperations", "sp_Masters");
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
                string ID = dataItem.GetDataKeyValue("cuo_ID").ToString();
                Response.Redirect("AddEditCustomerOperations.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Customer"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cuo_ID").ToString();
                Response.Redirect("CutomerOperationsAssignment.aspx?Id=" + ID);
            }
        }

        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AddEditCustomerOperations.aspx");
        }
    }
}