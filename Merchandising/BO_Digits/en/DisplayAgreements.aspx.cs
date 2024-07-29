using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Documents.SpreadsheetStreaming;
using Telerik.Web.UI;

namespace Merchandising.BO_Digits.en
{
    public partial class DisplayAgreements : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rdfromDate.SelectedDate = DateTime.Parse(DateTime.Now.ToString("MMM-yyyy"));
                rdendDate.SelectedDate = DateTime.Now;
                //rdfromDate.SelectedDate = DateTime.Parse(DateTime.Now.ToString("01-MM-yyyy"));
                //rdendDate.SelectedDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1).AddMonths(1).AddDays(-1);

                RegionMaster();
                int s = 1;
                foreach (RadComboBoxItem itmss in ddlRegion.Items)
                {
                    itmss.Checked = true;
                    s++;
                }
                string region = Region();
                Session["Region"] = region;
                string regionCondition = " dep_reg_ID in (" + region + ")";



                Depot(regionCondition);
                int p = 1;
                foreach (RadComboBoxItem itmss in ddldepot.Items)
                {
                    itmss.Checked = true;
                    p++;
                }
                string depo = DPO();
                Session["Depo"] = depo;
                string dpocondition = " dpa_dep_ID in (" + depo + ")";
                DpoArea(dpocondition);
                int q = 1;
                foreach (RadComboBoxItem itmss in ddldpoArea.Items)
                {
                    itmss.Checked = true;
                    q++;
                }
                string depoarea = DPOarea();
                Session["DepoArea"] = depoarea;
                string dpoareacondition = " dsa_dpa_ID in (" + depoarea + ")";
                DpoSubArea(dpoareacondition);
                int R = 1;
                foreach (RadComboBoxItem itmss in ddldpoSubArea.Items)
                {
                    itmss.Checked = true;
                    R++;
                }
                string deposubarea = DPOsubarea();
                Session["DepoSubArea"] = deposubarea;
                string dposubareacondition = " rot_dsa_ID in (" + deposubarea + ")";
                Route(dposubareacondition);
                RouteFromTransaction();
            }
        }
        public void RouteFromTransaction()
        {
            int j = 1;
            foreach (RadComboBoxItem itmss in rdRoute.Items)
            {
                itmss.Checked = true;
                j++;
            }
        }
        public void Route(string DposubAreaCondition)
        {
            string[] arr = { DposubAreaCondition };
            rdRoute.DataSource = ObjclsFrms.loadList("SelectRouteForDropDowns", "sp_Masters", UICommon.GetCurrentUserID().ToString(), arr);
            rdRoute.DataTextField = "rot_Name";
            rdRoute.DataValueField = "rot_ID";
            rdRoute.DataBind();
        }
        public void RegionMaster()
        {

            ddlRegion.DataSource = ObjclsFrms.loadList("SelectRegionTransaction", "sp_Masters", UICommon.GetCurrentUserID().ToString());
            ddlRegion.DataTextField = "reg_Name";
            ddlRegion.DataValueField = "reg_ID";
            ddlRegion.DataBind();
        }
        public void Depot(string regionCondition)
        {
            string[] arr = { regionCondition };
            ddldepot.DataSource = ObjclsFrms.loadList("SelectDepotTransaction", "sp_Masters", UICommon.GetCurrentUserID().ToString(), arr);
            ddldepot.DataTextField = "dep_Name";
            ddldepot.DataValueField = "dep_ID";
            ddldepot.DataBind();
        }
        public void DpoArea(string DpoCondition)
        {
            string u = UICommon.GetCurrentUserID().ToString();
            string[] arr = { DpoCondition };
            ddldpoArea.DataSource = ObjclsFrms.loadList("SelectDepotAreaTransaction", "sp_Masters", UICommon.GetCurrentUserID().ToString(), arr);
            ddldpoArea.DataTextField = "dpa_Name";
            ddldpoArea.DataValueField = "dpa_ID";
            ddldpoArea.DataBind();
        }
        public void DpoSubArea(string DpoAreaCondition)
        {
            string[] arr = { DpoAreaCondition };
            ddldpoSubArea.DataSource = ObjclsFrms.loadList("SelectDepotSubAreaTransaction", "sp_Masters", UICommon.GetCurrentUserID().ToString(), arr);
            ddldpoSubArea.DataTextField = "dsa_Name";
            ddldpoSubArea.DataValueField = "dsa_ID";
            ddldpoSubArea.DataBind();
        }
        public string DPO()
        {
            var CollectionMarket1 = ddldepot.CheckedItems;
            string dpoID = "";
            int j = 0;
            int MarCount = CollectionMarket1.Count;
            if (CollectionMarket1.Count > 0)
            {
                foreach (var item in CollectionMarket1)
                {
                    if (j == 0)
                    {
                        dpoID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        dpoID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        dpoID += item.Value;
                    }
                    j++;
                }
                return dpoID;
            }
            else
            {
                return "0";
            }
        }
        public string DPOarea()
        {
            var CollectionMarket2 = ddldpoArea.CheckedItems;
            string dpoareID = "";
            int j = 0;
            int MarCount = CollectionMarket2.Count;
            if (CollectionMarket2.Count > 0)
            {
                foreach (var item in CollectionMarket2)
                {
                    if (j == 0)
                    {
                        dpoareID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        dpoareID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        dpoareID += item.Value;
                    }
                    j++;
                }
                return dpoareID;
            }
            else
            {
                return "0";
            }
        }

        public string DPOsubarea()
        {
            var CollectionMarket3 = ddldpoSubArea.CheckedItems;
            string dposubareID = "";
            int j = 0;
            int MarCount = CollectionMarket3.Count;
            if (CollectionMarket3.Count > 0)
            {
                foreach (var item in CollectionMarket3)
                {
                    if (j == 0)
                    {
                        dposubareID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        dposubareID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        dposubareID += item.Value;
                    }
                    j++;
                }
                return dposubareID;
            }
            else
            {
                return "0";
            }
        }
        public string Region()
        {
            var CollectionMarket4 = ddlRegion.CheckedItems;
            string regionID = "";
            int j = 0;
            int MarCount = CollectionMarket4.Count;
            if (CollectionMarket4.Count > 0)
            {
                foreach (var item in CollectionMarket4)
                {
                    if (j == 0)
                    {
                        regionID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        regionID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        regionID += item.Value;
                    }
                    j++;
                }
                return regionID;
            }
            else
            {
                return "0";
            }
        }

        public void Customers()
        {
            rdCustomer.DataSource = ObjclsFrms.loadList("DACustomer", "sp_Transaction", rdRoute.SelectedValue.ToString());
            rdCustomer.DataTextField = "cus_Name";
            rdCustomer.DataValueField = "cus_ID";
            rdCustomer.DataBind();
        }
        public void LoadList()
        {
            string fromDate, ToDate, Customer, rot;
            fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            ToDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            Customer = rdCustomer.SelectedValue.ToString();
            rot = rdRoute.SelectedValue.ToString();
            string[] arr = { ToDate, Customer, rot };
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelDisplayAgreement", "sp_Transaction", fromDate, arr);
            grvRpt.DataSource = lstUser;
        }
        protected void rdRoute_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Customers();
        }

        protected void Filter_Click(object sender, EventArgs e)
        {
            LoadList();
            grvRpt.Rebind();
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void imgExcel_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnPDF_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ddlRegion_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string RegionID = Region();
            string RegionCondition = " reg_ID in (" + RegionID + ")";

            Depot(RegionCondition);
            string dpoID = DPO();
            string DpoCondition = " dpa_dep_ID in (" + dpoID + ")";

            DpoArea(DpoCondition);
            string dpoareaID = DPOarea();
            string DpoAreaCondition = " dsa_dpa_ID in (" + dpoareaID + ")";

            DpoSubArea(DpoAreaCondition);
            string dposubareaID = DPOsubarea();
            string DposubAreaCondition = " rot_dsa_ID in (" + dposubareaID + ")";

            Route(DposubAreaCondition);
        }

        protected void ddldepot_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string dpoID = DPO();
            string DpoCondition = " dpa_dep_ID in (" + dpoID + ")";
            DpoArea(DpoCondition);
            string dpoareaID = DPOarea();
            string DpoAreaCondition = " dsa_dpa_ID in (" + dpoareaID + ")";
            DpoSubArea(DpoAreaCondition);
            string dposubareaID = DPOsubarea();
            string DposubAreaCondition = " rot_dsa_ID in (" + dposubareaID + ")";
            Route(DposubAreaCondition);
        }

        protected void ddldpoArea_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string dpoareaID = DPOarea();
            string DpoAreaCondition = " dsa_dpa_ID in (" + dpoareaID + ")";
            DpoSubArea(DpoAreaCondition);
            string dposubareaID = DPOsubarea();
            string DposubAreaCondition = " rot_dsa_ID in (" + dposubareaID + ")";
            Route(DposubAreaCondition);
        }

        protected void ddldpoSubArea_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string dposubareaID = DPOsubarea();
            string DposubAreaCondition = " rot_dsa_ID in (" + dposubareaID + ")";
            Route(DposubAreaCondition);
        }
    }
}