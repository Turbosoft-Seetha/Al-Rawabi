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
    public partial class ListCusRouteProducts : System.Web.UI.Page
    {
        GeneralFunctions obj = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PriceListHeader();
                Route();
                CusRoute();
            }
        }
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
        public void PriceListHeader()
        {
            rdprhead.DataSource = obj.loadList("SelPriceListHeadDropDown", "sp_Masters_Temp", ResponseID.ToString());
            rdprhead.DataTextField = "prh_Name";
            rdprhead.DataValueField = "prh_ID";
            rdprhead.DataBind();
        }
        public void List()
        {   //string[] arr ={ RouteID.ToString() };
            string priceheader = rdprhead.SelectedValue.ToString();
            string[] arr = { priceheader.ToString() };
            DataTable lstdata = obj.loadList("ListCusRouteProduct", "sp_Masters_Temp", ResponseID.ToString(), arr);
            if (lstdata.Rows.Count >= 0)
            {
                grvRpt.DataSource = lstdata;
                // string prhname = lstdata.Rows[0]["prh_Name"].ToString();
                //Prhname.Text = "Price List Header :" + prhname;
            }



        }
        public void Route()
        {
            DataTable dt = obj.loadList("Route", "sp_Masters_Temp", RouteID.ToString());
            if (dt.Rows.Count > 0)
            {

                string rotname = dt.Rows[0]["rot_Name"].ToString();
                cusroute.Text = "Route Name : " + rotname;


            }

        }
        public void CusRoute()
        {
            DataTable dt = obj.loadList("CusRoute", "sp_Masters", ResponseID.ToString());
            if (dt.Rows.Count > 0)
            {

                string cusname = dt.Rows[0]["cus_Name"].ToString();
                Cusname.Text = "Customer Name : " + cusname;


            }

        }

        protected void lnkSubCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditCusRouteProducts.aspx?ID=" + ResponseID.ToString() + "&RID=" + RouteID.ToString());

        }

        protected void rdprhead_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            List();
            grvRpt.Rebind();
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            List();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Edit"))                                           //To check whether the triggered command name matched or not, in case of multiple command name in aspx side
            {                                                                           //If it matched the following code will be executed
                GridDataItem dataItem = e.Item as GridDataItem;                         //We are creating an object for grid data item 
                string ID = dataItem.GetDataKeyValue("crp_ID").ToString();              //Using the object and a propery "GetDataKeyValue" we can access the value of DataKey in ASPX. which is the ID. 
                Response.Redirect("AddEditCusRouteProducts.aspx?Id=" + ID);                         //With the ID we can redirect to the add page to edit and update the value.
            }
        }
    }
}