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
    public partial class CustomerVisitDetail : System.Web.UI.Page
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
        public int DailyID
        {
            get
            {
                int DailyID;
                int.TryParse(Request.Params["DId"], out DailyID);

                return DailyID;
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
            lstDatas = ObjclsFrms.loadList("SelectCustomerVisitHeader", "sp_Report", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblUser = (Label)rp.FindControl("lblUser");
                Label lblRoute = (Label)rp.FindControl("lblRoute");
                Label lblCreatedDate = (Label)rp.FindControl("lblCreatedDate");
                Label lblCustomer = (Label)rp.FindControl("lblCustomer");
                Label lblCode = (Label)rp.FindControl("lblCode");

                lblUser.Text = lstDatas.Rows[0]["usr_Name"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["rot_Name"].ToString();
                lblCreatedDate.Text = lstDatas.Rows[0]["dph_Date"].ToString();
                lblCustomer.Text = lstDatas.Rows[0]["cus_Name"].ToString();
                lblCode.Text = lstDatas.Rows[0]["cus_Code"].ToString();
            }
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDailyProcessDetail.aspx?Id="+DailyID.ToString());
        }

        public void LoadList()
        {
            try
            {
                string[] arr = { DailyID.ToString() };
                DataTable lstUser = default(DataTable);
                lstUser = ObjclsFrms.loadList("SelectCustomerVisitDetailReport", "sp_Report", ResponseID.ToString());
                grvRpt.DataSource = lstUser;
            }
            catch (Exception ex) 
            {
                UICommon.LogException(ex, "Customer Visit Detail");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "CustomerVisitDetail.aspx Page_Load()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            } 
        }

        protected void grvRpt_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("S").ToString();
                
                Response.Redirect("CustomerVisitFinalDetail.aspx?DId=" + DailyID.ToString() + "&UId=" + ResponseID.ToString() + "&Type=" + ID);
            }
        }
    }
}