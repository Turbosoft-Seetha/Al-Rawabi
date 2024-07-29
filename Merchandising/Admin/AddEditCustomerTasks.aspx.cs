using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.Admin
{
    public partial class AddEditCustomerTasks : System.Web.UI.Page
    {
        GeneralFunctions ob = new GeneralFunctions();
        //public int ResponseID
        //{
        //    get
        //    {
        //        int ResponseID;
        //        int.TryParse(Request.Params["Id"], out ResponseID);

        //        return ResponseID;
        //    }
        //}
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Route();
                Customer();
                Brand();
            }
            
        }

        public void Route()
        {
            DataTable lstType = ob.loadList("SelectRoute", "sp_CustomerTasks");
            if (lstType.Rows.Count > 0)
            {
                ddlRoute.DataSource = lstType;
                ddlRoute.DataValueField = "rot_ID";
                ddlRoute.DataTextField = "rot_Name";
                ddlRoute.DataBind();
            }

        }
        public void Customer()
        {
            DataTable lstType = ob.loadList("SelectCustomer", "sp_CustomerTasks");
            if (lstType.Rows.Count > 0)
            {
                ddlCus.DataSource = lstType;
                ddlCus.DataValueField = "cus_ID";
                ddlCus.DataTextField = "cus_Name";
                ddlCus.DataBind();
            }

        }
        public void Brand()
        {
            DataTable lstType = ob.loadList("SelectBrand", "sp_CustomerTasks");
            if (lstType.Rows.Count > 0)
            {
                ddlbrd.DataSource = lstType;
                ddlbrd.DataValueField = "brd_ID";
                ddlbrd.DataTextField = "brd_Name";
                ddlbrd.DataBind();
            }

        }
        public void SaveData()
        {
            String name,rot, cus, brd, duedate, desc, remarks, status;
            name = txttask.Text.ToString();
            rot = ddlRoute.SelectedValue.ToString();
            cus = ddlCus.SelectedValue.ToString();
            brd = ddlbrd.SelectedValue.ToString();
            duedate = DateTime.Parse(date.SelectedDate.ToString()).ToString("yyyyMMdd");
            desc = txtDesc.Text.ToString();
            remarks = txtremarks.Text.ToString();
            status = ddlStatus.SelectedValue.ToString();

            try
            {
                //if (ResponseID.Equals("0") || ResponseID == 0)
                //{

                    string[] arr = {rot, cus, brd, duedate, desc, remarks, status };
                    string Value = ob.SaveData("sp_CustomerTasks", "InsertCusTask", name, arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res >=0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Task has been saved sucessfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure('Some Technical Exception are there kindly try again later');</script>", false);
                    }
                //}
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>FailureAlert('We are facing some technical issues, please try again later');</script>", false);

            }
        }
        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void save_Click(object sender, EventArgs e)
        {
            SaveData();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("/Admin/ListCustomerTasks.aspx");

        }

        
    }
}