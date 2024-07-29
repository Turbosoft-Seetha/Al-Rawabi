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
    public partial class MerchandisingTransactions : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["id"], out ResponseID);
                return ResponseID;
            }
        }
        public string cusID
        {
            get
            {
                string cusID;
                cusID = Request.Params["cusID"].ToString();
                return cusID;
            }
        }
      
        public string Mode
        {
            get
            {
                string Mode;
                Mode = Request.Params["Mode"].ToString();
                return Mode;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["ucpID"] = Session["CusStartExitId"].ToString();
                HeaderData();
              
            }
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GetData();
           
        }
        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelUsrDlyPrcsHeaderByID", "sp_UserDailyProcessDetail", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblUser = (Label)rp.FindControl("lblUser");
                Label lblRoute = (Label)rp.FindControl("lblRoute");             
                Label lblVersion = (Label)rp.FindControl("lblVersion");
               
                lblUser.Text = lstDatas.Rows[0]["userName"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["routeName"].ToString();
                lblVersion.Text = lstDatas.Rows[0]["dph_VersionNumber"].ToString();
            }
        }
        public void GetData()
        {
         
            string mainCondition = "";


            string[] arr = { ResponseID.ToString() };

            string mode = Request.Params["Mode"].ToString();

            string proc = "";
            if (mode.Equals("IP"))
            {
                lblType.Text = "Item Pricing";
                proc = "SelUDItemPricing";
                mainCondition = " crp_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                     cusCondition = " and crp_cus_ID in (" + cusID + ")";
                }
                else
                {
                     cusCondition = " and crp_cus_ID in (" + cusID + ") and crp_ucp_ID =" + ViewState["ucpID"].ToString();
                }
               
                mainCondition += cusCondition;
            }
            else if (mode.Equals("IA"))
            {
                lblType.Text = "Item Availability";
                proc = "SelUDItemAvailability";
                mainCondition = " iah_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and iah_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and iah_cus_ID in (" + cusID + ") and iah_ucp_ID =" + ViewState["ucpID"].ToString();
                }
               
                mainCondition += cusCondition;
            }
            else if (mode.Equals("GC"))
            {
                lblType.Text = "General Complaints";
                proc = "SelUDGComplaints";
                mainCondition = " gcm_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and gcm_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and gcm_cus_ID in (" + cusID + ") and gcm_ucp_ID =" + ViewState["ucpID"].ToString();
                }

                mainCondition += cusCondition;
            }
            else if (mode.Equals("PC"))
            {
                lblType.Text = "Product Complaints";
                proc = "SelUDPComplaints";
                mainCondition = " psc_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and psc_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and psc_cus_ID in (" + cusID + ") and psc_ucp_ID =" + ViewState["ucpID"].ToString();
                }
               
                mainCondition += cusCondition;
            }
            else if (mode.Equals("CA"))
            {
                lblType.Text = "Competitor Activities";
                proc = "SelUDCompetitorActivity";
                mainCondition = " cma_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and cma_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and cma_cus_ID in (" + cusID + ") and cma_ucp_ID =" + ViewState["ucpID"].ToString();
                }
              
                mainCondition += cusCondition;
            }

            else if (mode.Equals("AT"))
            {
                lblType.Text = "Asset Tracking";
                proc = "SelUDAssetTracking";
                mainCondition = " cct_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and cct_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and cct_cus_ID in (" + cusID + ") and cct_ucp_ID =" + ViewState["ucpID"].ToString();
                }

                mainCondition += cusCondition;
            }
            else if (mode.Equals("SR"))
            {
                lblType.Text = "Survey";
                proc = "SelUDSurvey";
                mainCondition = " srh_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and srh_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and srh_cus_ID in (" + cusID + ") and srh_ucp_ID =" + ViewState["ucpID"].ToString();
                }

               
                mainCondition += cusCondition;
            }
            else if (mode.Equals("TS"))
            {
                lblType.Text = "Tasks";
                proc = "SelUDTasks";
                mainCondition = " cst_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and cst_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and cst_cus_ID in (" + cusID + ") and cst_ucp_ID =" + ViewState["ucpID"].ToString();
                }
               
                mainCondition += cusCondition;
            }
            else if (mode.Equals("OS"))
            {
                lblType.Text = "OutofStock";
                proc = "SelUDOutofStock";
                mainCondition = " osh_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and osh_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and osh_cus_ID in (" + cusID + ") and osh_ucp_ID =" + ViewState["ucpID"].ToString();
                }
               
                mainCondition += cusCondition;
            }

            else if (mode.Equals("CI"))
            {
                lblType.Text = "Customer Inventory";
                proc = "SelUDCustomerInventory";
                mainCondition = " inh_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and inh_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and inh_cus_ID in (" + cusID + ") and inh_ucp_ID =" + ViewState["ucpID"].ToString();
                }
                
                mainCondition += cusCondition;
            }
            else if (mode.Equals("IC"))
            {
                lblType.Text = "Image Capture";
                proc = "SelUDImageCapture";
                mainCondition = " mei_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and mei_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and mei_cus_ID in (" + cusID + ") and mei_ucp_ID =" + ViewState["ucpID"].ToString();
                }
               
                mainCondition += cusCondition;
            }
            else if (mode.Equals("DA"))
            {
                lblType.Text = "Display Agreements";
                proc = "SelUDDisplayAgreement";
                mainCondition = " dag_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and dag_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and dag_cus_ID in (" + cusID + ") and dag_ucp_ID =" + ViewState["ucpID"].ToString();
                }
                
                mainCondition += cusCondition;
            }
            else if (mode.Equals("DC"))
            {
                lblType.Text = "Delivery Ckeck";
                proc = "SelUDDeliveryCheck";
                mainCondition = " dch_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and dch_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and dch_cus_ID in (" + cusID + ") and dch_ucp_ID =" + ViewState["ucpID"].ToString();
                }
                mainCondition += cusCondition;
            }
            else if (mode.Equals("CAT"))
            {
                lblType.Text = "Customer Activities";
                proc = "SelUDCusActivity";
                mainCondition = " cah_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = " and cah_cus_ID in (" + cusID + ")";
                }
                else
                {
                    cusCondition = " and cah_cus_ID in (" + cusID + ") and cah_ucp_ID =" + ViewState["ucpID"].ToString();
                }
                mainCondition += cusCondition;
            }
            else if (mode.Equals("RQ"))
            {
                lblType.Text = "Requests";
                proc = "SelUDRequests";
                mainCondition = " and req_dph_ID=" + ResponseID;
                string cusCondition;
                if (ViewState["ucpID"].Equals(""))
                {
                    cusCondition = "";
                }
                else
                {
                    cusCondition = " and dch_ucp_ID =" + ViewState["ucpID"].ToString();
                }
                mainCondition += cusCondition;
            }
            DataTable lstDatas = new DataTable();
            if (cusID.ToString().Equals("0"))
            {

                lstDatas = ObjclsFrms.loadList(proc, "sp_UserDailyProcessDetail", mainCondition);

                grvRpt.DataSource = lstDatas;
            }
            else
            {

                lstDatas = ObjclsFrms.loadList(proc, "sp_UserDailyProcessDetail", mainCondition);

                grvRpt.DataSource = lstDatas;

            }



        }
        protected void grvRpt_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {

                GridDataItem dataItem = (GridDataItem)e.Item;

                string imah = dataItem["Image"].Text.Replace(" ", "");
                string imah2 = dataItem["Img"].Text.Replace(" ", "");
                string[] values = imah.Split(',');
                string[] values2 = imah2.Split(',');

                imah = imah.Replace("&nbsp;", null);
                imah2 = imah2.Replace("&nbsp;", null);

                for (int i = 0; i < values.Length; i++)
                {
                    if (!values[i].Equals("&nbsp;") && !values[i].Equals(""))
                    {
                        Image img = new Image();
                        img.ID = "Image1" + i.ToString();
                        img.ImageUrl = "../" + values[i].ToString();
                        img.Height = 20;
                        img.Width = 20;
                        img.BorderStyle = BorderStyle.Groove;
                        img.BorderWidth = 2;
                        img.BorderColor = System.Drawing.Color.Black;
                        HyperLink hl = new HyperLink();
                        hl.NavigateUrl = "../" + values[i].ToString();
                        hl.ID = "hl" + i.ToString();
                        hl.Target = "_blank";
                        hl.Controls.Add(img);

                        dataItem["Images"].Controls.Add(hl);
                    }
                }
                for (int i = 0; i < values2.Length; i++)
                {
                    if (!values2[i].Equals("&nbsp;") && !values2[i].Equals(""))
                    {
                        Image img2 = new Image();
                        img2.ID = "Image2" + i.ToString();
                        img2.ImageUrl = "../" + values2[i].ToString();
                        img2.Height = 20;
                        img2.Width = 20;
                        img2.BorderStyle = BorderStyle.Groove;
                        img2.BorderWidth = 2;
                        img2.BorderColor = System.Drawing.Color.Black;
                        HyperLink hll = new HyperLink();
                        hll.NavigateUrl = "../" + values2[i].ToString();
                        hll.ID = "hll" + i.ToString();
                        hll.Target = "_blank";
                        hll.Controls.Add(img2);

                        dataItem["ResImage"].Controls.Add(hll);
                    }
                }
                //dataItem["mei_Images"].Text = imah.Replace("../", "http://93.177.125.68/");

                if (imah2 == "")
                {
                    Image img = new Image();
                    img.ImageUrl = "../assets/media/icons/imagenotavailable.png";
                    img.Height = 20;
                    img.Width = 20;
                    HyperLink hl = new HyperLink();
                    hl.NavigateUrl = "";
                    hl.Controls.Add(img);
                    dataItem["ResImage"].Controls.Add(hl);
                }
            }
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string id = dataItem.GetDataKeyValue("id").ToString();

               
                Response.Redirect("MerchTransactionDetail.aspx?id=" + ResponseID.ToString() + "&&Mode=" + Request.Params["Mode"].ToString() + "&&HID=" + id + "&&cusID=" + cusID.ToString());
            }
        }

        protected void grvRpt_PreRender(object sender, EventArgs e)
        {
            RadGrid radgrid2 = (RadGrid)sender;
            radgrid2.MasterTableView.GetColumnSafe("id").Visible = false;
            radgrid2.MasterTableView.GetColumnSafe("Image").Visible = false;
            radgrid2.MasterTableView.GetColumnSafe("ReferenceImage").Visible = false;
            radgrid2.MasterTableView.GetColumnSafe("CapturedImage").Visible = false;
            radgrid2.MasterTableView.GetColumnSafe("Attachment").Visible = false;
            radgrid2.MasterTableView.GetColumnSafe("Img").Visible = false;

            if (Request.Params["Mode"].ToString().Equals("IP"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("IA"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("GC"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("detail").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("PC"))
            {

                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("detail").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("CA"))
            {
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("detail").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("AT"))
            {
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;

            }
            if (Request.Params["Mode"].ToString().Equals("SR"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("TS"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;

                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("detail").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("CI"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("OS"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;

            }
            if (Request.Params["Mode"].ToString().Equals("IC"))
            {

                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("detail").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("DA"))
            {

                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;

                radgrid2.MasterTableView.GetColumnSafe("detail").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("DC"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Image").Visible = false;
            }
            if (Request.Params["Mode"].ToString().Equals("CAT"))
            {
                radgrid2.MasterTableView.GetColumnSafe("Images").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("ResImage").Visible = false;

            }
            if (Request.Params["Mode"].ToString().Equals("RQ"))
            {
                radgrid2.MasterTableView.GetColumnSafe("RefImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("CapImages").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("Attachments").Visible = false;
                radgrid2.MasterTableView.GetColumnSafe("detail").Visible = false;
            }
        }
    }
}