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
    public partial class ListQuestionMaster : System.Web.UI.Page
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

       

        public void ListData()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelCoolerMaster", "sp_Cooler", ResponseID.ToString());
            if (lstUser.Rows.Count >= 0)
            {
                grvRpt.DataSource = lstUser;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               
            }

        }

        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AddEditQuestions.aspx");
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
                string ID = dataItem.GetDataKeyValue("cqm_ID").ToString();
                Response.Redirect("AddEditQuestions.aspx?Id=" + ID );
            }
            


        }
    }
}