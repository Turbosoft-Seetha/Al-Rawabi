using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using Telerik.Web.UI;

namespace Merchandising.Admin
{
    public partial class Users : System.Web.UI.Page
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
            lstUser = ObjclsFrms.loadList("SelectUser", "sp_Masters");
            grvRpt.DataSource = lstUser;
        }

        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AddEditUser.aspx");
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Roles"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("UserId").ToString();
                Response.Redirect("UserRoles.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("UserId").ToString();
                Response.Redirect("AddEditUser.aspx?Id=" + ID);
            }
        }

        protected void lnkReSqlJob_Click(object sender, EventArgs e)
        {
            DataTable lstJob = ObjclsFrms.loadList("RunStartJob", "sp_StartJob");
            if (lstJob.Rows.Count > 0)
            {
                int flag;
                string title, description;
                flag = Int32.Parse(lstJob.Rows[0]["Flag"].ToString());
                title = lstJob.Rows[0]["Title"].ToString();
                description = lstJob.Rows[0]["Res"].ToString();

                if(flag == 1)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('" + description.ToString() + "');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal('" + description.ToString() + "');</script>", false);
                }
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}