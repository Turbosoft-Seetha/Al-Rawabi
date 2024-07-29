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
    public partial class AddEditCoolerType : System.Web.UI.Page
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
                ViewState["claimID"] = null;
                ViewState["planogram"] = null;
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
                lstData = ObjclsFrms.loadList("SelectCoolerTypeByID", "sp_Masters", ResponseID.ToString());
                if (lstData.Rows.Count > 0)
                {
                    string name, planogram, status, capacity;

                    name = lstData.Rows[0]["clt_Name"].ToString();
                    planogram = lstData.Rows[0]["clt_Planogram"].ToString();
                    capacity = lstData.Rows[0]["clt_Capacity"].ToString();
                    status = lstData.Rows[0]["Status"].ToString();

                    txtName.Text = name.ToString();

                    //txtCapacity.Text = capacity.ToString();
                    ddlStatus.SelectedValue = status.ToString();
                    hpl1.NavigateUrl = planogram.ToString();
                    hlval1.Value = ResponseID.ToString();
                    img1.ImageUrl = planogram.ToString();
                    ViewState["planogram"] = planogram.ToString();
                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCoolerType.aspx");

        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCoolerType.aspx");

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
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditCoolerType.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }
        protected void Save(string mode)
        {
            string user, name, status, planogram, capacity;
            name = txtName.Text.ToString();
          
           // capacity = txtCapacity.Text.ToString();

            planogram = "";

            status = ddlStatus.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            int ImageID = 0;
            foreach (UploadedFile uploadedFile in upd1.UploadedFiles)
            {
                ImageID += 1;
                string csvPath = Server.MapPath(("..") + @"/../UploadFiles/Planogram/") + ImageID.ToString() + "_" + uploadedFile.FileName;
                uploadedFile.SaveAs(csvPath);
                planogram = @"../../UploadFiles/Planogram/" + ImageID.ToString() + "_" + uploadedFile.FileName.ToString();
                ViewState["Image"] = planogram.ToString();
            }
            if (planogram == "")
            {
                planogram = ViewState["planogram"].ToString();
            }
            else
            {
                planogram = ViewState["Image"].ToString();
            }

            if (planogram != null)
            {
                if (mode.Equals("I"))
                {
                    string[] arr = { planogram.ToString(),  user.ToString(), status.ToString() };

                    string Value = ObjclsFrms.SaveData("sp_Masters", "InsertCoolerType", name.ToString(), arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Asset type has been saved successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                    }
                }
                else
                {
                    string id = ResponseID.ToString();
                    string[] arr = { name.ToString(), planogram.ToString(),  user.ToString(), status.ToString() };
                    string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateCoolerType", id.ToString(), arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Asset type has been updated successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                    }
                }
            }
            //else
            //{
            //    //Show th failure alert
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);


            //}

        }
    }
}