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
    public partial class DetailedDailyTransactions : System.Web.UI.Page
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HeaderData();
                Customer();
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
                //rp.Text = "Order ID: " + lstDatas.Rows[0]["OrderID"].ToString();
                lblUser.Text = lstDatas.Rows[0]["userName"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["routeName"].ToString();
                lblStartTime.Text = lstDatas.Rows[0]["StartTime"].ToString();
                lblEndTime.Text = lstDatas.Rows[0]["EndTime"].ToString();
                lblVersion.Text = lstDatas.Rows[0]["dph_VersionNumber"].ToString();
            }
        }

        public void GetData()
        {
            string cus = ddlCustomer.SelectedValue.ToString();
            string mode = Request.Params["mode"].ToString();
            string proc = "";
            if (mode.Equals("Delivery"))
            {
                lblType.Text = "Delivery Check";
                proc = "SelUserDailyDeliveryCheck";
            }
            else if (mode.Equals("OutOfStock"))
            {
                lblType.Text = "Out Of Stock";
                proc = "SelUserOutOfStockCheck";
            }
            else if (mode.Equals("ItemAvailability"))
            {
                lblType.Text = "Item Availability";
                proc = "SelUserItemAvailabilityCheck";
            }
            else if (mode.Equals("Pricing"))
            {
                lblType.Text = "Item Pricing";
                proc = "SelUserDailyItemPricing";
            }
            else if (mode.Equals("Inventory"))
            {
                lblType.Text = "Customer Inventory";
                proc = "SelUserDailyInventory";
            }
            else if (mode.Equals("Complaints"))
            {
                lblType.Text = "Complaints";
                proc = "SelUserDailyComplaints";
            }
            else if (mode.Equals("Survey"))
            {
                lblType.Text = "Survey";
                proc = "SelUserDailySurvey";
            }
            else if (mode.Equals("Tracking"))
            {
                lblType.Text = "Asset Tracking";
                proc = "SelUserDailyAssetTracking";
            }
            else if (mode.Equals("Competitor"))
            {
                lblType.Text = "Competitor Activities";
                proc = "SelUserDailyCompetitorActivities";
            }
            else if (mode.Equals("Agreement"))
            {
                lblType.Text = "Display Agreements";
                proc = "SelUserDailyDisplayAgreement";
            }
            else if (mode.Equals("Tasks"))
            {
                lblType.Text = "Customer Tasks";
                proc = "SelUserDailyCustomerTask";
            }
            else if (mode.Equals("ImageCapture"))
            {
                lblType.Text = "Image Capture";
                proc = "SelUserDailyImageCapture";
            }

            DataTable lstDatas = new DataTable();
            string[] arr = { cus };
            lstDatas = ObjclsFrms.loadList(proc, "sp_Report", ResponseID.ToString(),arr);
            
            grvRpt.DataSource = lstDatas;
            
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GetData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string id = dataItem.GetDataKeyValue("id").ToString();

                Response.Redirect("DailyTranDetModes.aspx?id="+ id + "&&mode=" + Request.Params["mode"].ToString() + "&&HID=" + ResponseID.ToString());
            }
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
                Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}.{1}", "Customer Operations Report", "Xlsx"));
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
            Response.Redirect("UserDailyProcessDetail.aspx?Id=" + ResponseID.ToString());
        }

        protected void grvRpt_PreRender(object sender, EventArgs e)
        {
            RadGrid radgrid2 = (RadGrid)sender;
            radgrid2.MasterTableView.GetColumnSafe("id").Visible = false;
            radgrid2.MasterTableView.GetColumnSafe("image").Visible = false;
            radgrid2.MasterTableView.GetColumnSafe("attachment").Visible = false;
            radgrid2.MasterTableView.GetColumnSafe("imag").Visible = false;
            string modes = Request.Params["mode"].ToString();
            if (modes.Equals("Complaints") || modes.Equals("Competitor") || modes.Equals("Agreement") || modes.Equals("Tasks") || modes.Equals("ImageCapture"))
            {
                radgrid2.MasterTableView.GetColumnSafe("detail").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("imag").Visible = false;
            }
            if (modes.Equals("Delivery") || modes.Equals("OutOfStock") || modes.Equals("ItemAvailability") || modes.Equals("Pricing") || modes.Equals("Inventory") || modes.Equals("Survey") || modes.Equals("Tracking") || modes.Equals("Competitor"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("imag").Visible = false;
            }
            if (modes.Equals("Delivery") || modes.Equals("OutOfStock") || modes.Equals("ItemAvailability") || modes.Equals("Pricing") || modes.Equals("Inventory") || modes.Equals("Survey") || modes.Equals("Tracking") || modes.Equals("Competitor") || modes.Equals("Complaints") || modes.Equals("ImageCapture"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Imagess").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("imag").Visible = false;
            }
        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            GetData();
            grvRpt.DataBind();
        }

        public void Customer()
        {
            ddlCustomer.DataSource = ObjclsFrms.loadList("SelUDPCustomer", "sp_Report", ResponseID.ToString());
            ddlCustomer.DataTextField = "cus_Name";
            ddlCustomer.DataValueField = "cus_ID";
            ddlCustomer.DataBind();
        }

        protected void grvRpt_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                string modes = Request.Params["mode"].ToString();
                //if (modes.Equals("ImageCapture"))
                //{
                    GridDataItem dataItem = (GridDataItem)e.Item;
                    string imah = dataItem["image"].Text.ToString();
                    string[] values = imah.Split(',');
                    imah = imah.Replace("&nbsp;", null);
                    for (int i = 0; i < values.Length; i++)
                    {
                        if (!values[i].Equals("&nbsp;") && !values[i].Equals(""))
                        {
                            Image img = new Image();
                            img.ID = "Image1" + i.ToString();
                            img.ImageUrl = values[i].ToString();
                            img.Height = 50;
                            img.Width = 50;
                            img.BorderStyle = BorderStyle.Groove;
                            img.BorderWidth = 2;
                            img.BorderColor = System.Drawing.Color.Black;
                            HyperLink hl = new HyperLink();
                            hl.NavigateUrl = values[i].ToString();
                            hl.ID = "hl" + i.ToString();
                            hl.Target = "_blank";
                            hl.Controls.Add(img);

                            dataItem["Images"].Controls.Add(hl);
                            i++;
                        }
                    }
                //}
            }
        }
    }
}