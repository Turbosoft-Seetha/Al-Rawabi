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
    public partial class AddProducts : System.Web.UI.Page
    {
        GeneralFunctions ob = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);
                return ResponseID;
            }
        }
        public int Mode
        {
            get
            {
                int Mode;
                int.TryParse(Request.Params["Mode"], out Mode);
                return Mode;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                brand();
                category();
                Uom();
                ViewState["DataTable"] = null;
                try
                {


                    if (Mode == 1)
                    {
                        ViewState["DataTable"] = Session["DataTable"];
                        Uom();

                        
                        txtPName.Text = Session["pname"].ToString();
                        txtArabic.Text = Session["arabicName"].ToString();
                        txtCode.Text = Session["pcode"].ToString();
                        ddlcatid.SelectedValue = Session["pcat"].ToString();
                        subcategory(Session["pcat"].ToString());
                        ddlsubcatid.SelectedValue = Session["psubcat"].ToString();
                        ddlbrdid.SelectedValue = Session["pbrd"].ToString();
                        txtCode.Enabled = false; 
                        txtitemlong.Text = Session["Desc"].ToString();
                        ddlStat.SelectedValue = Session["Status"].ToString();
                       
                    }
                }
                catch (Exception ex)
                {
                    UICommon.LogException(ex, "Add Product");
                    String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                    ob.LogMessageToFile(UICommon.GetLogFileName(), "AddProducts.aspx Page_Load()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

                }


            }
        }
        public void SaveData()
        {
            string pname, arabicName, pcode, pcat, psubcat, pbrd,  Desc, Status, user;
            pname = txtPName.Text.ToString();
            arabicName = txtArabic.Text.ToString();
            pcode = txtCode.Text.ToString();
            pcat = ddlcatid.SelectedValue.ToString();
            psubcat = ddlsubcatid.SelectedValue.ToString();
            pbrd = ddlbrdid.SelectedValue.ToString();
           
            user = UICommon.GetCurrentUserID().ToString();
            Desc = txtitemlong.Text.ToString();
            Status = ddlStat.SelectedValue.ToString();
            //uom = ddlUom.SelectedValue.ToString();
            //stdprice = txtStdPrice.Text.ToString();
            //UPC = txtupc.Text.ToString();
            //Default = ddlDefault.SelectedValue.ToString();
            


            //saleshold = ddlsaleshold.SelectedValue.ToString();

            if (psubcat.Equals("0"))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
            }
            else
            {
                string detail = GetItemFromGrid();


                string[] arr = { pcode, pcat, psubcat, pbrd, user, Desc, Status, arabicName,  detail };
                string Value = ob.SaveData("sp_Masters_Temp", "InsertProduct", pname, arr);
                int res = Int32.Parse(Value.ToString());
                ViewState["pid"] = res.ToString();
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Product has been saved sucessfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }



            }



        }
        public void category()
        {
            DataTable dt = ob.loadList("SelectCategoryForProducts", "sp_Masters_Temp");
            ddlcatid.DataSource = dt;
            ddlcatid.DataTextField = "cat_Name";
            ddlcatid.DataValueField = "cat_ID";
            ddlcatid.DataBind();
        }
        public void subcategory(string cat)
        {

            DataTable ds = ob.loadList("SelectSubCategoryForProducts", "sp_Masters_Temp", cat);
            ddlsubcatid.DataSource = ds;
            ddlsubcatid.DataTextField = "sct_Name";
            ddlsubcatid.DataValueField = "sct_ID";
            ddlsubcatid.DataBind();
            ViewState["dd"] = ds;
        }
        public void brand()
        {
            DataTable dt = ob.loadList("SelectBrandForProducts", "sp_Masters_Temp");
            ddlbrdid.DataSource = dt;
            ddlbrdid.DataTextField = "brd_Name";
            ddlbrdid.DataValueField = "brd_ID";
            ddlbrdid.DataBind();
        }
        public void Uom()
        {
            string mainCondition = "";
            mainCondition = UOMCondition();
            DataTable dt = ob.loadList("SelectUomDrop", "sp_Masters_Temp", mainCondition);
            ddlUom.DataSource = dt;
            ddlUom.DataTextField = "uom_Name";
            ddlUom.DataValueField = "uom_ID";
            ddlUom.DataBind();
        }
        public string Item()
        {

            string UOMID = "";
            int j = 0;

            DataTable dsc = (DataTable)ViewState["DataTable"];

            if (dsc != null)
            {
                foreach (DataRow row in dsc.Rows)
                {
                    int MarCount = (dsc.Rows.Count);

                    string uom_ID = row["uomID"].ToString();

                    if (j == 0)
                    {
                        UOMID += uom_ID.ToString() + ",";
                    }
                    else if (j > 0)
                    {
                        UOMID += uom_ID.ToString() + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        UOMID += uom_ID.ToString();
                    }
                    j++;
                }
                return UOMID;
            }
            else
            {
                return "0";
            }


        }
        public string UOMCondition()
        {

            string ID = Item();
            string uomCondition = "";

            string uom = ddlUom.SelectedValue.ToString();

            try
            {
                if (ID.Equals("0"))
                {

                    uomCondition = " uom_ID not in (0)";
                }
                else
                {

                    uomCondition = " uom_ID not in (" + ID + ")";
                }
            }
            catch (Exception ex)
            {

            }


            return uomCondition;
        }
        protected void lnkSave_Click(object sender, EventArgs e)
        {
            DataTable dsc = (DataTable)ViewState["DataTable"];
            if (dsc == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                    "tmp", "<script type='text/javascript'>failedModal('Add Atleast one UOM for the Product');</script>", false);
                return;
            }
            else
            {


                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
            }
        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = ob.loadList("CheckProductCode", "sp_CodeChecker", code);
            if (lstCodeChecker.Rows.Count > 0)
            {
                lblCodeDupli.Text = "Code Already Exist";
                lnkSave.Enabled = false;
                lblCodeDupli.Visible = true;
            }
            else
            {
                lnkSave.Enabled = true;
                lblCodeDupli.Visible = false;
            }
        }

        protected void ddlcatid_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string cat = ddlcatid.SelectedValue.ToString();
            ddlsubcatid.DataSource = "";
            ddlsubcatid.DataBind();
            subcategory(cat);
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            string pname, arabicName, pcode, pcat, psubcat, pbrd, Desc, Status, user;
            pname = txtPName.Text.ToString();
            arabicName = txtArabic.Text.ToString();
            pcode = txtCode.Text.ToString();
            pcat = ddlcatid.SelectedValue.ToString();
            psubcat = ddlsubcatid.SelectedValue.ToString();
            pbrd = ddlbrdid.SelectedValue.ToString();
            
            user = UICommon.GetCurrentUserID().ToString();
            Desc = txtitemlong.Text.ToString();
            Status = ddlStat.SelectedValue.ToString();

            
            try
            {


                Session["pname"] = pname;
                Session["arabicName"] = arabicName;
                Session["pcode"] = pcode;
                Session["pcat"] = pcat;
                Session["psubcat"] = psubcat;
                Session["pbrd"] = pbrd;
                
                Session["Desc"] = Desc;
                Session["Status"] = Status;
                
            }
            catch (Exception ex)
            {

                UICommon.LogException(ex, "Add Product");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ob.LogMessageToFile(UICommon.GetLogFileName(), "AddProducts.aspx Page_Load()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

            }
            addTable();

            Response.Redirect("AddProducts.aspx?Mode=1");


        }
        public void addTable()
        {

            string stdprice, UPC, Default, uom,uomID, DefaultVal;
            DataTable dts = default(DataTable);
            if (ViewState["DataTable"] == null)
            {
                dts = new DataTable();

                dts.Columns.Add("uomID");
                dts.Columns.Add("stdprice");
                dts.Columns.Add("UPC");
                dts.Columns.Add("DefaultVal");
                dts.Columns.Add("Default");
              
                dts.Columns.Add("uom");







            }
            else
            {
                dts = (DataTable)ViewState["DataTable"];
            }
            if (dts.Rows.Count > 0)
            {

                uomID = ddlUom.SelectedValue.ToString();
                stdprice = txtStdPrice.Text.ToString();
                UPC = txtupc.Text.ToString();
                DefaultVal = ddlDefault.SelectedValue.ToString();
                Default = ddlDefault.SelectedText.ToString();
                
                uom = ddlUom.SelectedItem.Text.ToString();
                dts.Rows.Add(uomID, stdprice, UPC, DefaultVal, Default, uom);
            }
            else
            {

                uomID = ddlUom.SelectedValue.ToString();
                stdprice = txtStdPrice.Text.ToString();
                UPC = txtupc.Text.ToString();

                DefaultVal = ddlDefault.SelectedValue.ToString();
                Default = ddlDefault.SelectedText.ToString();
               


                uom = ddlUom.SelectedItem.Text.ToString();


                dts.Rows.Add(uomID, stdprice, UPC, DefaultVal, Default,  uom);

            }

            ViewState["DataTable"] = dts;
            Session["DataTable"] = dts;
            grvRpt.DataSource = dts;
            grvRpt.DataBind();

            txtupc.Text = "";
            txtStdPrice.Text = "";




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
                    DataTable dsc = (DataTable)ViewState["DataTable"];
                    foreach (DataRow row in dsc.Rows)
                    {

                        string uomID = row["uomID"].ToString();
                        string stdprice = row["stdprice"].ToString();
                        string upc = row["UPC"].ToString();
                        string defaul = row["DefaultVal"].ToString();
                       // string saleshold = row["salesholdVal"].ToString();
                        //string uom = row["uom"].ToString();

                        //if (Mode.Equals("0"))
                        //{
                        createNode(uomID, stdprice, upc, defaul,  writer);
                        //}
                        c++;
                    }

                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                    writer.Close();

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
        }

        private void createNode(string uomID, string stdprice, string upc, string defaul,  XmlWriter writer)
        {
            writer.WriteStartElement("Values");


            writer.WriteStartElement("uomID");
            writer.WriteString(uomID);
            writer.WriteEndElement();

            writer.WriteStartElement("stdprice");
            writer.WriteString(stdprice);
            writer.WriteEndElement();

            writer.WriteStartElement("UPC");
            writer.WriteString(upc);
            writer.WriteEndElement();

            writer.WriteStartElement("Default");
            writer.WriteString(defaul);
            writer.WriteEndElement();

          


            writer.WriteEndElement();
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadData();

        }
        public void LoadData()
        {

            DataTable dt = (DataTable)ViewState["DataTable"];
            grvRpt.DataSource = dt;

            //string pid = ResponseID.ToString();
            //DataTable lstDatas = default(DataTable);
            //lstDatas = ob.loadList("ListUomProducts", "sp_Masters_UOM", pid);
            //if (lstDatas.Rows.Count >= 0)
            //{
            //    grvRpt.DataSource = lstDatas;
            //    //pnls.Visible = true;
            //}
            //else
            //{
            //    // pnls.Visible = false;
            //}
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                ViewState["DeleteID"] = null;
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("uomID").ToString();
                ViewState["delID"] = ID;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>delConfim();</script>", false);
            }
        }

        protected void BtnConfim_Click(object sender, EventArgs e)
        {
            LoadData();
            grvRpt.DataBind();
        }

        protected void Okbtn_Click(object sender, EventArgs e)
        {
            string ID;
            if (ResponseID.Equals("0") || ResponseID == 0)
            {
                ID = ViewState["pid"].ToString();
            }
            else
            {
                ID = ResponseID.ToString();
            }

            Response.Redirect("AddProducts.aspx?Id=" + ID);
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListProducts.aspx");
        }

        protected void BtnConfrmDelete_Click(object sender, EventArgs e)
        {
            string ID = ViewState["delID"].ToString();
            DataTable dts = (DataTable)ViewState["DataTable"];
            for (int i = dts.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = dts.Rows[i];
                string dd = dr["uomID"].ToString();
                if (dr["uomID"].Equals(ID))
                    dr.Delete();
            }
            dts.AcceptChanges();
            ViewState["DataTable"] = dts;
            int x = dts.Rows.Count;
            grvRpt.DataSource = dts;
            grvRpt.DataBind();
            Uom();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal();</script>", false);

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {

        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListProducts.aspx");

        }

        protected void save_Click(object sender, EventArgs e)
        {
            SaveData();
        }
    }
}