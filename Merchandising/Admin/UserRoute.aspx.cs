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
    public partial class UserRoute : System.Web.UI.Page
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
                ListRoute();
            }
        }

        public void ListRoute()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectRouteName", "sp_Masters", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                string name = lstUser.Rows[0]["rot_Name"].ToString();
                ltrlRoute.Text = name.ToString();
            }
        }

        public void ListData()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectAllUser", "sp_Masters", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                grvRpt.DataSource = lstUser;
            }
        }
        public void ListDatas()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectUserRoute", "sp_Masters", ResponseID.ToString());
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
                string ID = dataItem.GetDataKeyValue("usr_ID").ToString();
                string[] arr = { ID.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertUserRoute", ResponseID.ToString(), arr);
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
                string ID = dataItem.GetDataKeyValue("uir_ID").ToString();
                DataTable lstClaims = ObjclsFrms.loadList("DeleteUserRoute", "sp_Masters", ID.ToString());
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }
}