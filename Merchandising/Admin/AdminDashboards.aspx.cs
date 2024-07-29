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
    public partial class AdminDashboards : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lnkToday.Attributes.Add("Style", "background-color:#dae9f8; color:#60acf9");
                lnkMonth.Attributes.Remove("Style");
                lnkYear.Attributes.Remove("Style");
                rdFromDate.SelectedDate = DateTime.Now;
                rdEndDate.SelectedDate = DateTime.Now;
                Route();
                Data();
            }
        }

        public void Route()
        {
            ddlRoute.DataSource = ObjclsFrms.loadList("SelectRoute", "sp_Dashboard");
            ddlRoute.DataTextField = "rot_Name";
            ddlRoute.DataValueField = "rot_ID";
            ddlRoute.DataBind();
            //ddlSite.SelectedIndex = 0;
            if (Session["Route"] != null)
            {
                string ids = Session["Route"].ToString();
                string[] words = ids.Split(',');

                foreach (var word in words)
                {
                    foreach (RadComboBoxItem rd in ddlRoute.Items)
                    {
                        if (rd.Value.Equals(word))
                        {
                            rd.Checked = true;
                        }
                    }
                }
            }
            else
            {
                int j = 1;
                foreach (RadComboBoxItem itmss in ddlRoute.Items)
                {
                    itmss.Checked = true;
                    j++;
                }
            }
        }

        public string Rot()
        {
            var ColelctionMarket = ddlRoute.CheckedItems;
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

        public string mainConditions(string rotID)
        {
            Session["Route"] = rotID;
            string dateCondition = "";
            string mainCondition = " dph_rot_ID in (" + rotID + ")";
            try
            {
                string fromDate = DateTime.Parse(rdFromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
                string endDate = DateTime.Parse(rdEndDate.SelectedDate.ToString()).ToString("yyyyMMdd");
                Session["FromDate"] = rdFromDate.SelectedDate.ToString();
                Session["ToDate"] = rdEndDate.SelectedDate.ToString();
                dateCondition = " and (cast(dph_Date as date) between cast('" + fromDate + "' as date) and cast('" + endDate + "' as date))";
            }
            catch (Exception ex)
            {

            }
            mainCondition += dateCondition;

            return mainCondition;
        }

        public void Data()
        {
            string rotID = Rot();
            if (!rotID.Equals("0"))
            {
                string mainCondition = mainConditions(rotID);
                Session["DashboardCondition"] = mainCondition.ToString();
                DataTable dtTotal = ObjclsFrms.loadList("TotalVisitCount", "sp_Dashboard", mainCondition);

                if (dtTotal.Rows.Count > 0)
                {
                    string totalVisits = dtTotal.Rows[0]["number"].ToString();
                    lblTotalVisits.Text = totalVisits.ToString();
                }
                DataTable dtScheduled = ObjclsFrms.loadList("TotalScheduledVisitCount", "sp_Dashboard", mainCondition);
                if (dtScheduled.Rows.Count > 0)
                {
                    string scheduledVisits = dtScheduled.Rows[0]["number"].ToString();
                    lblTotalScheduledVisits.Text = scheduledVisits.ToString();
                }
                DataTable dtUnscheduled = ObjclsFrms.loadList("TotalUnScheduledVisitCount", "sp_Dashboard", mainCondition);
                if (dtUnscheduled.Rows.Count > 0)
                {
                    string unscheduledVisits = dtUnscheduled.Rows[0]["number"].ToString();
                    lblTotalUnscheduledVisits.Text = unscheduledVisits.ToString();
                }
                DataTable dtItemNotAvailability = ObjclsFrms.loadList("SelectItemAvailabilityCount", "sp_Dashboard", mainCondition);
                if (dtItemNotAvailability.Rows.Count > 0)
                {
                    string itemsNotAvailable = dtItemNotAvailability.Rows[0]["number"].ToString();
                    lblNotAvailableItems.Text = itemsNotAvailable.ToString();
                }
                DataTable dtCusNotAvailability = ObjclsFrms.loadList("SelectCustomerAvailabilityCount", "sp_Dashboard", mainCondition);
                if (dtCusNotAvailability.Rows.Count > 0)
                {
                    string customerNotAvailable = dtCusNotAvailability.Rows[0]["number"].ToString();
                    lblNotAvailableCustomers.Text = customerNotAvailable.ToString();
                }
                DataTable dtSurvey = ObjclsFrms.loadList("SelectSurveysCount", "sp_Dashboard", mainCondition);
                if (dtSurvey.Rows.Count > 0)
                {
                    string survey = dtSurvey.Rows[0]["number"].ToString();
                    lblSurvey.Text = survey.ToString();
                }
                DataTable dtComplaints = ObjclsFrms.loadList("SelectComplaintsCount", "sp_Dashboard", mainCondition);
                if (dtComplaints.Rows.Count > 0)
                {
                    string complaints = dtComplaints.Rows[0]["number"].ToString();
                    lblComplaints.Text = complaints.ToString();
                }
            }
            else
            {
                return;
            }
        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            lnkToday.Attributes.Remove("Style");
            lnkMonth.Attributes.Remove("Style");
            lnkYear.Attributes.Remove("Style");
            Data();
        }

        protected void lnkToday_Click(object sender, EventArgs e)
        {
            lnkToday.Attributes.Add("Style", "background-color:#dae9f8; color:#60acf9");
            lnkMonth.Attributes.Remove("Style");
            lnkYear.Attributes.Remove("Style");
            rdFromDate.SelectedDate = DateTime.Now;
            rdEndDate.SelectedDate = DateTime.Now;
            Data();
        }

        protected void lnkMonth_Click(object sender, EventArgs e)
        {
            lnkToday.Attributes.Remove("Style");
            lnkMonth.Attributes.Add("Style", "background-color:#dae9f8; color:#60acf9");
            lnkYear.Attributes.Remove("Style");
            rdFromDate.SelectedDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            rdEndDate.SelectedDate = DateTime.Now;
            Data();
        }

        protected void lnkYear_Click(object sender, EventArgs e)
        {
            lnkToday.Attributes.Remove("Style");
            lnkMonth.Attributes.Remove("Style");
            lnkYear.Attributes.Add("Style", "background-color:#dae9f8; color:#60acf9");
            rdFromDate.SelectedDate = new DateTime(DateTime.Now.Year, 1, 1);
            rdEndDate.SelectedDate = DateTime.Now;
            Data();
        }

        protected void lnkTotalVisits_Click(object sender, EventArgs e)
        {
            string type = "B";
            Session["CustomerVisitType"] = type.ToString();
            Response.Redirect("ListCustomerVisit.aspx?mode=1");
        }

        protected void lnkScheduledVisits_Click(object sender, EventArgs e)
        {
            string type = "S";
            Session["CustomerVisitType"] = type.ToString();
            Response.Redirect("ListCustomerVisit.aspx?mode=1");
        }

        protected void lnkUnscheduledVisits_Click(object sender, EventArgs e)
        {
            string type = "U";
            Session["CustomerVisitType"] = type.ToString();
            Response.Redirect("ListCustomerVisit.aspx?mode=1");
        }

        protected void lnkSurvey_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListSurveyHeader.aspx?mode=1");
        }

        protected void lnkComplaints_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListProductComplaints.aspx?mode=1");
        }

        //protected void lnkAvailCustomers_Click(object sender, EventArgs e)
        //{

        //}

        protected void lnkNotAvailCustomers_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerNotAvailable.aspx");
        }

        //protected void lnkAvailItems_Click(object sender, EventArgs e)
        //{

        //}

        protected void lnkNotAvailItems_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemNotAvailable.aspx");
        }
    }
}