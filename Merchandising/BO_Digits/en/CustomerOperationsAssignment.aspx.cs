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
    public partial class CustomerOperationsAssignment : System.Web.UI.Page
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
                Operations();
            }
        }
        public void Operations()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectCustomerOperationName", "sp_Masters", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                string name = lstUser.Rows[0]["cuo_Name"].ToString();
                ltrlOperatiion.Text = name.ToString();
            }
        }

        public void ListData()
        {
            DataTable lstUser = default(DataTable);
            
           
            lstUser = ObjclsFrms.loadList("SelectAllCustomer", "sp_Masters", ResponseID.ToString());
            //if (lstUser.Rows.Count > 0)
            //{
                grvRpt.DataSource = lstUser;
            //}
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
            ListData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Add"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cus_ID").ToString();
                string[] arr = { ID.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertCustomerRoute", ResponseID.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
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
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("rcs_ID").ToString();
                DataTable lstClaims = ObjclsFrms.loadList("DeleteCustomerRoute", "sp_Masters", ID.ToString());
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }
}