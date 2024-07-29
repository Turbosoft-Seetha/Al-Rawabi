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
    public partial class CutomerProduct : System.Web.UI.Page
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
                Customer();
            }
        }

        //Adding and updating of customer product code

        //public void ListData()
        //{
        //    DataTable lstUser = default(DataTable);
        //    lstUser = ObjclsFrms.loadList("SelectAllProducts", "sp_Masters", ResponseID.ToString());
        //    if (lstUser.Rows.Count > 0)
        //    {
        //        grvRpt.DataSource = lstUser;
        //    }
        //}
        //public void ListDatas()
        //{
        //    DataTable lstUser = default(DataTable);
        //    lstUser = ObjclsFrms.loadList("SelectCustomerProduct", "sp_Masters", ResponseID.ToString());
        //    if (lstUser.Rows.Count > 0)
        //    {
        //        RadGrid1.DataSource = lstUser;
        //    }
        //}
        //protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        //{
        //    ListData();
        //}

        //protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        //{
        //    if (e.CommandName.Equals("Add"))
        //    {
        //        GridDataItem dataItem = e.Item as GridDataItem;
        //        string ID = dataItem.GetDataKeyValue("prd_ID").ToString();
        //        string[] arr = { ID.ToString() };
        //        string Value = ObjclsFrms.SaveData("sp_Masters", "InsertCustomerProduct", ResponseID.ToString(), arr);
        //        int res = Int32.Parse(Value.ToString());
        //        if (res > 0)
        //        {
        //            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        //        }
        //    }
        //}

        //protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        //{
        //    ListDatas();
        //}

        //protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        //{
        //    if (e.CommandName.Equals("Remove"))
        //    {
        //        GridDataItem dataItem = e.Item as GridDataItem;
        //        string ID = dataItem.GetDataKeyValue("cpr_ID").ToString();
        //        DataTable lstClaims = ObjclsFrms.loadList("DeleteCustomerProduct", "sp_Masters", ID.ToString());
        //        Page.Response.Redirect(Page.Request.Url.ToString(), true);
        //    }
        //}

        public void Customer()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectCustomerName", "sp_Masters", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                string name = lstUser.Rows[0]["cus_Name"].ToString();
                ltrlCustomer.Text = name.ToString();
            }
        }

        //Listing of customer product from client ERP


        protected void grvRpts_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            ListProducts();
        }

        public void ListProducts()
        {
            DataTable lstProducts = default(DataTable);
            lstProducts = ObjclsFrms.loadList("SelectCustomerProductFromERP", "sp_Masters", ResponseID.ToString());
            if (lstProducts.Rows.Count >= 0)
                grvRpts.DataSource = lstProducts;
        }
    }
}