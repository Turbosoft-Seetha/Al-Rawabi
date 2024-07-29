using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditSpecialPriceDetail : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["SId"], out ResponseID);
                return ResponseID;
            }
        }

        public int HeaderID
        {
            get
            {
                int HeaderID;
                int.TryParse(Request.Params["Id"], out HeaderID);
                return HeaderID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                product();
            }
        }
        public void Uom()
        {
            string[] arr = { HeaderID.ToString() };

            DataTable ds = ObjclsFrms.loadList("SelectUomForDrop", "sp_Transaction", ddlp.SelectedValue.ToString(), arr);
            ddlUom.DataSource = ds;
            ddlUom.DataTextField = "uom_Name";
            ddlUom.DataValueField = "uom_ID";
            ddlUom.DataBind();
        }



        public void product()
        {
            DataTable dt = ObjclsFrms.loadList("SelectFromDropProductID", "sp_Transaction", HeaderID.ToString());
            ddlp.DataSource = dt;
            ddlp.DataTextField = "prd_Name";
            ddlp.DataValueField = "prd_ID";
            ddlp.DataBind();
        }
        public void SaveData()
        {

            string pname, vat, user, Status, uom, price;                                          //Declare the variables


            pname = ddlp.SelectedValue.ToString();
            //caseprice = txtcase.Text.ToString();
            //piece = txtPiece.Text.ToString();
            vat = txtvat.Text.ToString();
            uom = ddlUom.SelectedValue.ToString();
            price = txtprice.Text.ToString();

            user = UICommon.GetCurrentUserID().ToString();
            Status = ddlstatus.SelectedValue.ToString();

            if (ResponseID.Equals("0") || ResponseID == 0)
            {
                string[] arr = { pname.ToString(), vat.ToString(), user.ToString(), Status.ToString(), uom.ToString(), price.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Transaction", "InsertPriceListDetail", HeaderID.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Special Price Detail Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }

        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim('');</script>", false);
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListSpecialPriceDetail.aspx?Id=" + HeaderID);
        }

        protected void ddlp_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Uom();
        }

        protected void Confrmsave_Click(object sender, EventArgs e)
        {
            SaveData();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListSpecialPriceDetail.aspx?Id=" + HeaderID);
        }
    }
}