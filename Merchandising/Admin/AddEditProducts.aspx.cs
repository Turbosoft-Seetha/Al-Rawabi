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
    public partial class AddEditProducts : System.Web.UI.Page
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
                Category();
                fillForm();
                
                Brand();
                ViewState["claimID"] = null;
                
                Uom();
                fillForm();
            }
        }
        protected void fillForm()
        {
            if (ResponseID == 0)
            {

            }
            else
            {
                DataTable lstData = default(DataTable);
                lstData = ObjclsFrms.loadList("SelectProductsByID", "sp_Masters_Temp", ResponseID.ToString());
                if (lstData.Rows.Count > 0)
                {
                    string name, status, code, cat, sub, brd;

                    name = lstData.Rows[0]["prd_Name"].ToString();
                    code = lstData.Rows[0]["prd_Code"].ToString();
                    
                    status = lstData.Rows[0]["Status"].ToString();
                    cat = lstData.Rows[0]["prd_cat_ID"].ToString();
                    SubCategory(cat.ToString());
                    sub = lstData.Rows[0]["prd_sct_ID"].ToString();
                    brd = lstData.Rows[0]["prd_brd_ID"].ToString();

                    txtName.Text = name.ToString();
                    txtCode.Text = code.ToString();
                    
                    ddlStatus.SelectedValue = status.ToString();
                    ddlCateory.SelectedValue = cat.ToString();
                    ddlSubCat.SelectedValue = sub.ToString();
                    ddlBrand.SelectedValue = brd.ToString();
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                if (ResponseID == 0)
                {
                    string mode = "I";
                    Save(mode);
                }
                else
                {
                    string mode = "U";
                    Save(mode);
                }
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditProducts.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }
        protected void Save(string mode)
        {
            string user, name, status, code,cat,sub,brd;
            name = txtName.Text.ToString();
            status = ddlStatus.SelectedValue.ToString();
            
            user = UICommon.GetCurrentUserID().ToString();
            code = txtCode.Text.ToString();
            cat = ddlCateory.SelectedValue.ToString();
            sub = ddlSubCat.SelectedValue.ToString();
            brd = ddlBrand.SelectedValue.ToString();

            if (mode.Equals("I"))
            {
                string[] arr = {  user.ToString(), status.ToString(), code.ToString(),cat.ToString(),sub.ToString(),brd.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters_Temp","InsertProducts",  name.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                ViewState["pid"] = res.ToString();
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
                string id = ResponseID.ToString();
                string[] arr = { name.ToString(),  user.ToString(), status.ToString(), code.ToString(),cat.ToString(),sub.ToString(),brd.ToString()};
                string Value = ObjclsFrms.SaveData("sp_Masters_Temp", "UpdateProducts", id.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
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

        public void SaveDat()

        {
            string stdprice, UPC, Default, ID, uom,rtnprice;
            uom = ddlUom.SelectedValue.ToString();
            stdprice = txtStdPrice.Text.ToString();
            UPC = txtupc.Text.ToString();
            rtnprice = txtrtnPrice.Text.ToString();
            Default = ddlDefault.SelectedValue.ToString();
            ID = ResponseID.ToString();
            string[] arr = { stdprice, UPC, Default, ID,rtnprice };
            string value = ObjclsFrms.SaveData("sp_Masters_Temp", "InsertUOM", uom, arr);
            int res = Int32.Parse(value.ToString());
            if (res > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succces('Uom has been added sucessfully');</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
            }
        }

        public void Uom()
        {
            string ID = ResponseID.ToString();
            DataTable dt = ObjclsFrms.loadList("SelectUomFromDrop", "sp_Masters_Temp", ID);
            ddlUom.DataSource = dt;
            ddlUom.DataTextField = "uom_Name";
            ddlUom.DataValueField = "uom_ID";
            ddlUom.DataBind();
        }
        protected void btnOK_Click(object sender, EventArgs e)
        {
            string ID;
            if (ResponseID.Equals("0") || ResponseID == 0)
            {
                ID = ViewState["pid"].ToString();
            }
            else
            {
                ID = ResponseID.ToString();
            }

            Response.Redirect("/Admin/AddEditProducts.aspx?Id=" + ID);
        }

        public void LoadData()
        {
            string pid = ResponseID.ToString();
            DataTable lstDatas = default(DataTable);
            lstDatas = ObjclsFrms.loadList("ListUomProducts", "sp_Masters_Temp", pid);
            if (lstDatas.Rows.Count >= 0)
            {
                grvRpt.DataSource = lstDatas;
                //pnls.Visible = true;
            }
            else
            {
                // pnls.Visible = false;
            }
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void ddlCateory_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string category = ddlCateory.SelectedValue.ToString();
            ddlSubCat.DataSource = "";
            ddlSubCat.DataBind();
            SubCategory(category);
        }

        public void Category()
        {
            DataTable dt = ObjclsFrms.loadList("SelectCategoryForProducts", "sp_Masters_Temp");
            ddlCateory.DataSource = dt;
            ddlCateory.DataTextField = "cat_Name";
            ddlCateory.DataValueField = "cat_ID";
            ddlCateory.DataBind();
        }

        public void SubCategory(string category)
        {
            DataTable dts = ObjclsFrms.loadList("SelectSubCategoryForProducts", "sp_Masters_Temp", category.ToString());
            ddlSubCat.DataSource = dts;
            ddlSubCat.DataTextField = "sct_Name";
            ddlSubCat.DataValueField = "sct_ID";
            ddlSubCat.DataBind();
        }

        public void Brand()
        {
            DataTable dtb = ObjclsFrms.loadList("SelectBrandForProducts", "sp_Masters_Temp");
            ddlBrand.DataSource = dtb;
            ddlBrand.DataTextField = "brd_Name";
            ddlBrand.DataValueField = "brd_ID";
            ddlBrand.DataBind();
        }

        protected void BtnConfim_Click(object sender, EventArgs e)
        {
            SaveDat();
            LoadData();
            grvRpt.DataBind();
        }

        protected void Okbtn_Click(object sender, EventArgs e)
        {
            string ID;
            if (ResponseID.Equals("0") || ResponseID == 0)
            {
                ID = ViewState["pid"].ToString();
            }
            else
            {
                ID = ResponseID.ToString();
            }

            Response.Redirect("/Admin/AddEditProducts.aspx?Id=" + ID);
        }

        protected void BtnConfrmDelete_Click(object sender, EventArgs e)
        {
            string id = ViewState["delID"].ToString();
            GeneralFunctions.loadList_Static("DeleteItemUom", "sp_Masters_Temp", id);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>succesModal();</script>", false);

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadData();

        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("pum_ID").ToString();
                ViewState["delID"] = ID;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>delConfim();</script>", false);
            }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            SaveDat();

        }
    }
}