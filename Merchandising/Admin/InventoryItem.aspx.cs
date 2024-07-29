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
    public partial class InventoryItem : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int hid
        {
            get
            {
                int hid;
                int.TryParse(Request.Params["Id"], out hid);

                return hid;
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
            lstDatas = ObjclsFrms.loadList("SelectInventoryHeader", "sp_Transaction", hid.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblRoute = (Label)rp.FindControl("lblRoute");
                Label lblCustomer = (Label)rp.FindControl("lblCustomer");
                Label lblRemarks = (Label)rp.FindControl("lblRemarks");
                Label lblVisitStart = (Label)rp.FindControl("lblVisitStart");
                Label lblVisitEnd = (Label)rp.FindControl("lblVisitEnd");
                Label lblTransTime = (Label)rp.FindControl("lblTransTime");

                lblRoute.Text = lstDatas.Rows[0]["rot_Name"].ToString();
                lblCustomer.Text = lstDatas.Rows[0]["cus_Name"].ToString();
                lblRemarks.Text = lstDatas.Rows[0]["inh_Remarks"].ToString();
                lblVisitStart.Text = lstDatas.Rows[0]["VisitStart"].ToString();
                lblVisitEnd.Text = lstDatas.Rows[0]["VisitEnd"].ToString();
                lblTransTime.Text = lstDatas.Rows[0]["TransTime"].ToString();
            }
        }
        public void Data()
        {
            DataTable lstdata = ObjclsFrms.loadList("SelectInventoryItem", "sp_Transaction", hid.ToString());
            grvRpt.DataSource = lstdata;
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            Data();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string IID = dataItem.GetDataKeyValue("ini_ID").ToString();

                Response.Redirect("InventoryDetail.aspx?IId=" + IID +"&hid=" +hid );
            }
        }
    }
}