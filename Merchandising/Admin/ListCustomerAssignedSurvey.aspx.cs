using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.Admin
{
    public partial class ListCustomerAssignedSurvey : System.Web.UI.Page
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
            
            }
        }
        public void ListData()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectCustomerAssignedSurvey", "sp_Masters", ResponseID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                string customer = lstUser.Rows[0]["cus_Name"].ToString();
                lblCustomer.Text = "Customer : " + customer.ToString();
                grvRpt.DataSource = lstUser;
            }
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }
    }
}