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

namespace Merchandising.Admin
{
    public partial class ListRouteProduct : System.Web.UI.Page
    {
        GeneralFunctions obj = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Product();
                Route();
            }
        }
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);

                return ResponseID;
            }
        }
        public void Product()
        {
            DataTable dt = obj.loadList("ProductwithoutRoute", "sp_Masters_Temp", ResponseID.ToString());
            ddlItems.DataSource = dt;
            ddlItems.DataTextField = "prd_Name";
            ddlItems.DataValueField = "prd_ID";
            ddlItems.DataBind();
        }
        public void SaveData()
        {
            string product, code;
            product = GetItemFromGrid();
            //code = txtCode.Text.ToString();
            string[] arr = { };
            string Value = obj.SaveData("sp_Masters_Temp", "AddRouteProduct", product, arr);
            int res = Int32.Parse(Value.ToString());
            if (res > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Product Added successfully');</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
            }


        }

        public void Route()
        {
            DataTable dt = obj.loadList("Route", "sp_Masters_Temp", ResponseID.ToString());
            if (dt.Rows.Count > 0)
            {

                string rotname = dt.Rows[0]["rot_Name"].ToString();
                Proroute.Text = "Route Name : " + rotname;


            }

        }
        public void List()
        {
            DataTable lstdata = obj.loadList("RouteProduct", "sp_Masters_Temp", ResponseID.ToString());
            if (lstdata.Rows.Count > 0)
            {
                grvRpt.DataSource = lstdata;
                Proroute.Text = "Route Name :" + lstdata.Rows[0]["rot_Name"].ToString();
            }



        }
        

        protected void LinkButton1Save_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confirm();</script>", false);
        }

        protected void LinkButton2Delete_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            List();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("rop_ID").ToString();

                ViewState["delID"] = ID;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
            }
        }
        public void Delete()
        {
            try
            {
                string ropid = GetItemFromGrid2();
                DataTable lstData = new DataTable();
                string[] arr = { };
                string resp = obj.SaveData("sp_Masters_Temp", "DeletePro", ropid.ToString(), arr);

                int res = Int32.Parse(resp);


                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal('Some fields are missing ');</script>", false);
                }
            }
            catch (Exception ex)
            {

            }


        }
        public string GetItemFromGrid2()
        {
            using (var sw = new StringWriter())
            {
                int c = 0;
                using (var writer = XmlWriter.Create(sw))
                {

                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("q");

                    DataTable dsc = new DataTable();
                    foreach (GridDataItem dr in grvRpt.SelectedItems)
                    {

                        string rop_ID = dr.GetDataKeyValue("rop_ID").ToString();

                        createNode2(rop_ID, writer);
                        c++;
                    }
                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                    writer.Close();

                }
                if (c == 0)
                {

                    return null;
                }
                else
                {
                    string ss = sw.ToString();
                    return sw.ToString();
                }
            }
        }
        private void createNode2(string rop_ID, XmlWriter writer)
        {
            writer.WriteStartElement("Values");
            writer.WriteStartElement("rop_ID");
            writer.WriteString(rop_ID);
            writer.WriteEndElement();

            writer.WriteEndElement();
        }
       
       

        protected void LinkButton2cancel_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        public string GetItemFromGrid()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var ColelctionMarkets = ddlItems.CheckedItems;
                    string cusIDs = "";
                    int i = 0;
                    int MarCount = ColelctionMarkets.Count;
                    if (ColelctionMarkets.Count > 0)
                    {
                        foreach (var item in ColelctionMarkets)
                        {
                            //where 1 = 1
                            createNode(ResponseID.ToString(), item.Value, writer);
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

        private void createNode(string RouteID, string prd_ID, XmlWriter writer)
        {
            writer.WriteStartElement("Values");

            writer.WriteStartElement("rop_rot_ID");
            writer.WriteString(RouteID);
            writer.WriteEndElement();

            writer.WriteStartElement("rop_prd_ID");
            writer.WriteString(prd_ID);
            writer.WriteEndElement();



            writer.WriteEndElement();
        }


        protected void save_Click(object sender, EventArgs e)
        {
            SaveData();
        }

        protected void LinkButton1Ok_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListRouteProduct.aspx?id=" + ResponseID.ToString());

        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            Delete();
        }

        protected void OKdelete_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

       
    }
}