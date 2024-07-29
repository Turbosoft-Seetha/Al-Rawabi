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

namespace Merchandising.BO_Digits.en
{
    public partial class DeliveryCheck : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();

        public int Mode
        {
            get
            {
                int Mode;
                int.TryParse(Request.Params["mode"], out Mode);

                return Mode;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RegionMaster();
                if (Mode == 1) // While loading page from dashboard 
                {
                    try
                    {


                        if (Session["FromDate"] != null)
                        {
                            rdFromDate.SelectedDate = DateTime.Parse(Session["FromDate"].ToString());
                        }
                        if (Session["ToDate"] != null)
                        {
                            rdEndDate.SelectedDate = DateTime.Parse(Session["ToDate"].ToString());
                        }
                    }
                    catch { }
                    RegionFromDashboard();
                    string region = Region();
                    string regionCondition = " dep_reg_ID in (" + region + ")";
                   
                    Depot(regionCondition);
                    DepoFromDashboard();
                    string depo = DPO();
                    string dpocondition = " dpa_dep_ID in (" + depo + ")";
                    
                    DpoArea(dpocondition);
                    DepoAreaFromDashboard();
                    string depoarea = DPOarea();
                    string dpoareacondition = " dsa_dpa_ID in (" + depoarea + ")";
                   
                    DpoSubArea(dpoareacondition);
                    DepoSubAreaFromDashboard();
                    string deposubarea = DPOsubarea();
                    string dposubareacondition = " rot_dsa_ID in (" + deposubarea + ")";
                    
                    Route(dposubareacondition);
                    RouteFromDashboard();
                   

                }
                else // While loading page from transaction menu
                {
                    rdFromDate.SelectedDate = DateTime.Now;
                    rdEndDate.SelectedDate = DateTime.Now;

                    RegionMaster();
                    int s = 1;
                    foreach (RadComboBoxItem itmss in ddlRegion.Items)
                    {
                        itmss.Checked = true;
                        s++;
                    }
                    string region = Region();
                    Session["Region"] = region;
                    string regionCondition = " dep_reg_ID in (" + region + ")";



                    Depot(regionCondition);
                    int p = 1;
                    foreach (RadComboBoxItem itmss in ddldepot.Items)
                    {
                        itmss.Checked = true;
                        p++;
                    }
                    string depo = DPO();
                    Session["Depo"] = depo;
                    string dpocondition = " dpa_dep_ID in (" + depo + ")";
                    DpoArea(dpocondition);
                    int q = 1;
                    foreach (RadComboBoxItem itmss in ddldpoArea.Items)
                    {
                        itmss.Checked = true;
                        q++;
                    }
                    string depoarea = DPOarea();
                    Session["DepoArea"] = depoarea;
                    string dpoareacondition = " dsa_dpa_ID in (" + depoarea + ")";
                    DpoSubArea(dpoareacondition);
                    int R = 1;
                    foreach (RadComboBoxItem itmss in ddldpoSubArea.Items)
                    {
                        itmss.Checked = true;
                        R++;
                    }
                    string deposubarea = DPOsubarea();
                    Session["DepoSubArea"] = deposubarea;
                    string dposubareacondition = " rot_dsa_ID in (" + deposubarea + ")";
                    Route(dposubareacondition);
                    RouteFromTransaction();
                }
                
                string rotID = Rot();
                string routeCondition = "rcs_rot_ID in (" + rotID + ")";
                Customer(routeCondition);
                CustomerFilter();
            }
        }
       

        public void Route(string DposubAreaCondition)
        {
            string[] arr = { DposubAreaCondition };
            ddlRoute.DataSource = ObjclsFrms.loadList("SelectRouteForDropDowns", "sp_Masters", UICommon.GetCurrentUserID().ToString(), arr);
            ddlRoute.DataTextField = "rot_Name";
            ddlRoute.DataValueField = "rot_ID";
            ddlRoute.DataBind();
        }
        public void RegionMaster()
        {

            ddlRegion.DataSource = ObjclsFrms.loadList("SelectRegionTransaction", "sp_Masters", UICommon.GetCurrentUserID().ToString());
            ddlRegion.DataTextField = "reg_Name";
            ddlRegion.DataValueField = "reg_ID";
            ddlRegion.DataBind();
        }
        public void Depot(string regionCondition)
        {
            string[] arr = { regionCondition };
            ddldepot.DataSource = ObjclsFrms.loadList("SelectDepotTransaction", "sp_Masters", UICommon.GetCurrentUserID().ToString(), arr);
            ddldepot.DataTextField = "dep_Name";
            ddldepot.DataValueField = "dep_ID";
            ddldepot.DataBind();
        }
        public void DpoArea(string DpoCondition)
        {
            string u = UICommon.GetCurrentUserID().ToString();
            string[] arr = { DpoCondition };
            ddldpoArea.DataSource = ObjclsFrms.loadList("SelectDepotAreaTransaction", "sp_Masters", UICommon.GetCurrentUserID().ToString(), arr);
            ddldpoArea.DataTextField = "dpa_Name";
            ddldpoArea.DataValueField = "dpa_ID";
            ddldpoArea.DataBind();
        }
        public void DpoSubArea(string DpoAreaCondition)
        {
            string[] arr = { DpoAreaCondition };
            ddldpoSubArea.DataSource = ObjclsFrms.loadList("SelectDepotSubAreaTransaction", "sp_Masters", UICommon.GetCurrentUserID().ToString(), arr);
            ddldpoSubArea.DataTextField = "dsa_Name";
            ddldpoSubArea.DataValueField = "dsa_ID";
            ddldpoSubArea.DataBind();
        }
        public string DPO()
        {
            var CollectionMarket1 = ddldepot.CheckedItems;
            string dpoID = "";
            int j = 0;
            int MarCount = CollectionMarket1.Count;
            if (CollectionMarket1.Count > 0)
            {
                foreach (var item in CollectionMarket1)
                {
                    if (j == 0)
                    {
                        dpoID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        dpoID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        dpoID += item.Value;
                    }
                    j++;
                }
                return dpoID;
            }
            else
            {
                return "0";
            }
        }
        public string DPOarea()
        {
            var CollectionMarket2 = ddldpoArea.CheckedItems;
            string dpoareID = "";
            int j = 0;
            int MarCount = CollectionMarket2.Count;
            if (CollectionMarket2.Count > 0)
            {
                foreach (var item in CollectionMarket2)
                {
                    if (j == 0)
                    {
                        dpoareID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        dpoareID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        dpoareID += item.Value;
                    }
                    j++;
                }
                return dpoareID;
            }
            else
            {
                return "0";
            }
        }

        public string DPOsubarea()
        {
            var CollectionMarket3 = ddldpoSubArea.CheckedItems;
            string dposubareID = "";
            int j = 0;
            int MarCount = CollectionMarket3.Count;
            if (CollectionMarket3.Count > 0)
            {
                foreach (var item in CollectionMarket3)
                {
                    if (j == 0)
                    {
                        dposubareID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        dposubareID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        dposubareID += item.Value;
                    }
                    j++;
                }
                return dposubareID;
            }
            else
            {
                return "0";
            }
        }
        public string Region()
        {
            var CollectionMarket4 = ddlRegion.CheckedItems;
            string regionID = "";
            int j = 0;
            int MarCount = CollectionMarket4.Count;
            if (CollectionMarket4.Count > 0)
            {
                foreach (var item in CollectionMarket4)
                {
                    if (j == 0)
                    {
                        regionID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        regionID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        regionID += item.Value;
                    }
                    j++;
                }
                return regionID;
            }
            else
            {
                return "0";
            }
        }

        public void Customer(string routeCondition)
        {
            ddlCustomer.DataSource = ObjclsFrms.loadList("SelCustomerByRoute", "sp_Transaction", routeCondition);
            ddlCustomer.DataTextField = "cus_Name";
            ddlCustomer.DataValueField = "cus_ID";
            ddlCustomer.DataBind();
        }

        public void RouteFromDashboard()
        {
            try
            {


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
            }
            catch { }
        }
        public void RegionFromDashboard()
        {
            try
            {


                if (Session["Region"] != null)
                {
                    string ids = Session["Region"].ToString();
                    string[] words = ids.Split(',');

                    foreach (var word in words)
                    {
                        foreach (RadComboBoxItem rd in ddlRegion.Items)
                        {
                            if (rd.Value.Equals(word))
                            {
                                rd.Checked = true;
                            }
                        }
                    }
                }
            }
            catch { }
        }
        public void DepoFromDashboard()
        {
            try
            {


                if (Session["Depo"] != null)
                {
                    string ids = Session["Depo"].ToString();
                    string[] words = ids.Split(',');

                    foreach (var word in words)
                    {
                        foreach (RadComboBoxItem rd in ddldepot.Items)
                        {
                            if (rd.Value.Equals(word))
                            {
                                rd.Checked = true;
                            }
                        }
                    }
                }
            }
            catch { }
        }

        public void DepoAreaFromDashboard()
        {
            try
            {


                if (Session["DepoArea"] != null)
                {
                    string ids = Session["DepoArea"].ToString();
                    string[] words = ids.Split(',');

                    foreach (var word in words)
                    {
                        foreach (RadComboBoxItem rd in ddldpoArea.Items)
                        {
                            if (rd.Value.Equals(word))
                            {
                                rd.Checked = true;
                            }
                        }
                    }
                }
            }
            catch { }
        }
        public void DepoSubAreaFromDashboard()
        {
            try
            {


                if (Session["Depo"] != null)
                {
                    string ids = Session["DepoSubArea"].ToString();
                    string[] words = ids.Split(',');

                    foreach (var word in words)
                    {
                        foreach (RadComboBoxItem rd in ddldpoSubArea.Items)
                        {
                            if (rd.Value.Equals(word))
                            {
                                rd.Checked = true;
                            }
                        }
                    }
                }
            }
            catch { }
        }
        public void RouteFromTransaction()
        {
            int j = 1;
            foreach (RadComboBoxItem itmss in ddlRoute.Items)
            {
                itmss.Checked = true;
                j++;
            }
        }

        public void CustomerFilter()
        {
            int k = 1;
            foreach (RadComboBoxItem itme in ddlCustomer.Items)
            {
                itme.Checked = true;
                k++;
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

        public string Cus()
        {
            var ColelctionMarkets = ddlCustomer.CheckedItems;
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
            string cusID = Cus();
            string customerCondition = "";
            string dateCondition = "";
            string mainCondition = " dph_rot_ID in (" + rotID + ")";
            try
            {
                string fromDate = DateTime.Parse(rdFromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
                string endDate = DateTime.Parse(rdEndDate.SelectedDate.ToString()).ToString("yyyyMMdd");
                dateCondition = " and (cast(dph_Date as date) between cast('" + fromDate + "' as date) and cast('" + endDate + "' as date))";
                if (cusID.Equals("0"))
                {
                    customerCondition = "";
                }
                else
                {
                    customerCondition = " and dch_cus_ID in (" + cusID + ")";
                }
            }
            catch (Exception ex)
            {

            }
            mainCondition += dateCondition;
            mainCondition += customerCondition;
            return mainCondition;
        }

        public void Data()
        {
            string rotID = Rot();
            if (!rotID.Equals("0"))
            {
                string mainCondition = "";
                if (Mode == 1)
                {
                    try
                    {

                   
                    mainCondition = mainConditions(Session["Route"].ToString());
                    }
                    catch { }
                }
                else
                {
                    mainCondition = mainConditions(rotID);
                }

                DataTable lstdata = ObjclsFrms.loadList("SelectDeliveryCheck", "sp_Transaction_UOM", mainCondition);
                grvRpt.DataSource = lstdata;
            }
        }


        protected void ddlRoute_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string rotID = Rot();
            string routeCondition = "rcs_rot_ID in (" + rotID + ")";
            Customer(routeCondition);
        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            
            Data();
            grvRpt.Rebind();
        }

        protected void imgExcel_Click(object sender, ImageClickEventArgs e)
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
                for (int i = 0; i < columncount + 1; i++)
                {
                    if (grvRpt.MasterTableView.Columns[i].Display == true)
                    {
                        if (i == 0)
                        {
                            i++;
                            dr[0] = item[grvRpt.MasterTableView.Columns[i].UniqueName].Text;
                        }
                        else
                        {
                            if (!item[grvRpt.MasterTableView.Columns[i].UniqueName].Text.Equals("&nbsp;"))
                            {
                                dr[i - 1] = item[grvRpt.MasterTableView.Columns[i].UniqueName].Text;
                            }
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
                Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}.{1}", "Delivery Check", "Xlsx"));
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

        protected void grvRpt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            Data();
        }

        protected void grvRpt_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("dch_ID").ToString();
                Response.Redirect("DeliveryCheckDetail.aspx?Id=" + ID);
            }
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string RegionID = Region();
            string RegionCondition = " reg_ID in (" + RegionID + ")";
           
            Depot(RegionCondition);
            string dpoID = DPO();
            string DpoCondition = " dpa_dep_ID in (" + dpoID + ")";

            DpoArea(DpoCondition);
            string dpoareaID = DPOarea();
            string DpoAreaCondition = " dsa_dpa_ID in (" + dpoareaID + ")";

            DpoSubArea(DpoAreaCondition);
            string dposubareaID = DPOsubarea();
            string DposubAreaCondition = " rot_dsa_ID in (" + dposubareaID + ")";

            Route(DposubAreaCondition);
        }

        protected void ddldepot_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string dpoID = DPO();
            string DpoCondition = " dpa_dep_ID in (" + dpoID + ")";
            DpoArea(DpoCondition);
            string dpoareaID = DPOarea();
            string DpoAreaCondition = " dsa_dpa_ID in (" + dpoareaID + ")";
            DpoSubArea(DpoAreaCondition);
            string dposubareaID = DPOsubarea();
            string DposubAreaCondition = " rot_dsa_ID in (" + dposubareaID + ")";
            Route(DposubAreaCondition);
        }

        protected void ddldpoArea_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string dpoareaID = DPOarea();
            string DpoAreaCondition = " dsa_dpa_ID in (" + dpoareaID + ")";
            DpoSubArea(DpoAreaCondition);
            string dposubareaID = DPOsubarea();
            string DposubAreaCondition = " rot_dsa_ID in (" + dposubareaID + ")";
            Route(DposubAreaCondition);
        }

        protected void ddldpoSubArea_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {

            string dposubareaID = DPOsubarea();
            string DposubAreaCondition = " rot_dsa_ID in (" + dposubareaID + ")";
            Route(DposubAreaCondition);
        }
    }
}