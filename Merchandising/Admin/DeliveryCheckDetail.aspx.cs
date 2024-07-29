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
    public partial class DeliveryCheckDetail : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);

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

        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelectDeliveryCheckHeader", "sp_Transaction_UOM", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblUser = (Label)rp.FindControl("lblUser");
                Label lblRoute = (Label)rp.FindControl("lblRoute");
                Label lblTransaction = (Label)rp.FindControl("lblTransaction");
                Label lblCustomer = (Label)rp.FindControl("lblCustomer");
                Label lblDate = (Label)rp.FindControl("lblDate");
                Label lblDelivered = (Label)rp.FindControl("lblDelivered");
                Label lblStatus = (Label)rp.FindControl("lblStatus");

                lblUser.Text = lstDatas.Rows[0]["usr_Name"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["rot_Name"].ToString();
                lblTransaction.Text = lstDatas.Rows[0]["dch_TransNumber"].ToString();
                lblCustomer.Text = lstDatas.Rows[0]["cus_Name"].ToString();
                lblDate.Text = lstDatas.Rows[0]["dch_DeliveryDate"].ToString();
                lblDelivered.Text = lstDatas.Rows[0]["dch_DeliveredBy"].ToString();
                lblStatus.Text = lstDatas.Rows[0]["dch_CompleteStatus"].ToString();
            }
        }

        public void Data()
        {
            DataTable lstdata = ObjclsFrms.loadList("SelectDeliveryCheckDetail", "sp_Transaction_UOM", ResponseID.ToString());
            grvRpt.DataSource = lstdata;
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            Data();
        }

        protected void imgExcel_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}