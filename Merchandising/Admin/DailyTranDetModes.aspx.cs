using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Documents.SpreadsheetStreaming;
using Telerik.Web.UI;

namespace Merchandising.Admin
{
    public partial class DailyTranDetModes : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();

        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["id"], out ResponseID);
                return ResponseID;
            }
        }

        public int HeaderID
        {
            get
            {
                int HeaderID;
                int.TryParse(Request.Params["HID"], out HeaderID);
                return HeaderID;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HeaderData();
            }
        }

        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelUsrDlyPrcsHeaderByID", "sp_Report", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblUser = (Label)rp.FindControl("lblUser");
                Label lblRoute = (Label)rp.FindControl("lblRoute");
                Label lblStartTime = (Label)rp.FindControl("lblStartTime");
                Label lblEndTime = (Label)rp.FindControl("lblEndTime");
                Label lblVersion = (Label)rp.FindControl("lblVersion");
                
                lblUser.Text = lstDatas.Rows[0]["userName"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["routeName"].ToString();
                lblStartTime.Text = lstDatas.Rows[0]["StartTime"].ToString();
                lblEndTime.Text = lstDatas.Rows[0]["EndTime"].ToString();
                lblVersion.Text = lstDatas.Rows[0]["dph_VersionNumber"].ToString();
            }
        }

        public void GetData()
        {
            string mode = Request.Params["mode"].ToString();
            string proc = "";
            string procs = "";
            if (mode.Equals("Delivery"))
            {
                lblType.Text = "Delivery Check Detail";
                proc = "SelUserDailyDeliveryCheckDetail";
                procs = "SelUserDailyDeliveryCheckHeader";
            }
            else if (mode.Equals("OutOfStock"))
            {
                lblType.Text = "Out Of Stock Detail";
                proc = "SelUserDailyOutOfStockDetail";
                procs = "SelUserOutOfStockCheckHeader";
            }
            else if (mode.Equals("ItemAvailability"))
            {
                lblType.Text = "Item Availability Detail";
                proc = "SelUserDailyItemAvailabilityDetail";
                procs = "SelUserItemAvailabilityCheckHeader";
            }
            else if (mode.Equals("Pricing"))
            {
                lblType.Text = "Item Pricing Detail";
                proc = "SelUserDailyItemPricingDetail";
                procs = "SelUserDailyItemPricingHeader";
            }
            else if (mode.Equals("Inventory"))
            {
                lblType.Text = "Customer Inventory Detail";
                proc = "SelUserDailyInventoryDetail";
                procs = "SelUserDailyInventoryHeader";
            }
            else if (mode.Equals("Survey"))
            {
                lblType.Text = "Survey Detail";
                proc = "SelUserDailySurveyDetail";
                procs = "SelUserDailySurveyHeader";
            }
            else if (mode.Equals("Tracking"))
            {
                lblType.Text = "Asset Tracking Detail";
                proc = "SelUserDailyAssetTrackingDetail";
                procs = "SelUserDailyAssetTrackingHeader";
            }
            
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList(proc, "sp_Report", ResponseID.ToString());
            grvRpt.DataSource = lstDatas;

            DataTable lstData = new DataTable();
            lstData = ObjclsFrms.loadList(procs, "sp_Report", ResponseID.ToString());
            if (lstData.Rows.Count > 0)
            {
                RadPanelItem rps = RadPanelBar1.Items[0];
                Label lblCustomer = (Label)rps.FindControl("lblCustomer");
                Label lblVisitStart = (Label)rps.FindControl("lblVisitStart");
                Label lblVisitEnd = (Label)rps.FindControl("lblVisitEnd");
                Label lblTransTime = (Label)rps.FindControl("lblTransTime");

                Label lblTransNumb = (Label)rps.FindControl("lblTransNumb");
                Label lblDeliveryBy = (Label)rps.FindControl("lblDeliveryBy");
                Label lblStatus = (Label)rps.FindControl("lblStatus");
                Label lblCompletedDate = (Label)rps.FindControl("lblCompletedDate");
                Label lblAssetName = (Label)rps.FindControl("lblAssetName");
                Label lblDate = (Label)rps.FindControl("lblDate");
                Label lblDeliveredDate = (Label)rps.FindControl("lblDeliveredDate");

                lblCustomer.Text = lstData.Rows[0]["cus_Name"].ToString();

                if (mode.Equals("Delivery"))
                {
                    pnlTransNo.Visible = true;
                    pnlStatus.Visible = true;
                    pnlDeliveryBy.Visible = true;
                    pnlDate.Visible = true;
                    pnlDeliveredDate.Visible = true;

                    lblTransNumb.Text = lstData.Rows[0]["dch_TransNumber"].ToString();
                    lblDeliveryBy.Text = lstData.Rows[0]["dch_DeliveredBy"].ToString();
                    lblStatus.Text = lstData.Rows[0]["Status"].ToString();
                    lblDate.Text = lstData.Rows[0]["Date"].ToString();
                    lblDeliveredDate.Text = lstData.Rows[0]["dch_DeliveryDate"].ToString();
                }
                else if (mode.Equals("OutOfStock"))
                {
                    pnlVisitStart.Visible = true;
                    pnlVisitEnd.Visible = true;
                    pnlTransTime.Visible = true;
                    pnlCompletedDate.Visible = true;

                    lblVisitStart.Text = lstData.Rows[0]["VisitStart"].ToString();
                    lblVisitEnd.Text = lstData.Rows[0]["VisitEnd"].ToString();
                    lblTransTime.Text = lstData.Rows[0]["TransTime"].ToString();
                    lblCompletedDate.Text = lstData.Rows[0]["CompletedDate"].ToString();
                }
                else if (mode.Equals("ItemAvailability"))
                {
                    pnlVisitStart.Visible = true;
                    pnlVisitEnd.Visible = true;
                    pnlTransTime.Visible = true;
                    lblVisitStart.Text = lstData.Rows[0]["VisitStart"].ToString();
                    lblVisitEnd.Text = lstData.Rows[0]["VisitEnd"].ToString();
                    lblTransTime.Text = lstData.Rows[0]["TransTime"].ToString();
                }
                else if (mode.Equals("Pricing"))
                {
                    pnlVisitStart.Visible = true;
                    pnlVisitEnd.Visible = true;
                    pnlTransTime.Visible = true;
                    lblVisitStart.Text = lstData.Rows[0]["VisitStart"].ToString();
                    lblVisitEnd.Text = lstData.Rows[0]["VisitEnd"].ToString();
                    lblTransTime.Text = lstData.Rows[0]["TransTime"].ToString();
                }
                else if (mode.Equals("Inventory"))
                {
                    pnlVisitStart.Visible = true;
                    pnlVisitEnd.Visible = true;
                    pnlTransTime.Visible = true;
                    lblVisitStart.Text = lstData.Rows[0]["VisitStart"].ToString();
                    lblVisitEnd.Text = lstData.Rows[0]["VisitEnd"].ToString();
                    lblTransTime.Text = lstData.Rows[0]["TransTime"].ToString();
                }
                else if (mode.Equals("Survey"))
                {
                    pnlVisitStart.Visible = true;
                    pnlVisitEnd.Visible = true;
                    pnlTransTime.Visible = true;
                    lblVisitStart.Text = lstData.Rows[0]["VisitStart"].ToString();
                    lblVisitEnd.Text = lstData.Rows[0]["VisitEnd"].ToString();
                    lblTransTime.Text = lstData.Rows[0]["TransTime"].ToString();
                }
                else if (mode.Equals("Tracking"))
                {
                    pnlVisitStart.Visible = true;
                    pnlVisitEnd.Visible = true;
                    pnlTransTime.Visible = true;
                    pnlAssetName.Visible = true;
                    lblVisitStart.Text = lstData.Rows[0]["VisitStart"].ToString();
                    lblVisitEnd.Text = lstData.Rows[0]["VisitEnd"].ToString();
                    lblTransTime.Text = lstData.Rows[0]["TransTime"].ToString();
                    lblAssetName.Text = lstData.Rows[0]["clm_Name"].ToString();
                }
                
            }
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GetData();
        }

        protected void grvRpt_PreRender(object sender, EventArgs e)
        {
            RadGrid radgrid2 = (RadGrid)sender;
            radgrid2.MasterTableView.GetColumnSafe("id").Visible = false;
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = new DataTable();

            int columncount = 0;

            foreach (GridColumn column in grvRpt.MasterTableView.Columns)
            {
                if (!string.IsNullOrEmpty(column.UniqueName) && !string.IsNullOrEmpty(column.HeaderText))
                {

                    if (column.Display == true)
                    {
                        if (!column.UniqueName.Contains("Detail"))
                        {
                            columncount++;
                            dt.Columns.Add(column.HeaderText, typeof(string));
                        }
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
                for (int i = 0; i < columncount; i++)
                {
                    if (grvRpt.MasterTableView.Columns[i].Display == true)
                    {
                        if (!item[grvRpt.MasterTableView.Columns[i].UniqueName].Text.Equals("&nbsp;"))
                        {
                            dr[i] = item[grvRpt.MasterTableView.Columns[i].UniqueName].Text;
                        }
                    }
                }
                dt.Rows.Add(dr);
            }
            SpreadStreamProcessingForXLSXAndCSV(dt);
        }

        private void SpreadStreamProcessingForXLSXAndCSV(DataTable dt, SpreadDocumentFormat docFormat = SpreadDocumentFormat.Xlsx, string sheetName = "Sheet1")
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
                Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}.{1}", "Customer Operation Detail Report", "Xlsx"));
                Response.BinaryWrite(output);
                Response.End();
            }
        }

        private void ExportHeaderRows(IWorksheetExporter worksheetExporter, DataTable dt)
        {
            using (IRowExporter rowExporter = worksheetExporter.CreateRowExporter())
            {
                double HeaderRowHeight = 50;
                rowExporter.SetHeightInPoints(HeaderRowHeight);

                SpreadCellFormat format = new SpreadCellFormat();
                format.IsBold = true;
                format.Fill = SpreadPatternFill.CreateSolidFill(new SpreadColor(142, 196, 65));
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

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailedDailyTransactions.aspx?Id=" + HeaderID + "&mode=" + Request.Params["mode"].ToString());
        }
    }
}