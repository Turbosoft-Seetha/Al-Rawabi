﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Merchandising.BO_Digits.en
{
    public partial class ListCustomerBrochure : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Route();
            }
        }
        public void Route()
        {
            DataTable dtp = ObjclsFrms.loadList("SelectRouteDrop", "sp_Masters");
            ddlrot.DataSource = dtp;
            ddlrot.DataTextField = "name";
            ddlrot.DataValueField = "id";
            ddlrot.DataBind();
        }
        public void ListData()
        {

            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectCustomerBrochure", "sp_Masters", ddlrot.SelectedValue.ToString());
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
            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cbr_ID").ToString();
                ViewState["ID"] = ID.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>confirmModal();</script>", false);
            }
        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            ListData();
            grvRpt.Rebind();
        }

        protected void ddlrot_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditCustomerBrochure.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string ID = ViewState["ID"].ToString();
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("DeleteCustomerBrochure", "sp_Masters", ID.ToString());
            if (lstUser.Rows.Count > 0)
            {
                int number = Int32.Parse(lstUser.Rows[0]["number"].ToString());
                if (number == 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomerBrochure.aspx");
        }
    }
}