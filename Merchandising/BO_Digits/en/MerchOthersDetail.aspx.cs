using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Merchandising.BO_Digits.en
{
    public partial class MerchOthersDetail : System.Web.UI.Page
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
      
        public int DID
        {
            get
            {
                int DID;
                int.TryParse(Request.Params["DID"], out DID);
                return DID;
            }
        }
        public string cusID
        {
            get
            {
                string cusID;
                cusID = Request.Params["cusID"].ToString();
                return cusID;
            }
        }
        public int HID
        {
            get
            {
                int HID;
                int.TryParse(Request.Params["HID"], out HID);
                return HID;
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
            lstDatas = ObjclsFrms.loadList("SelUsrDlyPrcsHeaderByID", "sp_UserDailyProcessDetail", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblUser = (Label)rp.FindControl("lblUser");
                Label lblRoute = (Label)rp.FindControl("lblRoute");
                //Label lblCreatedDate = (Label)rp.FindControl("lblCreatedDate");

                Label lblVersion = (Label)rp.FindControl("lblVersion");
                //rp.Text = "Order ID: " + lstDatas.Rows[0]["OrderID"].ToString();
                lblUser.Text = lstDatas.Rows[0]["userName"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["routeName"].ToString();
                // lblCreatedDate.Text = lstDatas.Rows[0]["CreatedDate"].ToString();
                //lblStartTime.Text = lstDatas.Rows[0]["StartTime"].ToString();
                //lblEndTime.Text = lstDatas.Rows[0]["EndTime"].ToString();
                lblVersion.Text = lstDatas.Rows[0]["dph_VersionNumber"].ToString();
            }
        }
        protected void grvheader_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GetData();
        }
        public void GetData()
        {
            string mode = Request.Params["Mode"].ToString();

            string proc = "";
            if (mode.Equals("OS"))
            {
                lblType.Text = "OutofStock";
                proc = "SelectOutOfStockItem";
            }
            else if (mode.Equals("CI"))
            {
                lblType.Text = "Customer Inventory";
                proc = "SelInventoryDetails";
            }

            DataSet lstDatas = new DataSet();
            string[] arr = { HID.ToString(), ResponseID.ToString() };
            lstDatas = ObjclsFrms.loadList(proc, "sp_UserDailyProcessDetail", DID.ToString(), arr, true);
            grvheader.DataSource = lstDatas.Tables[0];
            grvheader.DataBind();
            if (lstDatas.Tables.Count > 0)
            {
                grvRpt.DataSource = lstDatas.Tables[1];
            }
        }

        protected void grvRpt_PreRender(object sender, EventArgs e)
        {
            RadGrid radgrid2 = (RadGrid)sender;

            radgrid2.MasterTableView.GetColumnSafe("id").Visible = false;
        }
    }

}