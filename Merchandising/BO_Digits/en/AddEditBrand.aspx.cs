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
    public partial class AddEditBrand : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["RefImage"] = null;
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
            DataTable lstDatas = ObjclsFrms.loadList("SelBrandByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, status, code, arabic,img;
                name = lstDatas.Rows[0]["brd_Name"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();
                code = lstDatas.Rows[0]["brd_Code"].ToString();
                arabic = lstDatas.Rows[0]["brd_NameArabic"].ToString();
                img = lstDatas.Rows[0]["brd_Image"].ToString();

                txtCode.Enabled = false;
                txtname.Text = name.ToString();
                ddlStatus.SelectedValue = status.ToString();
                txtCode.Text = code.ToString();
                txtArabicname.Text = arabic.ToString();

                hpl1.NavigateUrl = img.ToString();
                hlval1.Value = ResponseID.ToString();
                img1.ImageUrl = img.ToString();
                ViewState["RefImage"] = img.ToString();
            }
        }
        protected void Save()
        {
            string name, user, status, Code, arabic,img;
            name = txtname.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            status = ddlStatus.SelectedValue.ToString();
            Code = txtCode.Text.ToString();
            arabic = txtArabicname.Text.ToString();
            img = "";
            int ImageID = 0;
            foreach (UploadedFile uploadedFile in upd1.UploadedFiles)
            {
                ImageID += 1;
                string csvPath = Server.MapPath(("..") + @"/../Media/") + ImageID.ToString() + "_" + uploadedFile.FileName;
                uploadedFile.SaveAs(csvPath);
                img = @"/Media/" + ImageID.ToString() + "_" + uploadedFile.FileName.ToString();
                ViewState["Image"] = img.ToString();
            }
            if (img == "")
            {
                img = ViewState["RefImage"].ToString();
            }
            else
            {
                img = ViewState["Image"].ToString();
            }
            if (img != null)
            {
                if (ResponseID.Equals("") || ResponseID == 0)
                {
                    string[] arr = { user, status, Code, arabic, img };
                    string Value = ObjclsFrms.SaveData("sp_Masters", "InsertIntoBrand", name, arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Brand Saved Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }


                }

                else
                {
                    string id = ResponseID.ToString();
                    string[] arr = { status, id, Code, arabic,img };
                    string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateBrand", name, arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)

                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Brand Updated Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
            }
        }
        protected void lnkSave_Click(object sender, EventArgs e)
        {

            if ((upd1.UploadedFiles.Count == 0) && (ViewState["RefImage"] == null))
            {


                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failModal();</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
            }
        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckBrandCode", "sp_CodeChecker", code);
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
            Response.Redirect("ListBrand.aspx");
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListBrand.aspx");
        }
    }
}