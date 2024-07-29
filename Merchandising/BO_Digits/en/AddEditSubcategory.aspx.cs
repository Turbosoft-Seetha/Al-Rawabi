using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditSubcategory : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Category();
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
        public void Category()
        {
            DataTable dt = ObjclsFrms.loadList("SelCategoryforDropdown", "sp_Masters");
            ddlcat.DataSource = dt;
            ddlcat.DataTextField = "cat_Name";
            ddlcat.DataValueField = "cat_ID";
            ddlcat.DataBind();
        }
        public void FillForm()
        {
            DataTable lstDatas = ObjclsFrms.loadList("SelSubcategoryByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, status, code, arabic,cat;
                name = lstDatas.Rows[0]["sct_Name"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();
                code = lstDatas.Rows[0]["sct_Code"].ToString();
                arabic = lstDatas.Rows[0]["sct_NameArabic"].ToString();
                cat = lstDatas.Rows[0]["sct_cat_ID"].ToString();

                txtCode.Enabled = false;
                txtname.Text = name.ToString();
                ddlStatus.SelectedValue = status.ToString();
                txtCode.Text = code.ToString();
                txtArabicname.Text = arabic.ToString();
                ddlcat.SelectedValue = cat.ToString();
            }
        }
        protected void Save()
        {
            string name, user, status, Code, arabic,cat;
            name = txtname.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            status = ddlStatus.SelectedValue.ToString();
            Code = txtCode.Text.ToString();
            arabic = txtArabicname.Text.ToString();
            cat = ddlcat.SelectedValue.ToString();

            if (ResponseID.Equals("") || ResponseID == 0)
            {
                string[] arr = { user, status, Code, arabic ,cat};
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertIntoSubcategory", name, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Subcategory Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }


            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = { status, id, Code, arabic ,cat};
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateSubcategory", name, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Subcategory Updated Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListSubcategory.aspx");
        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckSubcategoryCode", "sp_CodeChecker", code);
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

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListSubcategory.aspx");
        }
    }
}