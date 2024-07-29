using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditAutoUpdate : System.Web.UI.Page
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
            DataTable lstDatas = ObjclsFrms.loadList("SelectAutoUpdateByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, url, code;
                name = lstDatas.Rows[0]["ver_name"].ToString();
                code = lstDatas.Rows[0]["ver_code"].ToString();

                url = lstDatas.Rows[0]["redir_url"].ToString();


                txtcode.Text = code.ToString();
                txtName.Text = name.ToString();
                txtURL.Text = url.ToString();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BO_Digits/en/ListAutoUpdate.aspx");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();

        }
        protected void Save()
        {
            string name, code, url;

            name = txtName.Text.ToString();
            code = txtcode.Text.ToString();

            url = txtURL.Text.ToString();


            if (ResponseID.Equals("") || ResponseID == 0)
            {


                string[] arr = { name.ToString(), url.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertAutoUpdate", code.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Auto Update Saved Successfully');</script>", false);
                }
                else if (res == 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Fail();</script>", false);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = { name.ToString(), url.ToString(), id.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateAutoUpdate", code.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Updated Successfully');</script>", false);
                }
                else if (res == 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Fail();</script>", false);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }
        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BO_Digits/en/ListAutoUpdate.aspx");

        }
    }
}