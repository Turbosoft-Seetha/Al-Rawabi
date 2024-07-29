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
    public partial class ListSpecialPriceDetail : System.Web.UI.Page
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
            HeaderData();
        }
        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelPriceListHeader", "sp_Transaction", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblRoute = (Label)rp.FindControl("lblRoute");

                Label lblstatus = (Label)rp.FindControl("lblstatus");


                rp.Text = "Special Price Code: " + lstDatas.Rows[0]["prh_Code"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["prh_Name"].ToString();

                lblstatus.Text = lstDatas.Rows[0]["Status"].ToString();

            }
        }
        public void LoadList()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("ListPriceListDetail", "sp_Transaction", ResponseID.ToString());
            grvRpt.DataSource = lstUser;
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string hid = ResponseID.ToString();
            Response.Redirect("AddEditSpecialPriceDetail.aspx?Id=" + hid + "&SId=0");
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("pld_ID").ToString();
                ViewState["delID"] = ID;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>delConfim();</script>", false);
            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string id = ViewState["delID"].ToString();
            GeneralFunctions.loadList_Static("DeletePriceListUom", "sp_Transaction", id);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);
        }

        protected void BtnDelConfrm_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}