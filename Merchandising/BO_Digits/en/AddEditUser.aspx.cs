﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Ecosoft.DAL;
using System.Data;
using System.Text;
using System.Net.Mail;
using System.Configuration;
using Telerik.Web.UI;
using System.Xml;
using System.IO;

namespace Merchandising.BO_Digits.en
{
    public partial class AddEditUser : System.Web.UI.Page
    {


        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (string.IsNullOrEmpty(Request.Params["Id"]))
                    {
                        this.chkActive.Checked = true;
                    }
                    //Division();
                    DM.Visible = false;
                    DSAM.Visible = false;
                    DAM.Visible = false;
                    CM.Visible = false;
                    SM.Visible = false;
                    UserTypes();
                    this.FillForm();


                }
            }
            catch (Exception ex)
            {
                UICommon.LogException(ex, "Add Edit User");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditUser.aspx Page_Load()", "Error : " + ex.Message.ToString() + " - " + innerMessage);



            }
        }



        private void FillForm()
        {
            if (string.IsNullOrEmpty(Request.Params["Id"]))
            {
                return;
            }


            UserProfile userProfile = DALHelper.GetUsers(userCriteria => userCriteria.UserId == new Guid(Request.Params["Id"])).First();

            this.txtUsername.Text = userProfile.UserName;
            this.txtContactInfo.Text = userProfile.ContacInfo;
            this.txtFirstName.Text = userProfile.FirstName;
            this.txtLastName.Text = userProfile.LastName;
            this.txtEmail.Text = userProfile.Email;

            MembershipUser user = Membership.GetUser(this.txtUsername.Text);

            this.chkActive.Checked = user.IsApproved;
            this.txtUsername.Enabled = false;

            string ID = userProfile.ID.ToString();
            //DataTable lstData = ObjclsFrms.loadList("SelectUserDivisionByUserID", "sp_Masters", ID.ToString());
            //if (lstData.Rows.Count > 0)
            //{
            //    string[] words = new string[500];
            //    for (int i = 0; i<lstData.Rows.Count; i++)
            //    {
            //        string id = lstData.Rows[i]["usd_sdv_ID"].ToString();
            //        words[i] = id;
            //    }
            //    foreach (var word in words)
            //    {
            //        foreach (RadComboBoxItem rd in ddlDivision.Items)
            //        {
            //            if (rd.Value.Equals(word))
            //            {
            //                rd.Checked = true;
            //            }
            //        }
            //    }
            //}
            DataTable lstCode = ObjclsFrms.loadList("SelectEmployeeCodeForUser", "sp_Masters", ID.ToString());
            if (lstCode.Rows.Count > 0)
            {
                string code = lstCode.Rows[0]["EmployeeCode"].ToString();
            }

            DataTable lstdatas = ObjclsFrms.loadList("SelDepotEdit", "sp_Masters", ID.ToString());
            if (lstdatas.Rows.Count > 0)
            {
                ddlUserType.SelectedValue = lstdatas.Rows[0]["usl_ust_ID"].ToString();
                DataTable lstData = ObjclsFrms.loadList("SelUserTypeByID", "sp_Masters", ddlUserType.SelectedValue.ToString());
                if (lstData.Rows.Count > 0)
                {


                    string Usertype = lstData.Rows[0]["ust_Value"].ToString();

                    ViewState["UserType"] = Usertype;
                }

                if (ViewState["UserType"].ToString() == "CM")
                {
                    CM.Visible = true;
                    DAM.Visible = false;
                    DSAM.Visible = false;
                    DM.Visible = false;
                    SM.Visible = false;

                    CMCheckB();
                    DataTable Depot = ObjclsFrms.loadList("SelDepotcheckbox", "sp_Masters", ID.ToString());
                    if (Depot.Rows.Count > 0)
                    {
                        foreach (DataRow row in Depot.Rows)
                        {
                            foreach (RadComboBoxItem items in CMCheckBox.Items)
                            {
                                if ((items.Value.ToString()) == (row["usl_LevelID"].ToString()))
                                {
                                    items.Checked = true;
                                }
                            }
                        }
                    }
                }

                if (ViewState["UserType"].ToString() == "SM")
                {
                    CM.Visible = false;
                    SM.Visible = true;
                    DM.Visible = false;
                    DAM.Visible = false;
                    DSAM.Visible = false;
                    DataTable DepotinSM = ObjclsFrms.loadList("SelUserLevelIDInSM", "sp_Masters", ID.ToString());
                    string CountryM = DepotinSM.Rows[0]["cou_ID"].ToString();
                    CMDropinSM();
                    ddlCMinSM.SelectedValue = CountryM;


                    SMCheckB();
                    DataTable Depot = ObjclsFrms.loadList("SelDepotcheckbox", "sp_Masters", ID.ToString());
                    if (Depot.Rows.Count > 0)
                    {
                        foreach (DataRow row in Depot.Rows)
                        {
                            foreach (RadComboBoxItem items in SMCheckBox.Items)
                            {
                                if ((items.Value.ToString()) == (row["usl_LevelID"].ToString()))
                                {
                                    items.Checked = true;
                                }
                            }
                        }
                    }
                }
                if (ViewState["UserType"].ToString() == "DM")
                {
                    DM.Visible = true;
                    DAM.Visible = false;
                    DSAM.Visible = false;
                    CM.Visible = false;
                    SM.Visible = false;

                    DataTable userlevelDM = ObjclsFrms.loadList("SelUserLevelIDInDM", "sp_Masters", ID.ToString());
                    string CountryM = userlevelDM.Rows[0]["cou_ID"].ToString();
                    string SalesM = userlevelDM.Rows[0]["reg_ID"].ToString();
                    CMDropinDM();
                    ddlCMinDM.SelectedValue = CountryM;
                    SMDropinDM();

                    ddlSMinDM.SelectedValue = SalesM;


                    DepotCheckB();
                    DataTable Depot = ObjclsFrms.loadList("SelDepotcheckbox", "sp_Masters", ID.ToString());
                    if (Depot.Rows.Count > 0)
                    {
                        foreach (DataRow row in Depot.Rows)
                        {
                            foreach (RadComboBoxItem items in cbDepot.Items)
                            {
                                if ((items.Value.ToString()) == (row["usl_LevelID"].ToString()))
                                {
                                    items.Checked = true;
                                }
                            }
                        }
                    }
                }
                if (ViewState["UserType"].ToString() == "AM")
                {
                    DAM.Visible = true;
                    DM.Visible = false;
                    DSAM.Visible = false;
                    CM.Visible = false;
                    SM.Visible = false;


                    DataTable DepotinAM = ObjclsFrms.loadList("SelDepotIDInAM", "sp_Masters", ID.ToString());
                    string CountryM = DepotinAM.Rows[0]["cou_ID"].ToString();
                    string SalesM = DepotinAM.Rows[0]["reg_ID"].ToString();
                    string depot = DepotinAM.Rows[0]["dep_ID"].ToString();
                    CMDropinAM();
                    ddlCMinAM.SelectedValue = CountryM;
                    SMDropinAM();
                    ddlSMinAM.SelectedValue = CountryM;

                    DepotDropAM();


                    ddlDepotAM.SelectedValue = depot;
                    DepotAMCheckB();
                    DataTable DepotAM = ObjclsFrms.loadList("SelDepotcheckbox", "sp_Masters", ID.ToString());

                    if (DepotAM.Rows.Count > 0)
                    {
                        foreach (DataRow row in DepotAM.Rows)
                        {
                            foreach (RadComboBoxItem items in cbDepotAM.Items)
                            {
                                if (items.Value.ToString() == row["usl_LevelID"].ToString())
                                {
                                    items.Checked = true;
                                }
                            }
                        }

                        //for (int i = 0; i < arr.Length; i++)
                        //{
                        //    foreach (RadComboBoxItem items in cbDepotAM.Items)
                        //    {
                        //        if (items.Value == arr[i])
                        //        {
                        //            items.Checked = true;
                        //        }
                        //    }
                        //}

                    }
                }
                if (ViewState["UserType"].ToString() == "SS")
                {
                    DSAM.Visible = true;
                    DM.Visible = false;
                    DAM.Visible = false;
                    CM.Visible = false;
                    SM.Visible = false;


                    DataTable DepotinSAM = ObjclsFrms.loadList("SelDepotIDInSAM", "sp_Masters", ID.ToString());
                    string CountryM = DepotinSAM.Rows[0]["cou_ID"].ToString();
                    string SalesM = DepotinSAM.Rows[0]["reg_ID"].ToString();
                    string depot = DepotinSAM.Rows[0]["dep_ID"].ToString();
                    string depotarea = DepotinSAM.Rows[0]["dpa_ID"].ToString();
                    CMDropinSS();
                    ddlCMinSS.SelectedValue = CountryM;
                    SMDropinSS();
                    ddlSMinSS.SelectedValue = SalesM;
                    DepotDropSAM();
                    ddlDepotSAM.SelectedValue = depot;
                    DepotAMDropSAM();





                    ddlDepotAreaSAM.SelectedValue = depotarea;
                    DepotSAMCheckB();
                    DataTable DepotSAM = ObjclsFrms.loadList("SelDepotcheckbox", "sp_Masters", ID.ToString());


                    if (DepotSAM.Rows.Count > 0)
                    {
                        foreach (DataRow row in DepotSAM.Rows)
                        {
                            foreach (RadComboBoxItem items in cbDepotSAM.Items)
                            {
                                if ((items.Value.ToString()) == (row["usl_LevelID"].ToString()))
                                {
                                    items.Checked = true;
                                }
                            }
                        }
                        //for (int i = 0; i < arr.Length; i++)
                        //    {
                        //        foreach (RadComboBoxItem items in cbDepotSAM.Items)
                        //        {
                        //            if (items.Value == arr[i])
                        //            {
                        //                items.Checked = true;
                        //            }
                        //        }
                        //    }

                    }
                }

            }
            else
            {
                DataTable lstData = ObjclsFrms.loadList("SelectUserTypeByID", "sp_Masters",ID.ToString() );
                if(lstData.Rows.Count > 0)
                {
                    //string Usertype = lstData.Rows[0]["UserType"].ToString();
                    string UsertypeID = lstData.Rows[0]["ust_ID"].ToString();
                    ddlUserType.SelectedValue = UsertypeID;

                    
                }
            }



        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                UserProfile userProfile = new UserProfile();
                MembershipUser user;
                //string password = Membership.GeneratePassword(8, 1);
                string password = ConfigurationManager.AppSettings.Get("DeffPass").ToString();
                //string password = "User@123";
                if (!string.IsNullOrEmpty(Request.Params["Id"]))
                {
                    userProfile = DALHelper.GetUsers(userCriteria => userCriteria.UserId == new Guid(Request.Params["id"])).First();
                    user = Membership.GetUser(this.txtUsername.Text);
                }
                else
                {
                    if (Membership.GetUser(this.txtUsername.Text) != null)
                    {
                        this.ltrlMessage.Text = UICommon.GetErrorMessage("User already exists");
                        //System.Windows.Forms.MessageBox.Show("User already exists", "Add Edit User");
                        return;
                    }

                    //string password = "user@123";
                    user = Membership.CreateUser(this.txtUsername.Text, password);

                    userProfile.CreatedDate = DateTime.Now;
                    userProfile.CreatedBy = UICommon.GetCurrentUserID();
                }

                user.IsApproved = this.chkActive.Checked;
                Membership.UpdateUser(user);
                userProfile.ModifiedDate = DateTime.Now;
                userProfile.ModifiedBy = UICommon.GetCurrentUserID();
                userProfile.UserId = new Guid(user.ProviderUserKey.ToString());
                userProfile.FirstName = this.txtFirstName.Text;
                userProfile.LastName = this.txtLastName.Text;
                userProfile.Email = this.txtEmail.Text;
                userProfile.ContacInfo = this.txtContactInfo.Text;
                userProfile.CreatedDate = DateTime.Now;
                userProfile.Active = this.chkActive.Checked;
                userProfile.UserName = user.UserName;
                // userProfile.UserType = ViewState["UserType"].ToString();
                int Id = DALHelper.UpdateUserProfile(userProfile);
                ViewState["userID"] = Id.ToString();

                //ObjclsFrms.loadList("DeleteUserDivisionByUserID", "sp_Masters", Id.ToString());
                //var SelectedDivision = ddlDivision.CheckedItems;
                //string divi = "";
                //string[] arr = { Id.ToString() };
                //foreach (var item in SelectedDivision)
                //{
                //    divi = item.Value;
                //    ObjclsFrms.SaveData("sp_Masters", "InsertUserDivision", divi.ToString(), arr);
                //}

                //string empCode;
                //empCode = txtEmpCode.Text.ToString();
                //string[] arrs = { empCode.ToString() };
                //ObjclsFrms.SaveData("sp_Masters", "UpdateEmployeeCodeForUserProfile", Id.ToString(), arrs);

                //DataTable dtLogin = ObjclsFrms.loadList("SelLoginCredentailsForNAC", "sp_Masters");
                //if (dtLogin.Rows.Count > 0)
                //{
                //    MailService(dtLogin, "BSMEA - Eclaim Account Activation for BSMEA Users", password);
                //}
                if (ViewState["UserType"].ToString() == "DM")
                {
                    SaveDM();
                }
                if (ViewState["UserType"].ToString() == "AM")
                {
                    SaveDAM();
                }
                if (ViewState["UserType"].ToString() == "SS")
                {
                    SaveDSAM();
                }
                if ((ViewState["UserType"].ToString() == "AD") || (ViewState["UserType"].ToString() == "SA"))
                {
                    SaveAdmin();
                }
                if (ViewState["UserType"].ToString() == "CM")
                {
                    SaveCM();
                }
                if (ViewState["UserType"].ToString() == "SM")
                {
                    SaveSM();
                }
            }
            catch (Exception ex)
            {
                UICommon.LogException(ex, "Add Edit User");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditUser.aspx btnSave_Click()", "Error : " + ex.Message.ToString() + " - " + innerMessage);


            }
            Response.Redirect("Users.aspx");
        }
        public void SaveAdmin()
        {
            string usertype;

            usertype = ddlUserType.SelectedValue.ToString();
            string user = ViewState["userID"].ToString();




            string[] ar = { usertype };
            string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateUsertypeInUserProfile", user, ar);
            int res = Int32.Parse(Value.ToString());
            if (res > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
            }
        }

        public void SaveCM()
        {
            string usertype;

            usertype = ddlUserType.SelectedValue.ToString();
            string user = ViewState["userID"].ToString();
            string Depot = GetItemFromCM();

            if (string.IsNullOrEmpty(Request.Params["Id"]))
            {

                string[] ar = { Depot };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsDepot", user, ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
            else
            {
                string[] ar = { Depot };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateUserDepot", user, ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
        }
        public string GetItemFromCM()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var ColelctionMarkets = CMCheckBox.CheckedItems;

                    int i = 0;
                    int MarCount = ColelctionMarkets.Count;
                    if (ColelctionMarkets.Count > 0)
                    {
                        foreach (var item in ColelctionMarkets)
                        {
                            //where 1 = 1
                            string user = ViewState["userID"].ToString();
                            string usertype = ddlUserType.SelectedValue.ToString();
                            createNode3(user, item.Value, usertype, writer);
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



        public void SaveSM()
        {
            string usertype;

            usertype = ddlUserType.SelectedValue.ToString();
            string user = ViewState["userID"].ToString();
            string Depot = GetItemFromSM();

            if (string.IsNullOrEmpty(Request.Params["Id"]))
            {

                string[] ar = { Depot };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsDepot", user, ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
            else
            {
                string[] ar = { Depot };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateUserDepot", user, ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
        }
        public string GetItemFromSM()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var ColelctionMarkets = SMCheckBox.CheckedItems;

                    int i = 0;
                    int MarCount = ColelctionMarkets.Count;
                    if (ColelctionMarkets.Count > 0)
                    {
                        foreach (var item in ColelctionMarkets)
                        {
                            //where 1 = 1
                            string user = ViewState["userID"].ToString();
                            string usertype = ddlUserType.SelectedValue.ToString();
                            createNode3(user, item.Value, usertype, writer);
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


        public void SaveDM()
        {
            string usertype;

            usertype = ddlUserType.SelectedValue.ToString();
            string user = ViewState["userID"].ToString();
            string Depot = GetItemFromDM();

            if (string.IsNullOrEmpty(Request.Params["Id"]))
            {

                string[] ar = { Depot };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsDepot", user, ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
            else
            {
                string[] ar = { Depot };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateUserDepot", user, ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
        }
        public string GetItemFromDM()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var ColelctionMarkets = cbDepot.CheckedItems;

                    int i = 0;
                    int MarCount = ColelctionMarkets.Count;
                    if (ColelctionMarkets.Count > 0)
                    {
                        foreach (var item in ColelctionMarkets)
                        {
                            //where 1 = 1
                            string user = ViewState["userID"].ToString();
                            string usertype = ddlUserType.SelectedValue.ToString();
                            createNode3(user, item.Value, usertype, writer);
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

        private void createNode3(string userID, string DepotID, string UserType, XmlWriter writer)
        {
            writer.WriteStartElement("Values");

            writer.WriteStartElement("usl_UserID");
            writer.WriteString(userID);
            writer.WriteEndElement();

            writer.WriteStartElement("usl_LevelID");
            writer.WriteString(DepotID);
            writer.WriteEndElement();

            writer.WriteStartElement("usl_ust_ID");
            writer.WriteString(UserType);
            writer.WriteEndElement();

            writer.WriteEndElement();
        }
        public void SaveDAM()
        {
            string usertype;
            usertype = ddlUserType.SelectedValue.ToString();
            string user = ViewState["userID"].ToString();
            string DepotArea = GetItemFromDAM();
            if (string.IsNullOrEmpty(Request.Params["Id"]))
            {
                string[] ar = { DepotArea, user };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsDepot", usertype.ToString(), ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
            else
            {
                string[] ar = { DepotArea, user };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateUserDepot", usertype.ToString(), ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }


        }
        public string GetItemFromDAM()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var ColelctionMarkets = cbDepotAM.CheckedItems;

                    int i = 0;
                    int MarCount = ColelctionMarkets.Count;
                    if (ColelctionMarkets.Count > 0)
                    {
                        foreach (var item in ColelctionMarkets)
                        {
                            //where 1 = 1


                            string user = ViewState["userID"].ToString();
                            string usertype = ddlUserType.SelectedValue.ToString();
                            createNode3(user, item.Value, usertype, writer);
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


        public void SaveDSAM()
        {
            string usertype;
            usertype = ddlUserType.SelectedValue.ToString();

            string user = ViewState["userID"].ToString();
            string DepotSubArea = GetItemFromDSAM();
            if (string.IsNullOrEmpty(Request.Params["Id"]))
            {
                string[] ar = { DepotSubArea, user };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsDepot", usertype.ToString(), ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
            else
            {
                string[] ar = { DepotSubArea, user };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateUserDepot", usertype.ToString(), ar);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Depot Area successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
                }
            }
        }
        public string GetItemFromDSAM()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var ColelctionMarkets = cbDepotSAM.CheckedItems;

                    int i = 0;
                    int MarCount = ColelctionMarkets.Count;
                    if (ColelctionMarkets.Count > 0)
                    {
                        foreach (var item in ColelctionMarkets)
                        {
                            //where 1 = 1


                            string user = ViewState["userID"].ToString();
                            string usertype = ddlUserType.SelectedValue.ToString();
                            createNode3(user, item.Value, usertype, writer);
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


        public void MailService(DataTable dx, string Subject, string password)
        {
            StringBuilder sb = new StringBuilder();
            string body = dx.Rows[0]["emb_Body"].ToString();

            body = body.Replace("{0}", this.txtFirstName.Text);
            body = body.Replace("{1}", txtUsername.Text.ToString());
            body = body.Replace("{2}", password);

            MailMessage message = new MailMessage();
            message.Body = body.ToString();
            message.IsBodyHtml = true;
            string email = ConfigurationManager.AppSettings.Get("NACEmail").ToString();
            message.From = new MailAddress(dx.Rows[0]["tcl_User"].ToString());

            message.To.Add(this.txtEmail.Text.ToString());
            message.To.Add(email);

            message.Subject = Subject;
            SmtpClient smtp = new SmtpClient(dx.Rows[0]["tcl_Client"].ToString());
            smtp.Credentials = new System.Net.NetworkCredential(dx.Rows[0]["tcl_User"].ToString(), dx.Rows[0]["tcl_Pass"].ToString());
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Send(message);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }

        public void UserTypes()
        {
            DataTable dt = ObjclsFrms.loadList("SelectUserTypeFromDrop", "sp_Masters");
            ddlUserType.DataSource = dt;
            ddlUserType.DataTextField = "ust_Name";
            ddlUserType.DataValueField = "ust_ID";
            ddlUserType.DataBind();
        }
        //Country Manager
        public void CMCheckB()
        {
            DataTable dt = ObjclsFrms.loadList("SelCountryManager", "sp_Masters");
            CMCheckBox.DataSource = dt;
            CMCheckBox.DataTextField = "cou_Name";
            CMCheckBox.DataValueField = "cou_ID";
            CMCheckBox.DataBind();
        }
        //Sales Manager
        public void CMDropinSM()
        {
            DataTable dt = ObjclsFrms.loadList("SelCountryManager", "sp_Masters");
            ddlCMinSM.DataSource = dt;
            ddlCMinSM.DataTextField = "cou_Name";
            ddlCMinSM.DataValueField = "cou_ID";
            ddlCMinSM.DataBind();
        }
        public void SMCheckB()
        {
            DataTable dt = ObjclsFrms.loadList("SelSalesManager", "sp_Masters", ddlCMinSM.SelectedValue.ToString());
            SMCheckBox.DataSource = dt;
            SMCheckBox.DataTextField = "reg_Name";
            SMCheckBox.DataValueField = "reg_ID";
            SMCheckBox.DataBind();
        }

        //Depot Manager

        public void CMDropinDM()
        {
            DataTable dt = ObjclsFrms.loadList("SelCountryManager", "sp_Masters");
            ddlCMinDM.DataSource = dt;
            ddlCMinDM.DataTextField = "cou_Name";
            ddlCMinDM.DataValueField = "cou_ID";
            ddlCMinDM.DataBind();
        }
        public void SMDropinDM()
        {
            DataTable dt = ObjclsFrms.loadList("SelSalesManager", "sp_Masters", ddlCMinDM.SelectedValue.ToString());
            ddlSMinDM.DataSource = dt;
            ddlSMinDM.DataTextField = "reg_Name";
            ddlSMinDM.DataValueField = "reg_ID";
            ddlSMinDM.DataBind();
        }
        public void DepotCheckB()
        {
            DataTable dt = ObjclsFrms.loadList("SelDepotDrop", "sp_Masters", ddlSMinDM.SelectedValue.ToString());
            cbDepot.DataSource = dt;
            cbDepot.DataTextField = "dep_Name";
            cbDepot.DataValueField = "dep_ID";
            cbDepot.DataBind();
        }

        //

        public void CMDropinAM()
        {
            DataTable dt = ObjclsFrms.loadList("SelCountryManager", "sp_Masters");
            ddlCMinAM.DataSource = dt;
            ddlCMinAM.DataTextField = "cou_Name";
            ddlCMinAM.DataValueField = "cou_ID";
            ddlCMinAM.DataBind();
        }
        public void SMDropinAM()
        {
            DataTable dt = ObjclsFrms.loadList("SelSalesManager", "sp_Masters", ddlCMinAM.SelectedValue.ToString());
            ddlSMinAM.DataSource = dt;
            ddlSMinAM.DataTextField = "reg_Name";
            ddlSMinAM.DataValueField = "reg_ID";
            ddlSMinAM.DataBind();
        }
        public void DepotDropAM()
        {
            DataTable dt = ObjclsFrms.loadList("SelDepotDrop", "sp_Masters", ddlSMinAM.SelectedValue.ToString());
            ddlDepotAM.DataSource = dt;
            ddlDepotAM.DataTextField = "dep_Name";
            ddlDepotAM.DataValueField = "dep_ID";
            ddlDepotAM.DataBind();
        }
        public void DepotAMCheckB()
        {
            DataTable dt = ObjclsFrms.loadList("SelDepotAMDrop", "sp_Masters", ddlDepotAM.SelectedValue.ToString());
            cbDepotAM.DataSource = dt;
            cbDepotAM.DataTextField = "dpa_Name";
            cbDepotAM.DataValueField = "dpa_ID";
            cbDepotAM.DataBind();
        }

        //

        public void CMDropinSS()
        {
            DataTable dt = ObjclsFrms.loadList("SelCountryManager", "sp_Masters");
            ddlCMinSS.DataSource = dt;
            ddlCMinSS.DataTextField = "cou_Name";
            ddlCMinSS.DataValueField = "cou_ID";
            ddlCMinSS.DataBind();
        }
        public void SMDropinSS()
        {
            DataTable dt = ObjclsFrms.loadList("SelSalesManager", "sp_Masters", ddlCMinSS.SelectedValue.ToString());
            ddlSMinSS.DataSource = dt;
            ddlSMinSS.DataTextField = "reg_Name";
            ddlSMinSS.DataValueField = "reg_ID";
            ddlSMinSS.DataBind();
        }
        public void DepotDropSAM()
        {
            DataTable dt = ObjclsFrms.loadList("SelDepotDrop", "sp_Masters", ddlSMinSS.SelectedValue.ToString());
            ddlDepotSAM.DataSource = dt;
            ddlDepotSAM.DataTextField = "dep_Name";
            ddlDepotSAM.DataValueField = "dep_ID";
            ddlDepotSAM.DataBind();
        }
        public void DepotAMDropSAM()
        {
            DataTable dt = ObjclsFrms.loadList("SelDepotAMDrop", "sp_Masters", ddlDepotSAM.SelectedValue.ToString());
            ddlDepotAreaSAM.DataSource = dt;
            ddlDepotAreaSAM.DataTextField = "dpa_Name";
            ddlDepotAreaSAM.DataValueField = "dpa_ID";
            ddlDepotAreaSAM.DataBind();
        }
        public void DepotSAMCheckB()
        {
            DataTable dt = ObjclsFrms.loadList("SelDepotSAMDrop", "sp_Masters", ddlDepotAreaSAM.SelectedValue.ToString());
            cbDepotSAM.DataSource = dt;
            cbDepotSAM.DataTextField = "dsa_Name";
            cbDepotSAM.DataValueField = "dsa_ID";
            cbDepotSAM.DataBind();
        }
        //
        protected void ddlUserType_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable lstDatas = ObjclsFrms.loadList("SelUserTypeByID", "sp_Masters", ddlUserType.SelectedValue.ToString());
            string Usertype = lstDatas.Rows[0]["ust_Value"].ToString();
            ViewState["UserType"] = Usertype;
            if (Usertype == "CM")
            {
                DM.Visible = false;
                DSAM.Visible = false;
                DAM.Visible = false;
                CM.Visible = true;
                SM.Visible = false;
                CMCheckB();

            }
            if (Usertype == "SM")
            {
                DM.Visible = false;
                DSAM.Visible = false;
                DAM.Visible = false;
                CM.Visible = false;
                SM.Visible = true;
                CMDropinSM();

            }
            if (Usertype == "DM")
            {
                DM.Visible = true;
                DSAM.Visible = false;
                DAM.Visible = false;
                CM.Visible = false;
                SM.Visible = false;
                CMDropinDM();

            }
            if (Usertype == "AM")
            {
                DAM.Visible = true;
                DM.Visible = false;
                DSAM.Visible = false;
                CM.Visible = false;
                SM.Visible = false;
                CMDropinAM();
                //DepotDropAM();

            }
            if (Usertype == "SS")
            {
                DSAM.Visible = true;
                DM.Visible = false;
                DAM.Visible = false;
                CM.Visible = false;
                SM.Visible = false;
                CMDropinSS();
                // DepotDropSAM();

            }
            if (Usertype == "AD")
            {
                DM.Visible = false;
                DSAM.Visible = false;
                DAM.Visible = false;
                CM.Visible = false;
                SM.Visible = false;


            }
            if (Usertype == "SA")
            {
                DM.Visible = false;
                DSAM.Visible = false;
                DAM.Visible = false;
                CM.Visible = false;
                SM.Visible = false;


            }

        }



        //Sales Manager
        protected void ddlCMinSM_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            SMCheckB();
        }
        //Depot Manager
        protected void ddlCMinDM_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            SMDropinDM();
        }

        protected void ddlSMinDM_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            DepotCheckB();
        }
        //Area Manager
        protected void ddlCMinAM_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            SMDropinAM();
        }

        protected void ddlSMinAM_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            DepotDropAM();
        }

        protected void ddlDepotAM_SelectedIndexChanged(object sender, EventArgs e)
        {
            DepotAMCheckB();
        }

        //Sales Supervisor

        protected void ddlCMinSS_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            SMDropinSS();
        }

        protected void ddlSMinSS_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            DepotDropSAM();
        }
        protected void ddlDepotSAM_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            DepotAMDropSAM();
        }

        protected void ddlDepotAreaSAM_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            DepotSAMCheckB();
        }

        protected void ddlSMinSS_SelectedIndexChanged1(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            DepotDropSAM();
        }

        protected void ddlCMinDM_SelectedIndexChanged1(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            SMDropinDM();
        }

        protected void ddlSMinDM_SelectedIndexChanged1(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            DepotCheckB();
        }

        protected void ddlCMinAM_SelectedIndexChanged1(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            SMDropinAM();
        }

        protected void ddlSMinAM_SelectedIndexChanged1(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            DepotDropAM();
        }
    }
}