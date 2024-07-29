using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Telerik.Web.UI;

namespace Merchandising.BO_Digits.en
{
    public partial class RouteCustomerReassignment : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FromRoute();
                ToRoute();
            }
        }
        public void FromRoute()
        {

            ddlfromroute.DataSource = ObjclsFrms.loadList("SelectFromRoute", "sp_RouteCustomerRe_assign");
            ddlfromroute.DataTextField = "rot_Name";
            ddlfromroute.DataValueField = "rot_ID";
            ddlfromroute.DataBind();
        }

        public void ToRoute()
        {

            ddltoroute.DataSource = ObjclsFrms.loadList("SelectToRoute", "sp_RouteCustomerRe_assign", ddlfromroute.SelectedValue.ToString());
            ddltoroute.DataTextField = "rot_Name";
            ddltoroute.DataValueField = "rot_ID";
            ddltoroute.DataBind();
        }
        public void RouteCustomer()
        {
            string[] ar = { ddltoroute.SelectedValue.ToString() };
            ddlcus.DataSource = ObjclsFrms.loadList("SelectCustomerInRoute", "sp_RouteCustomerRe_assign", ddlfromroute.SelectedValue.ToString(),ar);
            ddlcus.DataTextField = "cus_Name";
            ddlcus.DataValueField = "cus_ID";
            ddlcus.DataBind();
        }
        public string Cus()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var CollectionMarket = ddlcus.CheckedItems;
                    int MarCount = CollectionMarket.Count;
                    if (CollectionMarket.Count > 0)
                    {
                        foreach (var item in CollectionMarket)
                        {
                            string cusId = item.Value;
                            createNode(cusId, writer);
                            c++;
                        }
                    }
                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                    writer.Close();
                    if (c == 0)
                    {
                        return "";
                    }
                    else
                    {
                        string ss = sw.ToString();
                        return sw.ToString();
                    }
                }
            }
        }

        private void createNode(string cusId, XmlWriter writer)
        {
            writer.WriteStartElement("Values");

            writer.WriteStartElement("cusID");
            writer.WriteString(cusId);
            writer.WriteEndElement();

            writer.WriteEndElement();
        }
        public void Save()
        {
            string fromrot, torot, cus,user;
            cus = Cus();
            fromrot = ddlfromroute.SelectedValue.ToString();
            torot = ddltoroute.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            string[] arr = { torot,cus,user};
            string Value = ObjclsFrms.SaveData("sp_RouteCustomerRe_assign", "ReassignCusRoute", fromrot, arr);
            int res = Int32.Parse(Value.ToString());
            if (res > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Reassignment has been updated sucessfully');</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>FailureAlert('Some Technical Exception are there kindly try again later');</script>", false);
            }
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListRoute.aspx");


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void ddlfromroute_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            ToRoute();
          
            ddltoroute.Text = "";
        }

      

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListRoute.aspx");
        }

        protected void ddltoroute_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            RouteCustomer();
        }
    }
}