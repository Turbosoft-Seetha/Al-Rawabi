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
    public partial class ListAfterMerchImages : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Route();
                rdFromData.SelectedDate = DateTime.Now;
                rdEndDate.SelectedDate = DateTime.Now;
            }
        }
        public void Route()
        {
            DataTable dt = ObjclsFrms.loadList("SelectRouteForDropDown", "sp_Masters");
            ddlRoute.DataSource = dt;
            ddlRoute.DataTextField = "rot_Name";
            ddlRoute.DataValueField = "rot_ID";
            ddlRoute.DataBind();
        }
        public void Customer()
        {
            DataTable dtc = ObjclsFrms.loadList("SelectCustomerForDropDown", "sp_Masters", ddlRoute.SelectedValue.ToString());
            ddlCustomer.DataSource = dtc;
            ddlCustomer.DataTextField = "cus_Name";
            ddlCustomer.DataValueField = "cus_ID";
            ddlCustomer.DataBind();
        }
        public string mainConditions(string rotID, string cusID)
        {
            string dateCondition = "";
            string mainCondition = " and cus_rot_ID  = (case when '" + rotID + "' = '' then cus_rot_ID else '" + rotID + "' end)  and mei_cus_ID = (case when '"+ cusID + "' = '' then mei_cus_ID else '" + cusID + "' end)";
            try
            {
                string fromDate = DateTime.Parse(rdFromData.SelectedDate.ToString()).ToString("yyyyMMdd");
                string endDate = DateTime.Parse(rdEndDate.SelectedDate.ToString()).ToString("yyyyMMdd");
                dateCondition = " and (cast(dph_Date as date) between cast('" + fromDate + "' as date) and cast('" + endDate + "' as date))";
            }
            catch (Exception ex)
            {

            }
            mainCondition += dateCondition;

            return mainCondition;
        }
        public void ListData()
        {
            string condition = mainConditions(ddlRoute.SelectedValue.ToString(), ddlCustomer.SelectedValue.ToString());
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("AfterMerchImages", "sp_Masters", condition.ToString());
            grvRpt.DataSource = lstUser;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        protected void grvRpt_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;

                string meiID = dataItem["amid"].Text.ToString();
                DataTable dx = ObjclsFrms.loadList("SelAfterMerchendisingImages", "sp_Masters", meiID);
                if (dx.Rows.Count > 0)
                {
                    int i = 0;
                    foreach (DataRow dr in dx.Rows)
                    {
                        Image img = new Image();
                        img.ID = "Image1" + i.ToString();
                        img.ImageUrl = dr["ami_Image"].ToString();
                        img.Height = 50;
                        img.Width = 50;
                        img.BorderStyle = BorderStyle.Groove;
                        img.BorderWidth = 2;
                        img.BorderColor = System.Drawing.Color.Black;
                        HyperLink hl = new HyperLink();
                        hl.NavigateUrl = dr["ami_Image"].ToString();
                        hl.ID = "hl" + i.ToString();
                        hl.Target = "_blank";
                        hl.Controls.Add(img);


                        dataItem["Images"].Controls.Add(hl);
                        i++;
                    }
                }

            }
        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            ListData();
            grvRpt.Rebind();
        }

        protected void ddlRoute_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Customer();
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
                Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}.{1}", "After Merchandising Image", "Xlsx"));
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
    }
}