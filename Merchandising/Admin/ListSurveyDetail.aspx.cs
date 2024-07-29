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
    public partial class ListSurveyDetail : System.Web.UI.Page
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
                HeaderData();
            }
        }
        public void ListData()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectSurveyDetail", "sp_Transaction", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            grvRpt.DataSource = lstUser;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }
        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelectSurveyHeader", "sp_Transaction", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblRoute = (Label)rp.FindControl("lblRoute");
                Label lblCustomer = (Label)rp.FindControl("lblCustomer");
                Label lblAppUser = (Label)rp.FindControl("lblAppUser");
                Label lblSGeoLoc = (Label)rp.FindControl("lblSGeoLoc");
                Label lblEndGeoLoc = (Label)rp.FindControl("lblEndGeoLoc");
                Label lblVisitStart = (Label)rp.FindControl("lblVisitStart");
                Label lblVisitEnd = (Label)rp.FindControl("lblVisitEnd");
                Label lblTransTime = (Label)rp.FindControl("lblTransTime");

                lblRoute.Text = lstDatas.Rows[0]["rot_Name"].ToString();
                lblCustomer.Text = lstDatas.Rows[0]["cus_Name"].ToString();
                lblAppUser.Text = lstDatas.Rows[0]["usr_Name"].ToString();
                lblSGeoLoc.Text = lstDatas.Rows[0]["ucp_StartGeoCode"].ToString();
                lblEndGeoLoc.Text = lstDatas.Rows[0]["ucp_EndGeoCode"].ToString();
                lblVisitStart.Text = lstDatas.Rows[0]["VisitStart"].ToString();
                lblVisitEnd.Text = lstDatas.Rows[0]["VisitEnd"].ToString();
                lblTransTime.Text = lstDatas.Rows[0]["TransTime"].ToString();
            }
        }
    }
}