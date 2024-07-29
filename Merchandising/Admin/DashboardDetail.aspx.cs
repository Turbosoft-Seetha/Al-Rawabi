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
    public partial class DashboardDetail : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public string TypeID
        {
            get
            {
                string  TypeID;
                TypeID = Request.Params["Type"].ToString();

                return TypeID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        public void LoadList()
        {
            try
            {
                string mainCondition = Session["DashboardCondition"].ToString();
                DataTable lstDetail = default(DataTable);
                if (TypeID.Equals("MV"))
                {
                    lblTitle.Text = "Mechandiser Total Visit Detail";
                    lstDetail = ObjclsFrms.loadList("MechandiserUserCustomerDailyProcess", "sp_Dashboard", mainCondition);
                    grvRpt.DataSource = lstDetail;
                }
                else if (TypeID.Equals("MO"))
                {
                    lblTitle.Text = "Mechandiser Out of Stock Message Detail";
                    lstDetail = ObjclsFrms.loadList("MechandiserCustomerOutStockHeader", "sp_Dashboard", mainCondition);
                    grvRpt.DataSource = lstDetail;
                }
                else if (TypeID.Equals("MG"))
                {
                    lblTitle.Text = "Mechandiser General Message Detail";
                    lstDetail = ObjclsFrms.loadList("MechandiserGeneralComplaints", "sp_Dashboard", mainCondition);
                    grvRpt.DataSource = lstDetail;
                }
                else if (TypeID.Equals("SV"))
                {
                    lblTitle.Text = "Sales Executive Total Visit Detail";
                    lstDetail = ObjclsFrms.loadList("SalesManUserCustomerDailyProcess", "sp_Dashboard", mainCondition);
                    grvRpt.DataSource = lstDetail;
                }
                else if (TypeID.Equals("SO"))
                {
                    lblTitle.Text = "Sales Executive Out of Stock Message Detail";
                    lstDetail = ObjclsFrms.loadList("SalesManCustomerOutStockHeader", "sp_Dashboard", mainCondition);
                    grvRpt.DataSource = lstDetail;
                }
                else if (TypeID.Equals("SG"))
                {
                    lblTitle.Text = "Sales Executive General Message Detail";
                    lstDetail = ObjclsFrms.loadList("SalesManGeneralComplaints", "sp_Dashboard", mainCondition);
                    grvRpt.DataSource = lstDetail;
                }
                
            }
            catch (Exception ex)
            {
                UICommon.LogException(ex, "Dashboard Detail");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "DashboardDetail.aspx Page_Load()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            string alternateText = (sender as ImageButton).AlternateText;
            if (grvRpt.MasterTableView.Items.Count > 0)
            {
                //grvRpt.MasterTableView.GetColumn("EditColumn").Visible = false;
                foreach (GridColumn gridColumn in grvRpt.Columns)
                {
                    //gridColumn.HeaderText = gridColumn.HeaderText.Replace("<br/>", " ");
                    gridColumn.HeaderStyle.Font.Bold = true;
                    gridColumn.HeaderStyle.Font.Size = 12;

                }
                grvRpt.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
                grvRpt.ExportSettings.IgnorePaging = true;
                grvRpt.ExportSettings.FileName = "Dashboard Detail Report";
                grvRpt.ExportSettings.ExportOnlyData = true;
                grvRpt.ExportSettings.OpenInNewWindow = true;
                grvRpt.MasterTableView.ExportToExcel();
            }
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }

        protected void grvRpt_PreRender(object sender, EventArgs e)
        {
            grvRpt.MasterTableView.GetColumn("S").Visible = false;
            if (TypeID.Equals("SO") || TypeID.Equals("MO") || TypeID.Equals("SV") || TypeID.Equals("MV"))
            {
                grvRpt.MasterTableView.GetColumn("Detail").Visible = true;
            }
            else
            {
                grvRpt.MasterTableView.GetColumn("Detail").Visible = false;
            }
        }

        protected void grvRpt_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("S").ToString();
                Response.Redirect("DashboardCustomerVisitDetail.aspx?Id=" + ID + "&Type=" + TypeID.ToString());
            }
        }
    }
}