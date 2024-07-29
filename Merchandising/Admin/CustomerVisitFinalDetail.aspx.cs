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
    public partial class CustomerVisitFinalDetail : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();

        public int DPHID
        {
            get
            {
                int DPHID;
                int.TryParse(Request.Params["DId"], out DPHID);

                return DPHID;
            }
        }
        public int UCDPID
        {
            get
            {
                int UCDPID;
                int.TryParse(Request.Params["UId"], out UCDPID);

                return UCDPID;
            }
        }
        public int TypeID
        {
            get
            {
                int TypeID;
                int.TryParse(Request.Params["Type"], out TypeID);

                return TypeID;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HeaderData();
            }
        }

        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelectCustomerVisitHeader", "sp_Report", UCDPID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblUser = (Label)rp.FindControl("lblUser");
                Label lblRoute = (Label)rp.FindControl("lblRoute");
                Label lblCreatedDate = (Label)rp.FindControl("lblCreatedDate");
                Label lblCustomer = (Label)rp.FindControl("lblCustomer");
                Label lblCode = (Label)rp.FindControl("lblCode");

                lblUser.Text = lstDatas.Rows[0]["usr_Name"].ToString();
                lblRoute.Text = lstDatas.Rows[0]["rot_Name"].ToString();
                lblCreatedDate.Text = lstDatas.Rows[0]["dph_Date"].ToString();
                lblCustomer.Text = lstDatas.Rows[0]["cus_Name"].ToString();
                lblCode.Text = lstDatas.Rows[0]["cus_Code"].ToString();
                if (TypeID == 1)
                {
                    lblType.Text = "Before Merchandising Images";
                }
                else if (TypeID == 2)
                {
                    lblType.Text = "Customer Survey";
                }
                else if (TypeID == 3)
                {
                    lblType.Text = "Customer Cooler Tracking";
                }
                else if (TypeID == 4)
                {
                    lblType.Text = "General Complaints";
                }
                else if (TypeID == 5)
                {
                    lblType.Text = "Competitor Activities";
                }
                else if (TypeID == 6)
                {
                    lblType.Text = "Customer General Messages";
                }
                else if (TypeID == 7)
                {
                    lblType.Text = "After Merchandising Images";
                }
                else if (TypeID == 8)
                {
                    lblType.Text = "Customer Retail Price";
                }
                else if (TypeID == 9)
                {
                    lblType.Text = "Stock Counting";
                }
            }
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
            
          
        }

        public void LoadList()
        {
            try
            {
                if (TypeID == 1)
                {
                    string[] arr = { UCDPID.ToString() };
                    DataTable lstUser = default(DataTable);
                    lstUser = ObjclsFrms.loadList("SelectBeforeMerchImagesReport", "sp_Report", DPHID.ToString(), arr);
                    grvRpt.DataSource = lstUser;
                }
                else if (TypeID == 2)
                {
                    string[] arr = { UCDPID.ToString() };
                    DataTable lstUser = default(DataTable);
                    lstUser = ObjclsFrms.loadList("SelectCustomerSurveyReport", "sp_Report", DPHID.ToString(), arr);
                    
                    grvRpt.DataSource = lstUser;
                   
                }
                else if (TypeID == 3)
                {
                    string[] arr = { UCDPID.ToString() };
                    DataTable lstUser = default(DataTable);
                    lstUser = ObjclsFrms.loadList("SelectCustomerCoolerTrackingReport", "sp_Report", DPHID.ToString(), arr);
                    grvRpt.DataSource = lstUser;
                }
                else if (TypeID == 4)
                {
                    string[] arr = { UCDPID.ToString() };
                    DataTable lstUser = default(DataTable);
                    lstUser = ObjclsFrms.loadList("SelectGeneralComplaintsReport", "sp_Report", DPHID.ToString(), arr);
                    grvRpt.DataSource = lstUser;
                }
                else if (TypeID == 5)
                {
                    string[] arr = { UCDPID.ToString() };
                    DataTable lstUser = default(DataTable);
                    lstUser = ObjclsFrms.loadList("SelectCompetitorActivitiesReport", "sp_Report", DPHID.ToString(), arr);
                    grvRpt.DataSource = lstUser;
                }
                else if (TypeID == 6)
                {
                    string[] arr = { UCDPID.ToString() };
                    DataTable lstUser = default(DataTable);
                    lstUser = ObjclsFrms.loadList("SelectCustomerGeneralMessagesReport", "sp_Report", DPHID.ToString(), arr);
                    grvRpt.DataSource = lstUser;
                }
                else if (TypeID == 7)
                {
                    string[] arr = { UCDPID.ToString() };
                    DataTable lstUser = default(DataTable);
                    lstUser = ObjclsFrms.loadList("SelectAfterMerchImagesReport", "sp_Report", DPHID.ToString(), arr);
                    grvRpt.DataSource = lstUser;
                }
                else if (TypeID == 8)
                {
                    string[] arr = { UCDPID.ToString() };
                    DataTable lstUser = default(DataTable);
                    lstUser = ObjclsFrms.loadList("SelectCustomerRetailPriceReport", "sp_Report", DPHID.ToString(), arr);
                    grvRpt.DataSource = lstUser;
                }
                else if (TypeID == 9)
                {
                    string[] arr = { UCDPID.ToString() };
                    DataTable lstUser = default(DataTable);
                    lstUser = ObjclsFrms.loadList("SelectStockCountingReport", "sp_Report", DPHID.ToString(), arr);
                    grvRpt.DataSource = lstUser;
                }
            }
            catch (Exception ex)
            {
                UICommon.LogException(ex, "Customer Visit Final Detail");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "CustomerVisitFinalDetail.aspx Page_Load()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerVisitDetail.aspx?Id=" + UCDPID.ToString() + "&DId=" + DPHID.ToString());
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void grvRpt_PreRender(object sender, EventArgs e)
        {
            if (TypeID == 1 || TypeID == 2 || TypeID == 3 || TypeID == 7)
            {
                grvRpt.MasterTableView.GetColumn("Images").Visible = true;
                if (TypeID == 2)
                {
                    grvRpt.MasterTableView.GetColumn("Images").HeaderText = "Answer";
                    grvRpt.MasterTableView.SwapColumns("Question", "Images");
                   
                }
            }
            else
            {
                grvRpt.MasterTableView.GetColumn("Images").Visible = false;
            }
            grvRpt.MasterTableView.GetColumn("S").Visible = false;

            grvRpt.MasterTableView.GetColumn("answer").Visible = false;
            grvRpt.Rebind();
        }

        protected void grvRpt_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;

                if (TypeID == 1)
                {


                    string meiID = dataItem.GetDataKeyValue("S").ToString();
                    DataTable dx = ObjclsFrms.loadList("SelBeforeMerchendisingImages", "sp_Masters", meiID);
                    if (dx.Rows.Count > 0)
                    {
                        int i = 0;
                        foreach (DataRow dr in dx.Rows)
                        {
                            Image img = new Image();
                            img.ID = "Image1" + i.ToString();
                            img.ImageUrl = dr["bmi_Image"].ToString();
                            img.Height = 50;
                            img.Width = 50;
                            img.BorderStyle = BorderStyle.Groove;
                            img.BorderWidth = 2;
                            img.BorderColor = System.Drawing.Color.Black;
                            HyperLink hl = new HyperLink();
                            hl.NavigateUrl = dr["bmi_Image"].ToString();
                            hl.ID = "hl" + i.ToString();
                            hl.Target = "_blank";
                            hl.Controls.Add(img);


                            dataItem["Images"].Controls.Add(hl);
                            i++;
                        }
                    }
                }
                else if (TypeID == 3)
                {
                    string img1 = dataItem["image"].Text.ToString();
                    Image img = new Image();
                    img.ID = "Image1".ToString();
                    img.ImageUrl = img1.ToString();
                    img.Height = 50;
                    img.Width = 50;
                    img.BorderStyle = BorderStyle.Groove;
                    img.BorderWidth = 2;
                    img.BorderColor = System.Drawing.Color.Black;
                    HyperLink hl = new HyperLink();
                    hl.NavigateUrl = img1.ToString();
                    hl.ID = "hl".ToString();
                    hl.Target = "_blank";
                    hl.Controls.Add(img);
                    dataItem["Images"].Controls.Add(hl);
                }
                else if (TypeID == 2)
                {
                    string tp = dataItem["type"].Text.ToString();
                    if (tp.Equals("I"))
                    {
                        string img1 = dataItem["image"].Text.ToString();
                        string[] arrImg = img1.Split(',');
                        for (int i = 0; i < arrImg.Length; i++)
                        {
                            Image img = new Image();
                            img.ID = "Image1" + i.ToString();
                            img.ImageUrl = "../PHP/" + arrImg[i].ToString();
                            img.Height = 50;
                            img.Width = 50;
                            img.BorderStyle = BorderStyle.Groove;
                            img.BorderWidth = 2;
                            img.BorderColor = System.Drawing.Color.Black;
                            HyperLink hl = new HyperLink();
                            hl.NavigateUrl = "../PHP/" + arrImg[i].ToString();
                            hl.ID = "hl" + i.ToString();
                            hl.Target = "_blank";
                            hl.Controls.Add(img);
                            dataItem["Images"].Controls.Add(hl);
                        }
                    }
                    else
                    {
                        Label hl = new Label();
                        hl.ID = "hl";
                        hl.Text = dataItem["image"].Text.ToString();
                        dataItem["Images"].Controls.Add(hl);
                    }

                }
                else if (TypeID == 7)
                {
                    string meiID = dataItem.GetDataKeyValue("S").ToString();
                    DataTable dx = ObjclsFrms.loadList("SelAfterMerchendisingImages", "sp_Masters", meiID);
                    if (dx.Rows.Count > 0)
                    {
                        int i = 0;
                        foreach (DataRow dr in dx.Rows)
                        {
                            Image img = new Image();
                            img.ID = "Image1" + i.ToString();
                            img.ImageUrl = dr["ami_Image"].ToString();
                            img.Height = 50;
                            img.Width = 50;
                            img.BorderStyle = BorderStyle.Groove;
                            img.BorderWidth = 2;
                            img.BorderColor = System.Drawing.Color.Black;
                            HyperLink hl = new HyperLink();
                            hl.NavigateUrl = dr["ami_Image"].ToString();
                            hl.ID = "hl" + i.ToString();
                            hl.Target = "_blank";
                            hl.Controls.Add(img);


                            dataItem["Images"].Controls.Add(hl);
                            i++;
                        }
                    }
                }
            }
        }
    }
}