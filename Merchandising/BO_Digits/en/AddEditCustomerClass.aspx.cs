using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditCustomerClass : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CusCat();
                FillForm();
            }
        }
        public void CusCat()
        {
            DataTable dt = ObjclsFrms.loadList("SelCusCatFromDrop", "sp_Masters");
            ddlcuscat.DataSource = dt;
            ddlcuscat.DataTextField = "cuc_Name";
            ddlcuscat.DataValueField = "cuc_ID";
            ddlcuscat.DataBind();
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
            DataTable lstDatas = ObjclsFrms.loadList("SelCustomerClassByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, arabic, status,code,cuscat;
                code = lstDatas.Rows[0]["cls_Code"].ToString();
                name = lstDatas.Rows[0]["cls_Name"].ToString();
                arabic = lstDatas.Rows[0]["cls_NameArabic"].ToString();
                cuscat = lstDatas.Rows[0]["cls_cuc_ID"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();

                txtname.Text = name.ToString();
                txtcode.Text = code.ToString();
                txtarabic.Text = arabic.ToString();
                ddlStatus.SelectedValue = status.ToString();
                ddlcuscat.SelectedValue = cuscat.ToString();
                txtcode.Enabled = false;

            }
        }
        protected void Save()
        {
            string name, arabic, user, status,code,cuscat;
            name = txtname.Text.ToString();
            arabic = txtarabic.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            code= txtcode.Text.ToString();
            cuscat = ddlcuscat.SelectedValue.ToString();
            status = ddlStatus.SelectedValue.ToString();
            if (ResponseID.Equals("") || ResponseID == 0)
            {
                string[] arr = { arabic, user, status,code,cuscat };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertCustomerClass", name, arr);
                int res = Int32.Parse(Value.ToString());
                if (res >= 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Class Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }


            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = { arabic, status, id,cuscat };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateCustomerClass", name.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Class Updated Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomerClass.aspx");

        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void txtcode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtcode.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckCustomerClass", "sp_CodeChecker", code);
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
            Response.Redirect("ListCustomerClass.aspx");

        }
    }
}