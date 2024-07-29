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
    public partial class ListOpportunities : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Route();
                int j = 1;
                foreach (RadComboBoxItem itmss in rdRoute.Items)
                {
                    itmss.Checked = true;
                    j++;
                }

                string rotID = Rot();
                string routeCondition = " opt_rot_ID in (" + rotID + ")";
                rdFromDate.SelectedDate = DateTime.Parse(DateTime.Now.ToString("MMM-yyyy"));
                rdEndDate.SelectedDate = DateTime.Now;
                Customers(routeCondition);
                CustomerFilter();
            }
        }

        public string Rot()
        {
            var ColelctionMarket = rdRoute.CheckedItems;
            string rotID = "";
            int j = 0;
            int MarCount = ColelctionMarket.Count;
            if (ColelctionMarket.Count > 0)
            {
                foreach (var item in ColelctionMarket)
                {
                    //where 1 = 1 
                    if (j == 0)
                    {
                        rotID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        rotID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        rotID += item.Value;
                    }
                    j++;
                }
                return rotID;
            }
            else
            {
                return "0";
            }
        }

        public void Route()
        {
            rdRoute.DataSource = ObjclsFrms.loadList("SelectRouteforTransaction", "sp_Masters", UICommon.GetCurrentUserID().ToString());
            rdRoute.DataTextField = "rot_Name";
            rdRoute.DataValueField = "rot_ID";
            rdRoute.DataBind();
        }
        public void Customers(string routeCondition)
        {
            rdCustomer.DataSource = ObjclsFrms.loadList("SelectOppDropdown", "sp_Masters", routeCondition);
            rdCustomer.DataTextField = "opt_cus_Name";
            rdCustomer.DataValueField = "opt_ID";
            rdCustomer.DataBind();
        }
        public void CustomerFilter()
        {
            int k = 1;
            foreach (RadComboBoxItem itme in rdCustomer.Items)
            {
                itme.Checked = true;
                k++;
            }
        }
        public string Cus()
        {
            var ColelctionMarkets = rdCustomer.CheckedItems;
            string cusID = "";
            int k = 0;
            int MarCounts = ColelctionMarkets.Count;
            if (ColelctionMarkets.Count > 0)
            {
                foreach (var item in ColelctionMarkets)
                {
                    //where 1 = 1 
                    if (k == 0)
                    {
                        cusID += item.Value + ",";
                    }
                    else if (k > 0)
                    {
                        cusID += item.Value + ",";
                    }
                    if (k == (MarCounts - 1))
                    {
                        cusID += item.Value;
                    }
                    k++;
                }
                return cusID;
            }
            else
            {
                return "0";
            }
        }
        public string mainConditions(string rotID)
        {
            string CusID = Cus();
            string customerCondition = "";
            string dateCondition = "";
            string mainCondition = " opt_rot_ID in (" + rotID + ")";
            try
            {
                string fromDate = DateTime.Parse(rdFromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
                string endDate = DateTime.Parse(rdEndDate.SelectedDate.ToString()).ToString("yyyyMMdd");
                dateCondition = " and (cast(O.CreatedDate as date) between cast('" + fromDate + "' as date) and cast('" + endDate + "' as date))";
                //string CusID = rdCustomer.SelectedValue.ToString();
                if (CusID.Equals("0"))
                {
                    customerCondition = "";
                }
                else
                {
                    customerCondition = " and opt_ID in (" + CusID + ")";
                }


            }
            catch (Exception ex)
            {

            }
            mainCondition += dateCondition;
            mainCondition += customerCondition;
            return mainCondition;
        }

        public void ListData()
        {
            string rotID = Rot();
            if (!rotID.Equals("0"))
            {
                string mainCondition = "";
                mainCondition = mainConditions(rotID);
                DataTable lstUser = default(DataTable);
                lstUser = ObjclsFrms.loadList("SelectOpportunities", "sp_Masters", mainCondition);
                if (lstUser.Rows.Count > 0)
                {
                    grvRpt.DataSource = lstUser;
                }
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
                Response.Redirect("ListOppDocuments.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Map"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string geoCode = dataItem["opt_cus_GeoLoc"].Text.ToString();
                string map = "http://maps.google.com?q=" + geoCode.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Open", "window.open('" + map + "');", true);

            }
        }

        protected void rdRoute_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string rotID = Rot();
            string routeCondition = " opt_rot_ID in (" + rotID + ")";
            Customers(routeCondition);
        }

        protected void lnkfilter_Click(object sender, EventArgs e)
        {
            ListData();
            grvRpt.Rebind();
        }
    }
}