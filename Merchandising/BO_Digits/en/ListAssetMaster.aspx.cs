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
    public partial class ListAssetMaster : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int CustomerID
        {
            get
            {
                int CustomerID;
                int.TryParse(Request.Params["CId"], out CustomerID);

                return CustomerID;
            }
        }
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
                if (Mode == 1)
                {
                    lnkAddUser.Visible = false;
                }
                else
                {
                    lnkAddUser.Visible=true;
               
                Customer();
                }
            }
        }
        public void Customer()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectCustomerName", "sp_Masters", CustomerID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                string name = lstUser.Rows[0]["cus_Name"].ToString();
                ltrlCustomer.Text = name.ToString();
            }
        }
        public void ListData()
        {
            DataTable lstUser = default(DataTable);
            if (Mode == 1)
            {
                string fromdate, todate;

                fromdate = DateTime.Parse(Session["FromDate"].ToString()).ToString("yyyyMMdd");
                todate = DateTime.Parse(Session["ToDate"].ToString()).ToString("yyyyMMdd");
                string[] arr = { todate };

                lstUser = ObjclsFrms.loadList("SelectCoolerMasterFromDashboard", "sp_Masters", fromdate, arr);
            }
            else
            {


                lstUser = ObjclsFrms.loadList("SelectCoolerMaster", "sp_Masters", CustomerID.ToString());
            }
            if (lstUser.Rows.Count > 0)
            {
                grvRpt.DataSource = lstUser;
            }
        }
        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditAssetMaster.aspx?CId=" + CustomerID.ToString() + "&Id=0" );
            
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("clm_ID").ToString();
                Response.Redirect("AddEditAssetMaster.aspx?CId=" + CustomerID.ToString() + "&Id=" + ID);
            }
        }
    }
}