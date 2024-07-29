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
    public partial class AddEditCusRoute : System.Web.UI.Page
    {
        GeneralFunctions ob = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["CID"], out ResponseID);
                return ResponseID;
            }
        }
        public int RouteID
        {
            get
            {
                int RouteID;
                int.TryParse(Request.Params["RID"], out RouteID);
                return RouteID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                Route();
                Customer();


                string Id = ResponseID.ToString();
                if (Id.Equals("") || Id == "0")                                //To check whether there is a value for ResponseID or not. For adding there won't be a value.
                {

                    CustomerwithoutRoute();
                }
                else                                                                        //If we are editing there will be a value and the following code will be executed.
                {
                    
                    DataTable lstDatas = ob.loadList("EditCusRoute", "sp_Masters", ResponseID.ToString());
                    if (lstDatas.Rows.Count > 0)
                    {
                        Customer();

                        string rot,rotname, cus, IsInvoicing, IsSO, IsMerchandising, IsAR, IsI_Sales, IsI_GR, IsI_BR, IsI_FG, TCL, UCL, CDays, VoidEnable, EditEnable, StockEnable, PT, Sign, RoundAmount,
                        IsVAT, IsIDraft, IsPO, cusType, ACL, signatureinvoice, Remark, signatureAR, reamarkAR, remarkOS,
                        selectiontype,radius,Orderpro,IsHold,Invoice,MandColumns;
                        

                        rot = lstDatas.Rows[0]["rcs_rot_ID"].ToString();
                        rotname= lstDatas.Rows[0]["rot_Name"].ToString();
                        cus = lstDatas.Rows[0]["cus_ID"].ToString();
                        IsInvoicing = lstDatas.Rows[0]["IsInvoicing"].ToString();
                        IsSO = lstDatas.Rows[0]["IsSalesOrder"].ToString();
                        IsMerchandising = lstDatas.Rows[0]["IsMerchandising"].ToString();
                        IsAR = lstDatas.Rows[0]["IsAR"].ToString();
                        IsI_Sales = lstDatas.Rows[0]["IsInvoicing_Sales"].ToString();
                        IsI_GR = lstDatas.Rows[0]["IsInvoicing_GR"].ToString();
                        IsI_BR = lstDatas.Rows[0]["IsInvoicing_BR"].ToString();
                        IsI_FG = lstDatas.Rows[0]["IsInvoicing_FG"].ToString();
                        TCL = lstDatas.Rows[0]["rcs_TotalCreditLimit"].ToString();
                        UCL = lstDatas.Rows[0]["rcs_UsedCreditLimit"].ToString();
                        CDays = lstDatas.Rows[0]["rcs_CreditDays"].ToString();
                        VoidEnable = lstDatas.Rows[0]["rcs_VoidEnable"].ToString();
                        EditEnable = lstDatas.Rows[0]["rcs_EditEnable"].ToString();
                        StockEnable = lstDatas.Rows[0]["rcs_StockEnable"].ToString();
                        PT = lstDatas.Rows[0]["rcs_PaymentTerms"].ToString();
                        Sign = lstDatas.Rows[0]["rcs_Signature"].ToString();
                        RoundAmount = lstDatas.Rows[0]["rcs_RoundAmount"].ToString();
                        IsVAT = lstDatas.Rows[0]["rcs_IsVAT"].ToString();
                        IsIDraft = lstDatas.Rows[0]["rcs_IsInvoiceDraft"].ToString();
                        IsPO = lstDatas.Rows[0]["rcs_IsPrintOut"].ToString();
                        cusType = lstDatas.Rows[0]["rcs_cusType"].ToString();
                        ACL = lstDatas.Rows[0]["rcs_AvailableCreditLimit"].ToString();
                        signatureinvoice = lstDatas.Rows[0]["rcs_IsSignatureInvoice"].ToString();
                        Remark= lstDatas.Rows[0]["rcs_IsRemarkInvoice"].ToString();
                       signatureAR = lstDatas.Rows[0]["rcs_IsSignatureAR"].ToString();
                       reamarkAR= lstDatas.Rows[0]["rcs_IsRemarkAR"].ToString();
                        remarkOS = lstDatas.Rows[0]["rcs_IsRemarkOrderReq"].ToString();
                        selectiontype = lstDatas.Rows[0]["rcs_SelectionType"].ToString();
                        radius = lstDatas.Rows[0]["rcs_FencingRadius"].ToString();
                        Orderpro= lstDatas.Rows[0]["rcs_IsOrderPromo"].ToString();
                        IsHold = lstDatas.Rows[0]["rcs_IsHold"].ToString();
                        Invoice = lstDatas.Rows[0]["rcs_NoOfInvoice"].ToString();
                        MandColumns = lstDatas.Rows[0]["rcs_MandColumns"].ToString();
                        string[] arr = MandColumns.Split('-');


                        ddlroute.SelectedValue = rot.ToString();
                        ddlcus.SelectedValue = cus.ToString();
                        ddlIsInvoicing.SelectedValue = IsInvoicing.ToString();
                        ddIsSOrder.SelectedValue = IsSO.ToString();
                        ddIsMerchand.SelectedValue = IsMerchandising.ToString();
                        ddlIsAR.SelectedValue = IsAR.ToString();
                        ddIsI_Sales.SelectedValue = IsI_Sales.ToString();
                        ddIsI_GR.SelectedValue = IsI_GR.ToString();
                        ddIsI_BR.SelectedValue = IsI_BR.ToString();
                        ddIsI_FG.SelectedValue = IsI_FG.ToString();
                        txtTCL.Text = TCL.ToString();
                        txtUCL.Text = UCL.ToString();
                        txtCDays.Text = CDays.ToString();
                        ddVoidEnable.SelectedValue = VoidEnable.ToString();
                        ddEditEnable.SelectedValue = EditEnable.ToString();
                        ddSE.SelectedValue = StockEnable.ToString();
                        ddPT.SelectedValue = PT.ToString();
                        ddSign.SelectedValue = Sign.ToString();
                        ddRoundAmount.SelectedValue = RoundAmount.ToString();
                        ddIsVAT.SelectedValue = IsVAT.ToString();
                        ddIsID.SelectedValue = IsIDraft.ToString();
                        ddIsPO.SelectedValue = IsPO.ToString();
                        ddcusType.SelectedValue = cusType.ToString();
                        txtACL.Text = ACL.ToString();
                        ddlSI.SelectedValue = signatureinvoice.ToString();
                        ddRe.SelectedValue = Remark.ToString();
                        ddSAR.SelectedValue = signatureAR.ToString();
                        ddRAR.SelectedValue = reamarkAR.ToString();
                        ddROQ.SelectedValue = remarkOS.ToString();
                        ddltype.SelectedValue = selectiontype.ToString();
                        txtradius.Text = radius.ToString();
                        ddlordpro.SelectedValue = Orderpro.ToString();
                        ddlIsHold.SelectedValue = IsHold.ToString();
                        txtinv.Text = Invoice.ToString();
                        ddlcus.Enabled = false;
                        for (int i = 0; i < arr.Length; i++)
                        {
                            foreach (RadComboBoxItem items in ddlMandColumns.Items)
                            {
                                if (items.Value == arr[i])
                                {
                                    items.Checked = true;
                                }
                            }
                        }

                    }
                }
            }
        }
        public void Route()
        {
            DataTable dt = ob.loadList("Route", "sp_Masters", RouteID.ToString());
            if (dt.Rows.Count > 0)
            {

                string rotname = dt.Rows[0]["rot_Name"].ToString();
                cusroute.Text = " " + rotname;

                
            }

        }
        public void CustomerwithoutRoute()
        {
            
            DataTable dts = ob.loadList("selcusbyid", "sp_Masters", RouteID.ToString());
          if (dts.Rows.Count > 0)
            {

            ddlcus.DataSource = dts;
            ddlcus.DataTextField = "cus_Name";
            ddlcus.DataValueField = "cus_ID";
            ddlcus.DataBind();
            }
        }
        public void Customer()
        {
            DataTable dt = ob.loadList("selcus", "sp_Masters", RouteID.ToString());
            ddlcus.DataSource = dt;
            ddlcus.DataTextField = "cus_Name";
            ddlcus.DataValueField = "cus_ID";
            ddlcus.DataBind();

        }

        public void SaveData()
        {
            string rot, cus, IsInvoicing, IsSO, IsMerchandising, IsAR, IsI_Sales, IsI_GR, IsI_BR, IsI_FG, TCL, UCL, CDays, VoidEnable, EditEnable, StockEnable, PT, Sign, RoundAmount,
                        IsVAT, IsIDraft, IsPO, cusType, ACL, signatureinvoice,Remark,signatureAR,reamarkAR,remarkOS,
                       selectiontype,radius, Orderpro, IsHold, Invoice, MandColumns;
            rot = ddlroute.SelectedValue.ToString();
            cus = ddlcus.SelectedValue.ToString();
            IsInvoicing = ddlIsInvoicing.SelectedValue.ToString();
            IsSO = ddIsSOrder.SelectedValue.ToString();
            IsMerchandising = ddIsMerchand.SelectedValue.ToString();
            IsAR = ddlIsAR.SelectedValue.ToString();
            IsI_Sales = ddIsI_Sales.SelectedValue.ToString();
            IsI_GR = ddIsI_GR.SelectedValue.ToString();
            IsI_BR = ddIsI_BR.SelectedValue.ToString();
            IsI_FG = ddIsI_FG.SelectedValue.ToString();
            TCL = txtTCL.Text.ToString();
            UCL = txtUCL.Text.ToString();
            CDays = txtCDays.Text.ToString();
            VoidEnable = ddVoidEnable.SelectedValue.ToString();
            EditEnable = ddEditEnable.SelectedValue.ToString();
            StockEnable = ddSE.SelectedValue.ToString();
            PT = ddPT.SelectedValue.ToString();
            Sign = ddSign.SelectedValue.ToString();
            RoundAmount = ddRoundAmount.SelectedValue.ToString();
            IsVAT = ddIsVAT.SelectedValue.ToString();
            IsIDraft = ddIsID.SelectedValue.ToString();
            IsPO = ddIsPO.SelectedValue.ToString();
            cusType = ddcusType.SelectedValue.ToString();
            ACL = txtACL.Text.ToString();
            signatureinvoice = ddlSI.SelectedValue.ToString();
            Remark = ddRe.SelectedValue.ToString();
            signatureAR = ddSAR.SelectedValue.ToString();
            reamarkAR = ddRAR.SelectedValue.ToString();
            remarkOS = ddROQ.SelectedValue.ToString();
            selectiontype = ddltype.SelectedValue.ToString();
            radius = txtradius.Text.ToString();
            Orderpro = ddlordpro.SelectedValue.ToString();
            IsHold = ddlIsHold.SelectedValue.ToString();
            Invoice = txtinv.Text.ToString();

            MandColumns = Mandcolumns();
            try
            { 
            if (ResponseID.Equals("0") || ResponseID == 0)
            {
                
                string[] arr = {   cus, IsInvoicing, IsSO, IsMerchandising, IsAR, IsI_Sales, IsI_GR, IsI_BR, IsI_FG, TCL, UCL, CDays, VoidEnable, EditEnable, StockEnable, PT, Sign, RoundAmount,
                        IsVAT, IsIDraft, IsPO, cusType, ACL ,signatureinvoice,Remark,signatureAR,reamarkAR,remarkOS,selectiontype,radius,Orderpro,IsHold,Invoice, MandColumns };
                string Value = ob.SaveData("sp_Masters", "InsertCusRoute", RouteID.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Route has been saved sucessfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure('Some Technical Exception are there kindly try again later');</script>", false);
                }
            }
            else
            {
                string ID = ResponseID.ToString();
                string[] arr = { RouteID.ToString(), cus, IsInvoicing, IsSO, IsMerchandising, IsAR, IsI_Sales, IsI_GR, IsI_BR, IsI_FG, TCL, UCL, CDays, VoidEnable, EditEnable, StockEnable, PT, Sign, RoundAmount,
                        IsVAT, IsIDraft, IsPO, cusType, ACL ,signatureinvoice,Remark,signatureAR,reamarkAR,remarkOS,selectiontype,radius,Orderpro,IsHold ,Invoice, MandColumns};
                string value = ob.SaveData("sp_Masters", "UpdateCusRoute", ID, arr);
                int res = Int32.Parse(value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Route has been updated sucessfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure('');</script>", false);
                }


            }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>FailureAlert('We are facing some technical issues, please try again later');</script>", false);
                
            }

        }
        public string Mandcolumns()
        {
            string retStr = "";
            var checkedItems = ddlMandColumns.CheckedItems;
            foreach (var item in checkedItems)
            {
                retStr += item.Value.ToString() + "-";
            }
            return retStr;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        { string ID = RouteID.ToString();
            
            Response.Redirect("/Admin/ListCustomerRoute.aspx?ID="+ID);
        }

        protected void save_Click(object sender, EventArgs e)
        {
            SaveData();
           
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string ID = RouteID.ToString();
            Response.Redirect("/Admin/ListCustomerRoute.aspx?ID=" + ID);

        }

        protected void ddlroute_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            
        }
    }
}