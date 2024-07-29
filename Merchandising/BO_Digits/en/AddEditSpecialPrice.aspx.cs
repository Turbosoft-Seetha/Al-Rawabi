using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditSpecialPrice : System.Web.UI.Page
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
                FillForm();
            }
        }
        public void FillForm()
        {
            if (ResponseID.Equals("") || ResponseID == 0)
            {
                divcode.Visible = false;
            }
            else
            {
               
                DataTable lstDatas = ObjclsFrms.loadList("editPriceListHeader", "sp_Transaction", ResponseID.ToString());
                if (lstDatas.Rows.Count > 0)
                {
                    string name, status, code;
                    name = lstDatas.Rows[0]["prh_Name"].ToString();
                    code = lstDatas.Rows[0]["prh_Code"].ToString();

                    status = lstDatas.Rows[0]["Status"].ToString();


                    txtcode.Text = code.ToString();
                    txtname.Text = name.ToString();
                    ddlStatus.SelectedValue = status.ToString();
                }
            }
           
        }
        protected void Save()
        {
            string name, code, user, status;

            name = txtname.Text.ToString();
            code = txtcode.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            status = ddlStatus.SelectedValue.ToString();


            if (ResponseID.Equals("") || ResponseID == 0)
            {


                string[] arr = {user, status };
                string Value = ObjclsFrms.SaveData("sp_Transaction", "InsertPriceListHeader", name, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Special Price Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = {status, id };
                string Value = ObjclsFrms.SaveData("sp_Transaction", "UpdatePriceListHeader", name, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Special price Updated Successfully');</script>", false);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }


        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListSpecialPrice.aspx");
        }

        protected void confrmsave_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListSpecialPrice.aspx");
        }
    }
}