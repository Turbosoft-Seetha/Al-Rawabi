﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Merchandising.BO_Digits.en
{
    public partial class ListSpecialPrice : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }
        public void LoadList()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("ListPriceListHeader", "sp_Transaction");
            grvRpt.DataSource = lstUser;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("prh_ID").ToString();
                Response.Redirect("AddEditSpecialPrice.aspx?Id=" + ID);
            }

            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("prh_ID").ToString();
                Response.Redirect("ListSpecialPriceDetail.aspx?Id=" + ID);
            }
        }

        protected void lnkSubCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditSpecialPrice.aspx?Id=0");
        }
    }
}