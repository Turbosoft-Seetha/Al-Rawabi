using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class ListOppDocuments : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int OppID
        {
            get
            {
                int OppID;
                int.TryParse(Request.Params["Id"], out OppID);

                return OppID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Opportunity();
            }
        }
        public void Opportunity()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectOpportunityName", "sp_Masters", OppID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                string name = lstUser.Rows[0]["opt_cus_Name"].ToString();
                ltrlOpp.Text = name.ToString();
            }
        }
        public void ListData()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("OppDocuments", "sp_Masters", OppID.ToString());
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