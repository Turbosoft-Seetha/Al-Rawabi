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
    public partial class RouteTypes : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string date = DateTime.Parse(Session["FrmDat"].ToString()).ToString("yyyyMMdd");
                rdfromDate.SelectedDate = DateTime.Parse(Session["FrmDat"].ToString());
                rdfromDate.MaxDate = DateTime.Now;
                ViewState["date"] = date;
                Merchandising();
                Order();
            }
        }

        public void LoadData(string mode)
        {
            string date = ViewState["date"].ToString();
            string[] arr = { mode, date };
            DataTable lstRouteType = default(DataTable);
            lstRouteType = ObjclsFrms.loadList("SelectRouteTypeGrid", "sp_RouteType", "", arr);
            //lstRouteType = ObjclsFrms.loadList("SelectRouteTypeGrid", "sp_RouteType", UICommon.GetCurrentUserID().ToString(), arr);
            grvRpt.DataSource = lstRouteType;
        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            ViewState["date"] = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            Merchandising();
            Order();
            grvRpt.DataSource = "";
            grvRpt.DataBind();
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void lnkMerchRoute_Click(object sender, EventArgs e)
        {
            string mode = "MER";
            LoadData(mode);
            grvRpt.DataBind();
        }

        protected void lnkOrderRoutes_Click(object sender, EventArgs e)
        {
            string mode = "OR";
            LoadData(mode);
            grvRpt.DataBind();
        }

        public void Order()
        {
            string date = ViewState["date"].ToString();
            string[] arr = { date };
            DataTable lstRouteTypeOR = default(DataTable);
            lstRouteTypeOR = ObjclsFrms.loadList("SelectOrderRoutes", "sp_RouteType", UICommon.GetCurrentUserID().ToString(), arr);
            lblOrderRoutes.Text = lstRouteTypeOR.Rows[0]["startDay"].ToString();
            lblOrderStart.Text = lstRouteTypeOR.Rows[0]["startDay"].ToString();
            //lblOrderSettle.Text = lstRouteTypeOR.Rows[0]["settlement"].ToString();
            lblOrderEnd.Text = lstRouteTypeOR.Rows[0]["endDay"].ToString();
        }

        public void Merchandising()
        {
            string date = ViewState["date"].ToString();
            string[] arr = { date };
            DataTable lstRouteTypeMER = default(DataTable);
            lstRouteTypeMER = ObjclsFrms.loadList("SelectMerchandisingRoutes", "sp_RouteType", UICommon.GetCurrentUserID().ToString(), arr);
            lblMerchRoute.Text = lstRouteTypeMER.Rows[0]["startDay"].ToString();
            lblMerchStart.Text = lstRouteTypeMER.Rows[0]["startDay"].ToString();
            lblMerchEnd.Text = lstRouteTypeMER.Rows[0]["endDay"].ToString();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("dph_ID").ToString();
                Response.Redirect("UserDailyProcessDetail.aspx?Id=" + ID);
            }
        }
    }
}