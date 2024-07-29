using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditCustomer : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Cusheader();
                Class();
                Area();
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
        public void Cusheader()
        {
            DataTable dt = ObjclsFrms.loadList("SelCusheaderforDropdown", "sp_Masters");
            ddlParent.DataSource = dt;
            ddlParent.DataTextField = "csh_Name";
            ddlParent.DataValueField = "csh_ID";
            ddlParent.DataBind();
        }
        public void Class()
        {
            DataTable dt = ObjclsFrms.loadList("SelClassforDropdown", "sp_Masters");
            ddlclass.DataSource = dt;
            ddlclass.DataTextField = "cls_Name";
            ddlclass.DataValueField = "cls_ID";
            ddlclass.DataBind();
        }
        public void Area()
        {
            DataTable dt = ObjclsFrms.loadList("SelAreaforDropdown", "sp_Masters");
            ddlarea.DataSource = dt;
            ddlarea.DataTextField = "are_Name";
            ddlarea.DataValueField = "are_ID";
            ddlarea.DataBind();
        }
        public void FillForm()
        {
            DataTable lstDatas = ObjclsFrms.loadList("SelCustomerByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string code, name, arabic, Shortname, Parentcompany, Address , Mobile, Email, GeoCode, RecaptureGeoCode , status , Class , Area;

                code = lstDatas.Rows[0]["cus_Code"].ToString();
                name = lstDatas.Rows[0]["cus_Name"].ToString();
                arabic = lstDatas.Rows[0]["cus_NameArabic"].ToString();
                Shortname = lstDatas.Rows[0]["cus_ShortName"].ToString();
                Parentcompany = lstDatas.Rows[0]["cus_csh_ID"].ToString();
                Address = lstDatas.Rows[0]["cus_Address"].ToString();
                Mobile = lstDatas.Rows[0]["cus_Mobile"].ToString();
                Email = lstDatas.Rows[0]["cus_Email"].ToString();
                GeoCode = lstDatas.Rows[0]["cus_GeoLoc"].ToString();
                RecaptureGeoCode = lstDatas.Rows[0]["cus_RecaptureGeo"].ToString();
                Class = lstDatas.Rows[0]["cus_cls_ID"].ToString();
                Area = lstDatas.Rows[0]["cus_are_ID"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();
              

                txtCode.Enabled = false;
                txtCode.Text = code.ToString();
                txtname.Text = name.ToString();
                txtArabicname.Text = arabic.ToString();
                txtshortname.Text = Shortname.ToString();
                ddlParent.SelectedValue = Parentcompany.ToString();
                txtAddress.Text = Address.ToString();
                txtmobile.Text = Mobile.ToString();
                txtemail.Text = Email.ToString();
                txtgeocode.Text = GeoCode.ToString();
                ddlrecapture.SelectedValue = RecaptureGeoCode.ToString();
                ddlclass.SelectedValue = Class.ToString();
                ddlarea.SelectedValue = Area.ToString();
                ddlStatus.SelectedValue = status.ToString();
               
               
            }
        }
        protected void Save()
        {
            string code, name, arabic, Shortname, Parentcompany, Address, Mobile, Email, GeoCode, RecaptureGeoCode, status, Class, Area, user;

            code = txtCode.Text.ToString();
            name = txtname.Text.ToString();
            arabic = txtArabicname.Text.ToString();
            Shortname = txtshortname.Text.ToString();
            Parentcompany = ddlParent.SelectedValue.ToString();
            Address = txtAddress.Text.ToString();
            Mobile = txtmobile.Text.ToString();
            Email = txtemail.Text.ToString();
            GeoCode = txtgeocode.Text.ToString();
            RecaptureGeoCode = ddlrecapture.SelectedValue.ToString();
            Class = ddlclass.SelectedValue.ToString();
            Area = ddlarea.SelectedValue.ToString();
            status = ddlStatus.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();


            if (ResponseID.Equals("") || ResponseID == 0)
            {
                string[] arr = { code, arabic, Shortname, Parentcompany, Address, Mobile, Email, GeoCode, RecaptureGeoCode, status, Class, Area, user };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertIntoCustomer", name, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }


            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = { code, arabic, Shortname, Parentcompany, Address, Mobile, Email, GeoCode, RecaptureGeoCode, status, Class, Area, user ,id };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateCustomers", name, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Updated Successfully');</script>", false);
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
            Response.Redirect("ListCustomer.aspx");
        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckCustomerCode", "sp_CodeChecker", code);
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
            Response.Redirect("ListCustomer.aspx");
        }
    }
}