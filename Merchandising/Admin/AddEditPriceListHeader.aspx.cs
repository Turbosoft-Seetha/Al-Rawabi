using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.Admin
{
    public partial class AddEditPriceList : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();

        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);

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
        protected void Save()
        {
            string name, code, user, status;

            name = txtname.Text.ToString();
            code = txtcode.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            status = ddlStatus.SelectedValue.ToString();


            if (ResponseID.Equals("") || ResponseID == 0)
            {


                string[] arr = { code, user, status };
                string Value = ObjclsFrms.SaveData("sp_Transaction", "InsertPriceListHeader", name, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess(' Price List Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = { code.ToString(), status.ToString(), id.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Transaction", "UpdatePriceListHeader", name.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('  Price List Updated Successfully');</script>", false);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }

        protected void Button1Save_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);


        }

        protected void Button2Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/ListPriceListHeader.aspx");
        }

        protected void confrmsave_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/ListPriceListHeader.aspx");
        }
    }
}