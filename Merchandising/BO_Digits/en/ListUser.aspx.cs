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
    public partial class ListUser : System.Web.UI.Page
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
            DataTable lstDivision = ObjclsFrms.loadList("MutipleUserDivisionForUsers", "sp_Masters", UICommon.GetCurrentUserID().ToString());
            if (lstDivision.Rows.Count > 0)
            {
                string divID = lstDivision.Rows[0]["usd_sdv_ID"].ToString();
                string qry = "usr_sdv_ID in (" + divID + ")";
                DataTable lstUser = default(DataTable);
                lstUser = ObjclsFrms.loadList("SelectUsers", "sp_Masters");
                if (lstUser.Rows.Count > 0)
                {
                    grvRpt.DataSource = lstUser;
                }
            }
        }
        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BO_Digits/en/AddEditUsers.aspx");
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
                string ID = dataItem.GetDataKeyValue("usr_ID").ToString();
                Response.Redirect("AddEditUsers.aspx?Id=" + ID);
            }
        }
    }
}