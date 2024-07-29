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
    public partial class ListProducts : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Category();
            }
        }
        public void Category()
        {
            DataTable dt = ObjclsFrms.loadList("SelectCategoryForProducts", "sp_Masters_Temp");
            ddlCateory.DataSource = dt;
            ddlCateory.DataTextField = "cat_Name";
            ddlCateory.DataValueField = "cat_ID";
            ddlCateory.DataBind();
            int i = 1;
            foreach (RadComboBoxItem itms in ddlCateory.Items)
            {
                itms.Checked = true;
                i++;
            }
        }

        public string Cat()
        {
            var ColelctionMarketss = ddlCateory.CheckedItems;
            string catID = "";
            int j = 0;
            int MarCount = ColelctionMarketss.Count;
            if (ColelctionMarketss.Count > 0)
            {
                foreach (var item in ColelctionMarketss)
                {
                    //where 1 = 1 
                    if (j == 0)
                    {
                        catID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        catID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        catID += item.Value;
                    }
                    j++;
                }
                return catID;
            }
            else
            {
                return "0";
            }
        }

        public void ListData(string Category)
        {
            string qry = "prd_cat_ID in (" + Category + ")";
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectProducts", "sp_Masters_Temp", qry.ToString());
            grvRpt.DataSource = lstUser;
        }
        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BO_Digits/en/AddProducts.aspx");
        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            string cats = Cat();
            ListData(cats);
            grvRpt.Rebind();
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string category = Cat();
            ListData(category);
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("prd_ID").ToString();
                Response.Redirect("AddEditProducts.aspx?Id=" + ID);
            }
        }
    }
}