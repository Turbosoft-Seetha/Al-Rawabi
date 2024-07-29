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
    public partial class DashboardCustomerVisitDetail : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public string TypeID
        {
            get
            {
                string TypeID;
                TypeID = Request.Params["Type"].ToString();

                return TypeID;
            }
        }
        public int DetailID
        {
            get
            {
                int DetailID;
                DetailID = Int32.Parse(Request.Params["Id"].ToString());

                return DetailID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HeaderData();
                if(TypeID.Equals("SO") || TypeID.Equals("MO"))
                {
                    lblTitle.Text = "Customer Visit Out of Stock Detail";
                }
                else
                {
                    lblTitle.Text = "Total Customer Visit Detail";
                }
            }
        }

        public void HeaderData()
        {
            if(TypeID.Equals("SO") || TypeID.Equals("MO"))
            {
                pnlOutStock.Visible = true;
                pnlTotal.Visible = false;
                DataTable lstDatas = new DataTable();
                lstDatas = ObjclsFrms.loadList("DashboardOutStockDetailHeader", "sp_Dashboard", DetailID.ToString());
                if (lstDatas.Rows.Count > 0)
                {
                    RadPanelItem rp = RadPanelBar0.Items[0];
                    Label lblCustomer = (Label)rp.FindControl("lblCustomer");
                    Label lblCreatedDate = (Label)rp.FindControl("lblCreatedDate");
                    Label lblUser = (Label)rp.FindControl("lblUser");
                    Label lblTime = (Label)rp.FindControl("lblCreatedTime");
                    Label lblType = (Label)rp.FindControl("lblType");
                    lblCustomer.Text = lstDatas.Rows[0]["cus_Code"].ToString() + " - " + lstDatas.Rows[0]["cus_Name"].ToString();
                    lblCreatedDate.Text = lstDatas.Rows[0]["Date"].ToString();
                    lblUser.Text = lstDatas.Rows[0]["usr_Name"].ToString();
                    lblTime.Text = lstDatas.Rows[0]["Time"].ToString();
                    lblType.Text = lstDatas.Rows[0]["usr_Type"].ToString();
                }
            }
            else
            {
                pnlOutStock.Visible = false;
                pnlTotal.Visible = true;
                DataTable lstDatas = new DataTable();
                lstDatas = ObjclsFrms.loadList("DashboardUserCustomerDailyProcessHeader", "sp_Dashboard", DetailID.ToString());
                if (lstDatas.Rows.Count > 0)
                {
                    RadPanelItem rp = RadPanelBar0.Items[0];
                    Label lblCustomer = (Label)rp.FindControl("lblCustomer");
                    Label lblCreatedDate = (Label)rp.FindControl("lblCreatedDate");
                    Label lblUser = (Label)rp.FindControl("lblUser");
                    Label lblStartTime = (Label)rp.FindControl("lblStartTime");
                    Label lblEndTime = (Label)rp.FindControl("lblEndTime");
                    Label lblType = (Label)rp.FindControl("lblType");
                    lblCustomer.Text = lstDatas.Rows[0]["cus_Code"].ToString() + " - " + lstDatas.Rows[0]["cus_Name"].ToString();
                    lblCreatedDate.Text = lstDatas.Rows[0]["Date"].ToString();
                    lblUser.Text = lstDatas.Rows[0]["usr_Name"].ToString();
                    lblStartTime.Text = lstDatas.Rows[0]["ucp_CusStartTime"].ToString();
                    lblEndTime.Text = lstDatas.Rows[0]["ucp_CusEndTime"].ToString();
                    lblType.Text = lstDatas.Rows[0]["usr_Type"].ToString();
                }
            }
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (TypeID.Equals("SO") || TypeID.Equals("MO"))
            {
                LoadOutStockList();
            }
            else
            {
                LoadTotalList();
            }
        }

        public void LoadOutStockList()
        {
            DataTable lstDetail = default(DataTable);
            lstDetail = ObjclsFrms.loadList("DashboardOutStockDetail", "sp_Dashboard", DetailID.ToString());
            grvRpt.DataSource = lstDetail;
        }
        public void LoadTotalList()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("DashboardCustomerTotalVisitDetail", "sp_Dashboard", DetailID.ToString());
            grvRpt.DataSource = lstUser;
        }

        protected void grvRpt_PreRender(object sender, EventArgs e)
        {
            grvRpt.MasterTableView.GetColumn("S").Visible = false;
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardDetail.aspx?Type=" + TypeID.ToString());
        }
    }
}