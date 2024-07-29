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
    public partial class ListAssignedSurvey : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }
        public void ListData()
        {
            DataTable lstUser = default(DataTable);
            string fromdate, todate;

            fromdate = DateTime.Parse(Session["FromDate"].ToString()).ToString("yyyyMMdd");
            todate = DateTime.Parse(Session["ToDate"].ToString()).ToString("yyyyMMdd");
            string[] arr = { todate };

            lstUser = ObjclsFrms.loadList("SelectAssignedSurvey", "sp_Survey", fromdate, arr);
            if (lstUser.Rows.Count >= 0)
            {
                grvRpt.DataSource = lstUser;
            }
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }
    }
}