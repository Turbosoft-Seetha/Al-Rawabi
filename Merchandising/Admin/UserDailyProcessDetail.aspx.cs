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
    public partial class UserDailyProcessDetail : System.Web.UI.Page
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
                HeaderData();
                Counts();
            }
        }

        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelectDailyProcessReportHeader", "sp_Report", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblUser = (Label)rp.FindControl("lblUser");
                Label lblRoute = (Label)rp.FindControl("lblRoute");
                Label lblVersion = (Label)rp.FindControl("lblVersion");
                Label lblStartTime = (Label)rp.FindControl("lblStartTime");
                Label lblEndTime = (Label)rp.FindControl("lblEndTime");

                lblUser.Text = lstDatas.Rows[0]["usr_Name"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["rot_Name"].ToString();
                lblVersion.Text = lstDatas.Rows[0]["dph_VersionNumber"].ToString();
                lblStartTime.Text = lstDatas.Rows[0]["dph_StartDayTime"].ToString();
                lblEndTime.Text = lstDatas.Rows[0]["dph_EndDayTime"].ToString();
            }
        }

        public void LoadList()
        {
            string cusID = CusID();
            string[] arr = { cusID };
            string condition = " ucp_dph_ID = " + ResponseID.ToString() + " and ucp_cus_ID in (" + cusID + ")";
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectCustomerVisitReport", "sp_Report", condition);
            grvRpt.DataSource = lstUser;
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reports.aspx");
        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            LoadList();
            Counts();
            grvRpt.Rebind();
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("ucp_ID").ToString();
                Response.Redirect("CustomerVisitDetail.aspx?Id=" + ID + "&DId="+ ResponseID.ToString());
            }
        }

        public void Customer()
        {
            ddlCustomer.DataSource = ObjclsFrms.loadList("SelectCustomerFromDrop", "sp_Report", ResponseID.ToString());
            ddlCustomer.DataTextField = "name";
            ddlCustomer.DataValueField = "id";
            ddlCustomer.DataBind();
            //ddlSite.SelectedIndex = 0;
            int i = 1;
            foreach (RadComboBoxItem itms in ddlCustomer.Items)
            {
                itms.Checked = true;
            }
        }

        public string CusID()
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

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {

        }

        public void Counts()
        {
            try
            {
                string cusID = CusID();
                string deliveryCondition, outOfStock, itemAvailability, pricingCondition, inventoryCondition, complaintsCondition;
                string surveyCondition, trackingCondition, competiorCondition, agreementCondition, taskCondition, imageCapture;

                deliveryCondition = " dch_dph_ID = " + ResponseID.ToString() + " and dch_cus_ID in (" + cusID + ")";
                outOfStock = " osh_dph_ID = " + ResponseID.ToString() + " and osh_cus_ID in (" + cusID + ")";
                itemAvailability = " iah_dph_ID = " + ResponseID.ToString() + " and iah_cus_ID in (" + cusID + ")";
                pricingCondition = " crp_dph_ID = " + ResponseID.ToString() + " and crp_cus_ID in (" + cusID + ")";
                inventoryCondition = " inh_dph_ID = " + ResponseID.ToString() + " and inh_cus_ID in (" + cusID + ")";
                complaintsCondition = " psc_dph_ID = " + ResponseID.ToString() + " and psc_cus_ID in (" + cusID + ")";
                surveyCondition = " srh_dph_ID = " + ResponseID.ToString() + " and srh_cus_ID in (" + cusID + ")";
                trackingCondition = " cct_dph_ID = " + ResponseID.ToString() + " and cct_cus_ID in (" + cusID + ")";
                competiorCondition = " cma_dph_ID = " + ResponseID.ToString() + " and cma_cus_ID in (" + cusID + ")";
                agreementCondition = " dag_dph_ID = " + ResponseID.ToString() + " and dag_cus_ID in (" + cusID + ")";
                taskCondition = " cst_dph_ID = " + ResponseID.ToString() + " and cst_cus_ID in (" + cusID + ")";
                imageCapture = " mei_dph_ID = " + ResponseID.ToString() + " and mei_cus_ID in (" + cusID + ")";

                DataTable lstDeliveryCheck = new DataTable();
                lstDeliveryCheck = ObjclsFrms.loadList("SelectDeliveryCheckCount", "sp_Report", deliveryCondition.ToString());
                lblDeliveryCheck.Text = lstDeliveryCheck.Rows[0]["number"].ToString();

                DataTable lstOutOfStock = new DataTable();
                lstOutOfStock = ObjclsFrms.loadList("SelectOutOfSockCount", "sp_Report", outOfStock.ToString());
                lblOutOfStock.Text = lstOutOfStock.Rows[0]["number"].ToString();

                DataTable lstItemAvailability = new DataTable();
                lstItemAvailability = ObjclsFrms.loadList("SelectItemAvailabilityCount", "sp_Report", itemAvailability.ToString());
                lblItemAvailability.Text = lstItemAvailability.Rows[0]["number"].ToString();

                DataTable lstItemPricing = new DataTable();
                lstItemPricing = ObjclsFrms.loadList("SelectItemPricingCount", "sp_Report", pricingCondition.ToString());
                lblItemPricing.Text = lstItemPricing.Rows[0]["number"].ToString();

                DataTable lstInventory = new DataTable();
                lstInventory = ObjclsFrms.loadList("SelectInventoryCount", "sp_Report", inventoryCondition.ToString());
                lblInventory.Text = lstInventory.Rows[0]["number"].ToString();

                DataTable lstComplaints = new DataTable();
                lstComplaints = ObjclsFrms.loadList("SelectComplaintsCount", "sp_Report", complaintsCondition.ToString());
                lblComplaints.Text = lstComplaints.Rows[0]["number"].ToString();

                DataTable lstSurvey = new DataTable();
                lstSurvey = ObjclsFrms.loadList("SelectSurveysCount", "sp_Report", surveyCondition.ToString());
                lblSurvey.Text = lstSurvey.Rows[0]["number"].ToString();

                DataTable lstAssetTracking = new DataTable();
                lstAssetTracking = ObjclsFrms.loadList("SelectAssetTrackingCount", "sp_Report", trackingCondition.ToString());
                lblAssetTracking.Text = lstAssetTracking.Rows[0]["number"].ToString();

                DataTable lstCompetiorActivity = new DataTable();
                lstCompetiorActivity = ObjclsFrms.loadList("SelectCompetitorActivitiesCount", "sp_Report", competiorCondition.ToString());
                lblCompetitor.Text = lstCompetiorActivity.Rows[0]["number"].ToString();

                DataTable lstDisplayAgreement = new DataTable();
                lstDisplayAgreement = ObjclsFrms.loadList("SelectDisplayAgreementsCount", "sp_Report", agreementCondition.ToString());
                lblDisplayAgreement.Text = lstDisplayAgreement.Rows[0]["number"].ToString();

                DataTable lstTask = new DataTable();
                lstTask = ObjclsFrms.loadList("SelectTaskCount", "sp_Report", taskCondition.ToString());
                lblTasks.Text = lstTask.Rows[0]["number"].ToString();

                DataTable lstImageCapture = new DataTable();
                lstImageCapture = ObjclsFrms.loadList("SelectImageCaptureCount", "sp_Report", imageCapture.ToString());
                lblImageCapture.Text = lstImageCapture.Rows[0]["number"].ToString();
            }
            catch (Exception ex)
            {

            }
        }
        
        protected void lnkDeliveryCheck_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=Delivery");
        }

        protected void lnkItemPricing_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=Pricing");
        }

        protected void lnkInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=Inventory");
        }

        protected void lnkComplaints_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=Complaints");
        }

        protected void lnkSurvey_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=Survey");
        }

        protected void lnkAssetTracking_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=Tracking");
        }

        protected void lnkCompetitor_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=Competitor");
        }

        protected void lnkDisplayAgreement_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=Agreement");
        }

        protected void lnkTasks_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=Tasks");
        }

        protected void lnkOutOfStock_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=OutOfStock");
        }

        protected void lnkItemAvailability_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=ItemAvailability");
        }

        protected void lnkImageCapture_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?id=" + ResponseID.ToString() + "&&mode=ImageCapture");
        }
    }
}