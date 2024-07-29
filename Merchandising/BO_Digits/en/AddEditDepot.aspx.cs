﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditDepot : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Region();
                FillForm();
            }
        }
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);

                return ResponseID;
            }
        }
        public void FillForm()
        {
            DataTable lstDatas = ObjclsFrms.loadList("SelDepotByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string code, name,region;
                name = lstDatas.Rows[0]["dep_Name"].ToString();
                code = lstDatas.Rows[0]["dep_Code"].ToString();
                region = lstDatas.Rows[0]["dep_reg_ID"].ToString();

                txtname.Text = name.ToString();
                txtcode.Text = code.ToString();
                txtcode.Enabled = false;
                ddlRegion.SelectedValue=region.ToString();


            }
        }
        protected void Region()
        {
            DataTable dt = ObjclsFrms.loadList("selectRegionForDropDown", "sp_Masters");
            ddlRegion.DataSource = dt;
            ddlRegion.DataTextField = "reg_Name";
            ddlRegion.DataValueField = "reg_ID";
            ddlRegion.DataBind();
        }
        protected void Save()
        {
            string code, name,region;
            name = txtname.Text.ToString();
            code = txtcode.Text.ToString();
            region = ddlRegion.SelectedValue.ToString();
            if (ResponseID.Equals("") || ResponseID == 0)
            {
                string[] arr = { name ,region};
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertDepot", code, arr);
                int res = Int32.Parse(Value.ToString());
                if (res >= 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Depot Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }


            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = { name, region,id};
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateDepot", code, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Depot Updated Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }
        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListDepot.aspx");

        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListDepot.aspx");

        }

        protected void txtcode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtcode.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckDepotCode", "sp_CodeChecker", code);
            if (lstCodeChecker.Rows.Count > 0)
            {
                lblCodeDupli.Text = "Code Already Exist";
                lnkSave.Enabled = false;
                lblCodeDupli.Visible = true;
            }
            else
            {
                lnkSave.Enabled = true;
                lblCodeDupli.Visible = false;
            }
        }
    }
}