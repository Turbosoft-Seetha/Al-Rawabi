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
    public partial class ListCustomerVisitDetail : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        
        public int CustomerID
        {
            get
            {
                int CustomerID;
                int.TryParse(Request.Params["ID"], out CustomerID);
                return CustomerID;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HeaderData();
                DetailData();
            }
        }

        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelectCustomerVisitHeader", "sp_Transaction", CustomerID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblCustomer = (Label)rp.FindControl("lblCustomer");
                Label lblRoute = (Label)rp.FindControl("lblRoute");
                Label lblIsSchedule = (Label)rp.FindControl("lblIsSchedule");
                Label lblVisitStart = (Label)rp.FindControl("lblVisitStart");
                Label lblVisitEnd = (Label)rp.FindControl("lblVisitEnd");
                Label lblTransTime = (Label)rp.FindControl("lblTransTime");

                lblCustomer.Text = lstDatas.Rows[0]["cus_Name"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["rot_Name"].ToString();
                lblIsSchedule.Text = lstDatas.Rows[0]["ucp_IsScheduled"].ToString();
                lblVisitStart.Text = lstDatas.Rows[0]["VisitStart"].ToString();
                lblVisitEnd.Text = lstDatas.Rows[0]["VisitEnd"].ToString();
                lblTransTime.Text = lstDatas.Rows[0]["Duration"].ToString();
            }
        }

        public void DetailData()
        {
            string condition = CustomerID.ToString();

            DataTable lstDeliveryCheck = new DataTable();
            lstDeliveryCheck = ObjclsFrms.loadList("SelectDeliveryCheckCount", "sp_Transaction", condition.ToString());
            lblDeliveryCheck.Text = lstDeliveryCheck.Rows[0]["number"].ToString();

            DataTable lstOutOfStock = new DataTable();
            lstOutOfStock = ObjclsFrms.loadList("SelectOutOfSockCount", "sp_Transaction", condition.ToString());
            lblOutOfStock.Text = lstOutOfStock.Rows[0]["number"].ToString();

            DataTable lstItemAvailability = new DataTable();
            lstItemAvailability = ObjclsFrms.loadList("SelectItemAvailabilityCount", "sp_Transaction", condition.ToString());
            lblItemAvailability.Text = lstItemAvailability.Rows[0]["number"].ToString();

            DataTable lstItemPricing = new DataTable();
            lstItemPricing = ObjclsFrms.loadList("SelectItemPricingCount", "sp_Transaction", condition.ToString());
            lblItemPricing.Text = lstItemPricing.Rows[0]["number"].ToString();

            DataTable lstInventory = new DataTable();
            lstInventory = ObjclsFrms.loadList("SelectInventoryCount", "sp_Transaction", condition.ToString());
            lblInventory.Text = lstInventory.Rows[0]["number"].ToString();

            DataTable lstComplaints = new DataTable();
            lstComplaints = ObjclsFrms.loadList("SelectComplaintsCount", "sp_Transaction", condition.ToString());
            lblComplaints.Text = lstComplaints.Rows[0]["number"].ToString();

            DataTable lstSurvey = new DataTable();
            lstSurvey = ObjclsFrms.loadList("SelectSurveysCount", "sp_Transaction", condition.ToString());
            lblSurvey.Text = lstSurvey.Rows[0]["number"].ToString();

            DataTable lstAssetTracking = new DataTable();
            lstAssetTracking = ObjclsFrms.loadList("SelectAssetTrackingCount", "sp_Transaction", condition.ToString());
            lblAssetTracking.Text = lstAssetTracking.Rows[0]["number"].ToString();

            DataTable lstCompetiorActivity = new DataTable();
            lstCompetiorActivity = ObjclsFrms.loadList("SelectCompetitorActivitiesCount", "sp_Transaction", condition.ToString());
            lblCompetitor.Text = lstCompetiorActivity.Rows[0]["number"].ToString();

            DataTable lstDisplayAgreement = new DataTable();
            lstDisplayAgreement = ObjclsFrms.loadList("SelectDisplayAgreementsCount", "sp_Transaction", condition.ToString());
            lblDisplayAgreement.Text = lstDisplayAgreement.Rows[0]["number"].ToString();

            DataTable lstTask = new DataTable();
            lstTask = ObjclsFrms.loadList("SelectTaskCount", "sp_Transaction", condition.ToString());
            lblTasks.Text = lstTask.Rows[0]["number"].ToString();

            DataTable lstImageCapture = new DataTable();
            lstImageCapture = ObjclsFrms.loadList("SelectImageCaptureCount", "sp_Transaction", condition.ToString());
            lblImageCapture.Text = lstImageCapture.Rows[0]["number"].ToString();
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/ListCustomerVisit.aspx");
        }

    }
}