using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;

namespace Merchandising.BO_Digits.en
{
    public partial class ListSubcategory : System.Web.UI.Page
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
            DataTable lstData = ObjclsFrms.loadList("SelectSubCategory", "sp_Masters");
            grvRpt.DataSource = lstData;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditSubcategory.aspx?Id=0");
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("sct_ID").ToString();
                Response.Redirect("AddEditSubcategory.aspx?Id=" + ID);
            }
        }
    }
}