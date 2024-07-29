using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Documents.SpreadsheetStreaming;
using Telerik.Web.UI;
using Telerik.Web.UI.HtmlChart;

namespace Merchandising.BO_Digits.en
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
                ViewState["id"] = 0;
                Session["CusStartExitId"] = null;
                Session["CusId"] = null;
                Customers();
                LoadRoute();
                HeaderData();
                CustomerVisitCount();
                Counts();
            }
        }

        public void Customers()
        {
            ddlCustomers.DataSource = ObjclsFrms.loadList("SelectCustomerFromDrop", "sp_UserDailyProcessDetail", ResponseID.ToString());
            ddlCustomers.DataTextField = "cus_Name";
            ddlCustomers.DataValueField = "cus_ID";
            ddlCustomers.DataBind();
            int i = 1;
            foreach (RadComboBoxItem itms in ddlCustomers.Items)
            {
                itms.Checked = true;
            }
        }

        public void LoadRoute()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelectRotByDphID", "sp_UserDailyProcessDetail", ResponseID.ToString());
            lblRoute.Text = lstDatas.Rows[0]["rot_Name"].ToString();
        }

        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelectHeaderData", "sp_UserDailyProcessDetail", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblUser = (Label)rp.FindControl("lblUser");
                Label lblStartTime = (Label)rp.FindControl("lblStartTime");
                Label lblEndTime = (Label)rp.FindControl("lblEndTime");
                Label lblVersion = (Label)rp.FindControl("lblVersion");
                Label lblDuration = (Label)rp.FindControl("lblDuration");

                lblUser.Text = lstDatas.Rows[0]["usr_Name"].ToString();
                lblDuration.Text = lstDatas.Rows[0]["Duration"].ToString();
                lblStartTime.Text = lstDatas.Rows[0]["dph_StartDayTime"].ToString();
                lblEndTime.Text = lstDatas.Rows[0]["dph_EndDayTime"].ToString();
                lblVersion.Text = lstDatas.Rows[0]["dph_VersionNumber"].ToString();
            }
        }

        public void CustomerVisitCount()
        {
            DataTable lstVisitCount = ObjclsFrms.loadList("SelectTotalCustomerVisitCount", "sp_UserDailyProcessDetail", ResponseID.ToString());
            lblTotalCustomerCount.Text = lstVisitCount.Rows[0]["totalCustomerVisit"].ToString();
        }

        public void Counts()
        {
            try
            {
                string CusStartExitId;
                if (Session["CusStartExitId"] == null)
                {
                    Session["CusStartExitId"] = "";
                     CusStartExitId = Session["CusStartExitId"].ToString();
                }
                else
                {
                    CusStartExitId = Session["CusStartExitId"].ToString();
                }
                string cusID = CusID();
                string deliveryCondition, outOfStock, itemAvailability, pricingCondition, inventoryCondition, PcomplaintsCondition, GcomplaintsCondition;
                string surveyCondition, trackingCondition, competiorCondition, agreementCondition, taskCondition, imageCapture , CusActivity , Requests;

                deliveryCondition = " dch_dph_ID = " + ResponseID.ToString() + " and dch_cus_ID in (" + cusID + ")" + " and dch_ucp_ID = (case when '" + CusStartExitId + "' = '' then dch_ucp_ID else '" + CusStartExitId + "' end)";
                outOfStock = " osh_dph_ID = " + ResponseID.ToString() + " and osh_cus_ID in (" + cusID + ")" + " and osh_ucp_ID = (case when '" + CusStartExitId + "' = '' then osh_ucp_ID else '" + CusStartExitId + "' end)";
                itemAvailability = " iah_dph_ID = " + ResponseID.ToString() + " and iah_cus_ID in (" + cusID + ")" + " and iah_ucp_ID = (case when '" + CusStartExitId + "' = '' then iah_ucp_ID else '" + CusStartExitId + "' end)";
                pricingCondition = " crp_dph_ID = " + ResponseID.ToString() + " and crp_cus_ID in (" + cusID + ")" + " and crp_ucp_ID = (case when '" + CusStartExitId + "' = '' then crp_ucp_ID else '" + CusStartExitId + "' end)";
                inventoryCondition = " inh_dph_ID = " + ResponseID.ToString() + " and inh_cus_ID in (" + cusID + ")" + " and inh_ucp_ID = (case when '" + CusStartExitId + "' = '' then inh_ucp_ID else '" + CusStartExitId + "' end)";
                PcomplaintsCondition = " psc_dph_ID = " + ResponseID.ToString() + " and psc_cus_ID in (" + cusID + ")" + " and psc_ucp_ID = (case when '" + CusStartExitId + "' = '' then psc_ucp_ID else '" + CusStartExitId + "' end)";
                GcomplaintsCondition = " gcm_dph_ID = " + ResponseID.ToString() + " and gcm_cus_ID in (" + cusID + ")" + " and gcm_ucp_ID = (case when '" + CusStartExitId + "' = '' then gcm_ucp_ID else '" + CusStartExitId + "' end)";

                surveyCondition = " srh_dph_ID = " + ResponseID.ToString() + " and srh_cus_ID in (" + cusID + ")" + " and srh_ucp_ID = (case when '" + CusStartExitId + "' = '' then srh_ucp_ID else '" + CusStartExitId + "' end)";
                trackingCondition = " cct_dph_ID = " + ResponseID.ToString() + " and cct_cus_ID in (" + cusID + ")" + " and cct_ucp_ID = (case when '" + CusStartExitId + "' = '' then cct_ucp_ID else '" + CusStartExitId + "' end)";
                competiorCondition = " cma_dph_ID = " + ResponseID.ToString() + " and cma_cus_ID in (" + cusID + ")" + " and cma_ucp_ID = (case when '" + CusStartExitId + "' = '' then cma_ucp_ID else '" + CusStartExitId + "' end)";
                agreementCondition = " dag_dph_ID = " + ResponseID.ToString() + " and dag_cus_ID in (" + cusID + ")" + " and dag_ucp_ID = (case when '" + CusStartExitId + "' = '' then dag_ucp_ID else '" + CusStartExitId + "' end)";
                taskCondition = " cst_dph_ID = " + ResponseID.ToString() + " and cst_cus_ID in (" + cusID + ")" + " and cst_ucp_ID = (case when '" + CusStartExitId + "' = '' then cst_ucp_ID else '" + CusStartExitId + "' end)";
                imageCapture = " mei_dph_ID = " + ResponseID.ToString() + " and mei_cus_ID in (" + cusID + ")" + " and mei_ucp_ID = (case when '" + CusStartExitId + "' = '' then mei_ucp_ID else '" + CusStartExitId + "' end)" ;
                CusActivity = " cah_dph_ID = " + ResponseID.ToString() + " and cah_cus_ID in (" + cusID + ")" + " and cah_ucp_ID = (case when '" + CusStartExitId + "' = '' then cah_ucp_ID else '" + CusStartExitId + "' end)";
                Requests = " req_dph_ID = " + ResponseID.ToString() + " and req_ucp_ID = (case when '" + CusStartExitId + "' = '' then req_ucp_ID else '" + CusStartExitId + "' end)";

                DataTable lstDeliveryCheck = new DataTable();
                lstDeliveryCheck = ObjclsFrms.loadList("SelectDeliveryCheckCount", "sp_UserDailyProcessDetail", deliveryCondition.ToString());
                lblTotalDeliveryCheck.Text = lstDeliveryCheck.Rows[0]["number"].ToString();

                DataTable lstOutOfStock = new DataTable();
                lstOutOfStock = ObjclsFrms.loadList("SelectOutOfSockCount", "sp_UserDailyProcessDetail", outOfStock.ToString());
                lblOutOfStock.Text = lstOutOfStock.Rows[0]["number"].ToString();

                DataTable lstItemAvailability = new DataTable();
                lstItemAvailability = ObjclsFrms.loadList("SelectItemAvailabilityCount", "sp_UserDailyProcessDetail", itemAvailability.ToString());
                lblItemAvailability.Text = lstItemAvailability.Rows[0]["number"].ToString();

                DataTable lstItemPricing = new DataTable();
                lstItemPricing = ObjclsFrms.loadList("SelectItemPricingCount", "sp_UserDailyProcessDetail", pricingCondition.ToString());
                lblItemPricing.Text = lstItemPricing.Rows[0]["number"].ToString();

                DataTable lstInventory = new DataTable();
                lstInventory = ObjclsFrms.loadList("SelectInventoryCount", "sp_UserDailyProcessDetail", inventoryCondition.ToString());
                lblCustomerInventory.Text = lstInventory.Rows[0]["number"].ToString();

                DataTable lstComplaints = new DataTable();
                lstComplaints = ObjclsFrms.loadList("SelectComplaintsCount", "sp_UserDailyProcessDetail", PcomplaintsCondition.ToString());
                lblProductComplaints.Text = lstComplaints.Rows[0]["number"].ToString();

                DataTable lstGComplaints = new DataTable();
                lstComplaints = ObjclsFrms.loadList("SelectGComplaintsCount", "sp_UserDailyProcessDetail", GcomplaintsCondition.ToString());
                lblComplaints.Text = lstComplaints.Rows[0]["number"].ToString();

                DataTable lstSurvey = new DataTable();
                lstSurvey = ObjclsFrms.loadList("SelectSurveysCount", "sp_UserDailyProcessDetail", surveyCondition.ToString());
                lblSurvey.Text = lstSurvey.Rows[0]["number"].ToString();

                DataTable lstAssetTracking = new DataTable();
                lstAssetTracking = ObjclsFrms.loadList("SelectAssetTrackingCount", "sp_UserDailyProcessDetail", trackingCondition.ToString());
                lblAssetTracking.Text = lstAssetTracking.Rows[0]["number"].ToString();

                DataTable lstCompetiorActivity = new DataTable();
                lstCompetiorActivity = ObjclsFrms.loadList("SelectCompetitorActivitiesCount", "sp_UserDailyProcessDetail", competiorCondition.ToString());
                lblCompetitorActivites.Text = lstCompetiorActivity.Rows[0]["number"].ToString();

                DataTable lstDisplayAgreement = new DataTable();
                lstDisplayAgreement = ObjclsFrms.loadList("SelectDisplayAgreementsCount", "sp_UserDailyProcessDetail", agreementCondition.ToString());
                lblDisplayAgreements.Text = lstDisplayAgreement.Rows[0]["number"].ToString();

                DataTable lstTask = new DataTable();
                lstTask = ObjclsFrms.loadList("SelectTaskCount", "sp_UserDailyProcessDetail", taskCondition.ToString());
                lblTasks.Text = lstTask.Rows[0]["number"].ToString();

                DataTable lstImageCapture = new DataTable();
                lstImageCapture = ObjclsFrms.loadList("SelectImageCaptureCount", "sp_UserDailyProcessDetail", imageCapture.ToString());
                lblImageCapture.Text = lstImageCapture.Rows[0]["number"].ToString();

                DataTable lstCusAct = new DataTable();
                lstCusAct = ObjclsFrms.loadList("SelectCusActivities", "sp_UserDailyProcessDetail", CusActivity.ToString());
                lblcusActivities.Text = lstCusAct.Rows[0]["number"].ToString();

                DataTable lstRequest = new DataTable();
                lstRequest = ObjclsFrms.loadList("SelectRequests", "sp_UserDailyProcessDetail", Requests.ToString());
                lblRequests.Text = lstRequest.Rows[0]["number"].ToString();


            }
            catch (Exception ex)
            {

            }
        }

        protected void lnkMap_Click(object sender, ImageClickEventArgs e)
        {
            string id = ResponseID.ToString();
            string url = ConfigurationManager.AppSettings.Get("TrackingUrlID");
            OpenNewBrowserWindow(url + id + "&&mode=DIGITS-SFA", this);
        }

        public static void OpenNewBrowserWindow(string Url, Control control)
        {
            ScriptManager.RegisterStartupScript(control, control.GetType(), "Open", "window.open('" + Url + "');", true);
        }

        protected void lnkKpi_Click(object sender, ImageClickEventArgs e)
        {
            DataTable lstParams = ObjclsFrms.loadList("SelectUserDailyProcessDateRotByID", "sp_Merchandising", ResponseID.ToString());
            if (lstParams.Rows.Count > 0)
            {
                Session["UdpDate"] = null;
                Session["UdpRoute"] = null;
                Session["UdpDate"] = lstParams.Rows[0]["CreatedDate"].ToString();
                Session["UdpRoute"] = lstParams.Rows[0]["udp_rot_ID"].ToString();
            }
            Response.Redirect("RouteDashboard.aspx?Type=udp");
        }

        protected void lnkLastRouteCom_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("LastRouteCommunicationReport.aspx?Id=" + ResponseID.ToString());
        }

        protected void grvRpt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            LoadData();
        }

        protected void grvRpt_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("MyClick1"))
            {

                foreach (GridDataItem di in grvRpt.MasterTableView.Items)
                {
                    di.BackColor = Color.Transparent;
                }

                GridDataItem item = grvRpt.MasterTableView.Items[Convert.ToInt32(e.CommandArgument)];
                string ID = item.GetDataKeyValue("ucp_ID").ToString();
                string id = ViewState["id"].ToString();
                if (ViewState["id"].ToString() == ID)
                {
                    Session["CusStartExitId"] = null;
                    Session["CusId"] = null;
                    ViewState["id"] = 0;
                }
                else
                {
                    ViewState["id"] = ID;
                    Session["CusStartExitId"] = ID.ToString();
                    DataTable lstDatas = new DataTable();
                    lstDatas = ObjclsFrms.loadList("SelectCustomerID", "sp_UserDailyProcessDetail", ID);
                    string cusid = lstDatas.Rows[0]["ucp_cus_ID"].ToString();
                    ddlCustomers.ClearCheckedItems();
                    ddlCustomers.Items.FindItemByValue(cusid).Checked = true;
                    item.BackColor = System.Drawing.ColorTranslator.FromHtml("#eaf8fb");

                }
                Counts();

            }
        }

        public void LoadData()
        {
            string mainCondition = "";
            mainCondition = mainConditions();
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelectCustomerVisitReport", "sp_UserDailyProcessDetail", mainCondition);
            grvRpt.DataSource = lstDatas;
            //lblTotalVisits.Text = lstDatas.Rows.Count.ToString();
        }

        public string mainConditions()
        {
            string cusID = CusID();
            string mainCondition = " ucp_dph_ID = " + ResponseID.ToString() + " and ucp_cus_ID in (" + cusID + ")";
            return mainCondition;
        }

        public string CusID()
        {
            var ColelctionMarket = ddlCustomers.CheckedItems;
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

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            LoadData();
            grvRpt.Rebind();
            Counts();
        }

        protected void lnkDeliveryCheck_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=DC" + "&&cusID=" + cusID);
        }

        protected void lnkOutOfStock_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=OS" + "&&cusID=" + cusID);
        }

        protected void lnkItemAvailability_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=IA" + "&&cusID=" + cusID);
        }

        protected void lnkItemPricing_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=IP"  + "&&cusID=" + cusID);
        }

        protected void lnkCustomerInventory_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=CI" + "&&cusID=" + cusID);
        }

        protected void lnkComplaints_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=GC" + "&&cusID=" + cusID);
        }

        protected void lnkSurvey_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=SR" + "&&cusID=" + cusID);
        }

        protected void lnkAssetTracking_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=AT" + "&&cusID=" + cusID);
        }

        protected void lnkCompetitorActivities_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=CA" + "&&cusID=" + cusID);
        }

        protected void lnkDisplayAgreements_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=DA" + "&&cusID=" + cusID);
        }

        protected void lnkTasks_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=TS" + "&&cusID=" + cusID);
        }

        protected void lnkImageCapture_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=IC" + "&&cusID=" + cusID);
        }

        protected void Imgexcel_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = new DataTable();

            int columncount = 0;

            foreach (GridColumn column in grvRpt.MasterTableView.Columns)
            {
                if (!string.IsNullOrEmpty(column.UniqueName)
                    && !string.IsNullOrEmpty(column.HeaderText)
                    && !column.HeaderText.Equals("Detail")
                   && !column.HeaderText.Equals("Edit") && !column.HeaderText.Equals("Image")
                    )
                {


                    if (column.Display == true)
                    {
                        columncount++;
                        dt.Columns.Add(column.HeaderText.Replace("<br>", " "), typeof(string));
                    }
                }
            }

            DataRow dr;
            grvRpt.MasterTableView.AllowPaging = false;

            RadGrid dd = grvRpt;
            dd.AllowPaging = false;
            dd.Rebind();
            int x = grvRpt.MasterTableView.Items.Count;
            foreach (GridDataItem item in dd.MasterTableView.Items)
            {
                dr = dt.NewRow();
                int j = 0;
                for (int i = 0; i < grvRpt.MasterTableView.Columns.Count; i++)
                {
                    if (grvRpt.MasterTableView.Columns[i].Display == true)
                    {
                        //if (i == 0)
                        //{
                        //    i++;


                        //}
                        //else
                        //{

                        //    dr[i] = item[grvRpt.MasterTableView.Columns[i].UniqueName].Text;
                        //}


                        if (!item[grvRpt.MasterTableView.Columns[i].UniqueName].Text.Contains("Detail") &&
                            !item[grvRpt.MasterTableView.Columns[i].UniqueName].Text.Contains("Edit"))
                        {
                            if (!grvRpt.MasterTableView.Columns[i].HeaderText.Equals("Image"))
                            {
                                dr[j] = item[grvRpt.MasterTableView.Columns[i].UniqueName].Text;
                                j++;
                            }

                        }
                    }
                }
                dt.Rows.Add(dr);
            }
            SpreadStreamProcessingForXLSXAndCSV(dt);
        }
        private void SpreadStreamProcessingForXLSXAndCSV(DataTable dt, SpreadDocumentFormat docFormat = SpreadDocumentFormat.Xlsx, string sheetName = "UDP")
        {
            using (MemoryStream stream = new MemoryStream())
            {
                using (IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(docFormat, stream))
                {
                    using (IWorksheetExporter worksheetExporter = workbook.CreateWorksheetExporter(sheetName))
                    {
                        for (int i = 0; i < dt.Columns.Count; i++)
                        {
                            using (IColumnExporter columnExporter = worksheetExporter.CreateColumnExporter())
                            {
                                //make sure the width of the columns is not excessively large
                                //I reduced it to 100 in this iteration
                                columnExporter.SetWidthInPixels(100);
                            }
                        }

                        ExportHeaderRows(worksheetExporter, dt);

                        foreach (DataRow row in dt.Rows)
                        {
                            using (IRowExporter rowExporter = worksheetExporter.CreateRowExporter())
                            {
                                foreach (var item in row.ItemArray)
                                {
                                    SpreadCellFormat normalFormat = new SpreadCellFormat();
                                    normalFormat.FontSize = 10;

                                    normalFormat.VerticalAlignment = SpreadVerticalAlignment.Center;
                                    normalFormat.HorizontalAlignment = SpreadHorizontalAlignment.Center;
                                    using (ICellExporter cellExporter = rowExporter.CreateCellExporter())
                                    {

                                        cellExporter.SetValue(item.ToString());
                                        cellExporter.SetFormat(normalFormat);
                                    }
                                }

                            }
                        }

                    }
                }

                byte[] output = stream.ToArray();


                Response.ContentType = ContentType;
                Response.Headers.Remove("Content-Disposition");
                Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}.{1}", "UserDailyProcessDetail", "Xlsx"));
                Response.BinaryWrite(output);
                Response.End();
            }
        }
        private void ExportHeaderRows(IWorksheetExporter worksheetExporter, DataTable dt)
        {
            using (IRowExporter rowExporter = worksheetExporter.CreateRowExporter())
            {
                double HeaderRowHeight = 30;
                rowExporter.SetHeightInPoints(HeaderRowHeight);

                SpreadCellFormat format = new SpreadCellFormat();
                format.IsBold = true;
                format.Fill = SpreadPatternFill.CreateSolidFill(new SpreadColor(128, 128, 128));
                format.ForeColor = new SpreadThemableColor(new SpreadColor(255, 255, 255));
                format.HorizontalAlignment = SpreadHorizontalAlignment.Center;
                format.VerticalAlignment = SpreadVerticalAlignment.Center;

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    using (ICellExporter cellExporter = rowExporter.CreateCellExporter())
                    {
                        cellExporter.SetFormat(format);
                        cellExporter.SetValue(dt.Columns[i].ColumnName);
                    }
                }
            }
        }

        protected void LinkProductComplaints_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=PC" + "&&cusID=" + cusID);

        }

        protected void lnkCusActivities_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=CAT" + "&&cusID=" + cusID);
        }

        protected void lnkRequests_Click(object sender, EventArgs e)
        {
            string cusID = CusID();
            Response.Redirect("MerchandisingTransactions.aspx?id=" + ResponseID.ToString() + "&&Mode=RQ" + "&&cusID=" + cusID);
        }
    }
}