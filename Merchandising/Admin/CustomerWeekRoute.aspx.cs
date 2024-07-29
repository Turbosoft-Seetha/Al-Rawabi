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
    public partial class CustomerWeekRoute : System.Web.UI.Page
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
                Customer();
            }
        }

        public void ListRoute()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectRouteName", "sp_Masters", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                string name = lstUser.Rows[0]["rot_Name"].ToString();
                ltrlRoute.Text = "Route Name : " + name.ToString();
            }
        }

        public void ListData()
        {
            string mainCondition = mainConditions();
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelRouteWeekCus", "sp_WeekPlan", mainCondition.ToString());
            grvRpt.DataSource = lstUser;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
           ListData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edits"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cwr_ID").ToString();
                Response.Redirect("AddCusWeekRoute.aspx?Id=" + ID + "&&DId=" + ResponseID.ToString());
            }
        }

        public void Customer()
        {
            DataTable dtc = ObjclsFrms.loadList("SelectCustomerForDropDown", "sp_Masters", ResponseID.ToString());
            ddlCustomer.DataSource = dtc;
            ddlCustomer.DataTextField = "cus_Name";
            ddlCustomer.DataValueField = "cus_ID";
            ddlCustomer.DataBind();
            int j = 1;
            foreach (RadComboBoxItem itmss in ddlCustomer.Items)
            {
                itmss.Checked = true;
                j++;
            }
        }
        public string Cus()
        {
            var ColelctionMarket = ddlCustomer.CheckedItems;
            string cusID = "";
            int j = 0;
            int MarCount = ColelctionMarket.Count;
            if (ColelctionMarket.Count > 0)
            {
                foreach (var item in ColelctionMarket)
                {
                    //where 1 = 1 
                    if (j == 0)
                    {
                        cusID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        cusID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        cusID += item.Value;
                    }
                    j++;
                }
                return cusID;
            }
            else
            {
                return "0";
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ListData();
            grvRpt.Rebind();
        }
        
        public string mainConditions()
        {
            string cusID = Cus();
            string week = ddlWeek.SelectedValue.ToString();
            string mainCondition = "cwr_rot_ID  = " + ResponseID.ToString() + " and cwr_cus_ID in (" + cusID + ") and csw_WeekSeq = (case when '" + week + "' = '' then csw_WeekSeq else '" + week + "' end)";
            return mainCondition;
        }
    }
}