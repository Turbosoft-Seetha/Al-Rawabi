using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditReason : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
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
            DataTable lstDatas = ObjclsFrms.loadList("EditReason", "sp_Masters_Temp", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, type, status,arabic;
                name = lstDatas.Rows[0]["rsn_Name"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();
                type = lstDatas.Rows[0]["rsn_Type"].ToString();
                arabic = lstDatas.Rows[0]["rsn_NameArabic"].ToString();

                txtname.Text = name.ToString();
                ddltype.SelectedValue = type.ToString();
                ddlStatus.SelectedValue = status.ToString();
                txtarabic.Text = arabic.ToString();
            }
        }
        protected void Save()
        {
            string name, type, user, status,arabic;
            name = txtname.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            type = ddltype.SelectedValue.ToString();
            status = ddlStatus.SelectedValue.ToString();
            arabic = txtarabic.Text.ToString();
            if (ResponseID.Equals("") || ResponseID == 0)
            {


                string[] arr = { type.ToString(), user.ToString(), status.ToString() ,arabic};
                string Value = ObjclsFrms.SaveData("sp_Masters_Temp", "InsertReason", name.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Reason Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
            else
            {
                string id = ResponseID.ToString();
                string[] arr = { type.ToString(), status.ToString(), id.ToString() ,arabic};
                string Value = ObjclsFrms.SaveData("sp_Masters_Temp", "UpdateReason", name.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Reason Updated Successfully');</script>", false);
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
            Response.Redirect("ListReasonMaster.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListReasonMaster.aspx");
        }
    }
}