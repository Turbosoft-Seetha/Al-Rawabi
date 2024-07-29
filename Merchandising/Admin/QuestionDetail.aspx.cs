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
    public partial class QuestionDetail : System.Web.UI.Page
    {
        GeneralFunctions Obj = new GeneralFunctions();

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
                fillForm();
                Route();
            }
        }

        protected void Save()
        {
            string surQuestion, Orders, Mandat, user;
            surQuestion = ddlQtns.SelectedValue.ToString();
            Mandat = ddlMandat.SelectedValue.ToString();
            Orders = txtorder.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            string[] arr = { surQuestion.ToString(), Orders.ToString(), Mandat.ToString(), user.ToString() };

            string Value = Obj.SaveData("sp_Cooler", "AddCoolerDetail", ResponseID.ToString(), arr);
            int res = Int32.Parse(Value.ToString());
            if (res > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
            }
            //grvRpt.DataSource = lstClaim;
            //grvRpt.DataBind();
        }

        protected void fillForm()
        {

            DataTable lstData = default(DataTable);
            lstData = Obj.loadList("SelectSurveyMasterById", "sp_Cooler", ResponseID.ToString());
            if (lstData.Rows.Count > 0)
            {
                string Survey, Number;
                Survey = lstData.Rows[0]["clt_Name"].ToString();
                Number = lstData.Rows[0]["clt_ID"].ToString();
                labelqno.Text = "/" + Number + "/" + Survey;
            }
        }

        public void Route()
        {
            DataTable dt = Obj.loadList("selectTypeQ", "sp_Cooler", ResponseID.ToString());
            ddlQtns.DataSource = dt;
            ddlQtns.DataTextField = "cqm_Question";
            ddlQtns.DataValueField = "cqm_ID";
            ddlQtns.DataBind();
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
                string delID = dataItem.GetDataKeyValue("clq_ID").ToString();
                ViewState["DeleteID"] = delID.ToString();

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Delete();</script>", false);
            }

        }

        public void LoadData()
        {
            DataTable lstList = Obj.loadList("SelectSurveyQuestionById", "sp_Cooler", ResponseID.ToString());
            if (lstList.Rows.Count > 0)
            {
                pnls.Visible = true;
                grvRpt.DataSource = lstList;
            }
            else
            {
                pnls.Visible = false;
            }
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        public void Delete()
        {
            string dID = ViewState["DeleteID"].ToString();
            Obj.loadList("Delete", "sp_Cooler", dID.ToString());
            DataTable lstDelete = Obj.loadList("SelectAssetQuestionByID", "sp_Cooler", dID.ToString());
            if (lstDelete.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>deleteSucces();</script>", false);
            }

        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Delete();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }
    }
}