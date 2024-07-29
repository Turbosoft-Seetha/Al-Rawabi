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
    public partial class ListOpportunities : System.Web.UI.Page
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
                lstUser = ObjclsFrms.loadList("SelectOpportunities", "sp_Masters");
                if (lstUser.Rows.Count >= 0)
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
            if (e.CommandName.Equals("Documents"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("opt_ID").ToString();
                Response.Redirect("ListDocuments.aspx?Id=" + ID);
            }
        }
    }
}