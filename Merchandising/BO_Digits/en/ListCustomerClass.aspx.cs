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
    public partial class ListCustomerClass : System.Web.UI.Page
    {
        GeneralFunctions obj = new GeneralFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void List()
        {
            DataTable lstdata = obj.loadList("SelCustomerClass", "sp_Masters");
            if (lstdata.Rows.Count > 0)
            {
                grvRpt.DataSource = lstdata;
            }
        }
        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditCustomerClass.aspx");

        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            List();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cls_ID").ToString();
                Response.Redirect("AddEditCustomerClass.aspx?Id=" + ID);
            }
        }
    }
}