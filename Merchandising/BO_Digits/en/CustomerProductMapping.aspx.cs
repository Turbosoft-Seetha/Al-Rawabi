using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class CustomerProductMapping : System.Web.UI.Page
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
                Customer();
                ProMap();
            }
        }
        public void ProMap()
        {

            DataTable dt = ObjclsFrms.loadList("SelProductMappingGroupfordrop", "sp_Masters", ResponseID.ToString());
            rdPromapping.DataSource = dt;
            rdPromapping.DataTextField = "pmg_Name";
            rdPromapping.DataValueField = "pmg_ID";
            rdPromapping.DataBind();
        }

        public void Customer()
        {
            DataTable dt = ObjclsFrms.loadList("Customer", "sp_Masters", ResponseID.ToString());
            if (dt.Rows.Count > 0)
            {

                string cusname = dt.Rows[0]["cus_Name"].ToString();
                custname.Text = "Customer Name : " + cusname;


            }
            else
            {
                custname.Text = "No Product Mapping Existing ....";
            }

        }
        public void ListProduct(string pmgid)
        {

            DataTable dts = ObjclsFrms.loadList("SelProductByPgmID", "sp_Masters", pmgid);
            if (dts.Rows.Count >= 0)
            {
                grvRpt.DataSource = dts;
                ViewState["isdetail"] = dts;

            }
        }
        public void List()
        {

            DataTable lstdata = ObjclsFrms.loadList("SelCustomerProductMappingGroup", "sp_Masters", ResponseID.ToString());
            if (lstdata.Rows.Count > 0)
            {

                ViewState["flag"] = 1;
                string pmgid = lstdata.Rows[0]["cpm_pmg_ID"].ToString();
                string pmgname = lstdata.Rows[0]["pmg_Name"].ToString();
                Progrp.Text = "Product Mapping Group : " + pmgname;
                ListProduct(pmgid);
            }
            else
            {
                ViewState["flag"] = 0;
                if (lstdata.Rows.Count == 0)
                {
                    grvRpt.DataSource = lstdata;
                }
            }



        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            List();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void rdPromapping_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            string pmg = rdPromapping.SelectedValue.ToString();
            ListProduct(pmg);
            grvRpt.Rebind();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomer.aspx?Id=" + ResponseID.ToString());
        }

        protected void BtncnfrmSave_Click(object sender, EventArgs e)
        {
            string f = ViewState["flag"].ToString();
            string user = UICommon.GetCurrentUserID().ToString();
            if (f.Equals("1"))
            {
                string[] arr = { rdPromapping.SelectedValue.ToString(), user.ToString() };
                string value = ObjclsFrms.SaveData("sp_Masters", "UpdateCustomerProductsMapping", ResponseID.ToString(), arr);
                int res = Int32.Parse(value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
            else
            {
                string[] arr = { rdPromapping.SelectedValue.ToString(), user.ToString() };
                string value = ObjclsFrms.SaveData("sp_Masters", "InsertCustomerProductsMapping", ResponseID.ToString(), arr);
                int res = Int32.Parse(value.ToString());
                if (res > 0)
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
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}