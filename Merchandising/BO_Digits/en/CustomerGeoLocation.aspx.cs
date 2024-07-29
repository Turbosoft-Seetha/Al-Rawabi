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
    public partial class CustomerGeoLocation : System.Web.UI.Page
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
                string routeCondition = " rcs_rot_ID in (" + rotID + ")";
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
            rdCustomer.DataSource = ObjclsFrms.loadList("SelectCustomerGeoLocDropdown", "sp_Masters", routeCondition);
            rdCustomer.DataTextField = "cus_Name";
            rdCustomer.DataValueField = "cus_ID";
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
            string mainCondition = " dph_rot_ID in (" + rotID + ")";
            try
            {
                string fromDate = DateTime.Parse(rdFromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
                string endDate = DateTime.Parse(rdEndDate.SelectedDate.ToString()).ToString("yyyyMMdd");
                dateCondition = " and (cast(A.CreatedDate as date) between cast('" + fromDate + "' as date) and cast('" + endDate + "' as date)) and A.Status='N' ";
                //string CusID = rdCustomer.SelectedValue.ToString();
                if (CusID.Equals("0"))
                {
                    customerCondition = "";
                }
                else
                {
                    customerCondition = " and cgl_cus_ID in (" + CusID + ")";
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
                DataTable lstData = ObjclsFrms.loadList("SelectCustomerGeoLoc", "sp_Masters", mainCondition);
                grvRpt.DataSource = lstData;
                ViewState["dt"] = lstData;
            }
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("GeoLoc"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cgl_ID").ToString();
                string cusID = dataItem["cus_ID"].Text.ToString();
                string geoCode = dataItem["cgl_CusGeoLoc"].Text.ToString();
                ViewState["ID"] = ID.ToString();
                ViewState["cusID"] = cusID.ToString();
                ViewState["GeoLoc"] = geoCode.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confirm();</script>", false);
            }
            if (e.CommandName.Equals("Map"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string geoCode = dataItem["cgl_CusGeoLoc"].Text.ToString();
                string map = "http://maps.google.com?q=" + geoCode.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Open", "window.open('" + map + "');", true);

            }
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "CustomerGeoLocation.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }
        public void Save()
        {
            string id = ViewState["ID"].ToString();
            string cusId = ViewState["cusID"].ToString();
            string geoLoc = ViewState["GeoLoc"].ToString();
            string[] arr = { geoLoc.ToString(), id.ToString() };
            string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateCustomerGeoLocation", cusId.ToString(), arr);
            int res = Int32.Parse(Value.ToString());
            if (res > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
            }
        }
        protected void btnOK_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void rdRoute_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string rotID = Rot();
            string routeCondition = " rcs_rot_ID in (" + rotID + ")";
            Customers(routeCondition);
        }

        protected void lnkfilter_Click(object sender, EventArgs e)
        {
            ListData();
            grvRpt.Rebind();
        }
    }
}