﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditUser.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditUser" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">

    <script type="text/javascript">
        function Confim(val) {

            $('#modalConfirm').modal('show');

        }
        function successModal(a) {
            $('modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#success').text(a);
        }
    </script>

</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary" CausesValidation="False" OnClick="btnCancel_Click" />
        <asp:LinkButton ID="btnSave" runat="server" ValidationGroup="form" OnClientClick="return Confim('Are you sure want to Update..?');" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed' CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" />

    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card-body" style="background-color: white; padding: 20px;">
        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!--begin::Portlet-->
                    <div class="kt-portlet">

                        <div class="kt-portlet__body">
                              <telerik:RadAjaxPanel ID="cdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                            <div class="col-lg-12 row">

                                <asp:Label ID="ltrlMessage" runat="server"></asp:Label>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">UserName<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtUsername" runat="server" Width="100%" CssClass="form-control"></telerik:RadTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ControlToValidate="txtUsername" ErrorMessage="Please Enter UserName" Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">Email <span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtEmail" runat="server" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                            ControlToValidate="txtEmail" ErrorMessage="Please Enter Email" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"
                                        ErrorMessage="Please enter valid email address"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group">
                                    <label class="control-label col-lg-12">First Name <span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtFirstName" runat="server" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ControlToValidate="txtFirstName" ErrorMessage="Please Enter First Name" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" Display="Dynamic"
                                            ValidationExpression="^[a-zA-Z .]+$" ControlToValidate="txtFirstName" ErrorMessage="Only alphabets allowed."></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Last Name</label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtLastName" runat="server" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                ControlToValidate="txtLastName" ErrorMessage="Please Enter Last Name" ForeColor="Red" Display="Dynamic"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" Display="Dynamic"
                                                ValidationExpression="^[a-zA-Z]+$" ControlToValidate="txtLastName" ErrorMessage="Only alphabets allowed."></asp:RegularExpressionValidator>--%>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Contact No</label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txtContactInfo" runat="server" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" Display="Dynamic"
                                            ValidationExpression="^[\+\d]?(?:[\d-.\s()]*){10}" ControlToValidate="txtContactInfo" ErrorMessage="Only numeric allowed."></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <%--<div class="col-lg-3 form-group">
                                    <label class="control-label col-lg-12">Division </label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlDivision" EmptyMessage="Select Division/s" runat="server" RenderMode="Lightweight"
                                            Width="100%" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" AutoPostBack="true">
                                        </telerik:RadComboBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                            ControlToValidate="ddlDivision" ErrorMessage="Please Select Division" Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>--%>
                                 <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">UserType<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlUserType" runat="server" EmptyMessage="Select User type" CausesValidation="false"  Width="100%" OnSelectedIndexChanged="ddlUserType_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                            ControlToValidate="ddlUserType" ErrorMessage="Please Enter User Type" EmptyMessage="Select User type" Display="Dynamic" ForeColor="Red" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>
                                  <asp:PlaceHolder runat="server" ID="CM" > 
                                  <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Country Manager<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="CMCheckBox" runat="server" EmptyMessage="Select Country manager" CheckBoxes="true"  Width="100%"  CausesValidation="false" EnableCheckAllItemsCheckBox="true" ></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                            ControlToValidate="CMCheckBox"  ErrorMessage="Please select any Country manager" Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>
                                   

                   </asp:PlaceHolder>
                                 <asp:PlaceHolder runat="server" ID="SM"> 
                                  <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Country Manager<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlCMinSM" runat="server" EmptyMessage="Select Country Manager " CausesValidation="false" Width="100%"  OnSelectedIndexChanged="ddlCMinSM_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                            ControlToValidate="ddlCMinSM" ErrorMessage="Please select any Country Manager"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                                      <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Sales Manager<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="SMCheckBox" CheckBoxes="true" EmptyMessage="Select Sales Manager" CausesValidation="false" EnableCheckAllItemsCheckBox="true" Width="100%"  runat="server" ></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                                            ControlToValidate="SMCheckBox" ErrorMessage="Please select any Sales Manager"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                   </asp:PlaceHolder>




                                <asp:PlaceHolder runat="server" ID="DM" > 

                                      <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Country Manager<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlCMinDM" runat="server" EmptyMessage="Select Country Manager" Width="100%" CausesValidation="false" OnSelectedIndexChanged="ddlCMinDM_SelectedIndexChanged1" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                                            ControlToValidate="ddlCMinDM" ErrorMessage="Please select any Country Manager"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                                      <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Sales Manager<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlSMinDM" runat="server" EmptyMessage="Select Sales Manager" Width="100%" CausesValidation="false"   OnSelectedIndexChanged="ddlSMinDM_SelectedIndexChanged1" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                                            ControlToValidate="ddlSMinDM" ErrorMessage="Please select any Sales Manager"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>




                                  <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Depot<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="cbDepot" runat="server" EmptyMessage="Select Depot" CheckBoxes="true"  Width="100%"  CausesValidation="false" EnableCheckAllItemsCheckBox="true" ></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ControlToValidate="cbDepot"  ErrorMessage="Please select any Depot" Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>
                                   

                   </asp:PlaceHolder>
                                 <asp:PlaceHolder runat="server" ID="DAM"> 
                                       <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Country Manager<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlCMinAM" runat="server" EmptyMessage="Select Country Manager" Width="100%" CausesValidation="false" OnSelectedIndexChanged="ddlCMinAM_SelectedIndexChanged1" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                            ControlToValidate="ddlCMinAM" ErrorMessage="Please select any Country Manager"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                                      <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Sales Manager<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlSMinAM" runat="server" EmptyMessage="Select Sales Manager" Width="100%" CausesValidation="false"   OnSelectedIndexChanged="ddlSMinAM_SelectedIndexChanged1" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                                            ControlToValidate="ddlSMinAM" ErrorMessage="Please select any Sales Manager"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>



                                  <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Depot<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlDepotAM" runat="server" EmptyMessage="Select Depot " CausesValidation="false" Width="100%"  OnSelectedIndexChanged="ddlDepotAM_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                            ControlToValidate="ddlDepotAM" ErrorMessage="Please select any Depot"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                                      <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Depot Area<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="cbDepotAM" CheckBoxes="true" EmptyMessage="Select Depot Area" CausesValidation="false" EnableCheckAllItemsCheckBox="true" Width="100%"  runat="server" ></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                            ControlToValidate="cbDepotAM" ErrorMessage="Please select any Depot Area"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                   </asp:PlaceHolder>

                               
                                 <asp:PlaceHolder runat="server" ID="DSAM"> 
                                       <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Country Manager<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlCMinSS" runat="server" EmptyMessage="Select Country Manager" Width="100%" CausesValidation="false" OnSelectedIndexChanged="ddlCMinSS_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
                                            ControlToValidate="ddlCMinSS" ErrorMessage="Please select any Country Manager"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                                      <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Sales Manager<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlSMinSS" runat="server"  Width="100%" CausesValidation="false" EmptyMessage="Select Sales Manager"  OnSelectedIndexChanged="ddlSMinSS_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server"
                                            ControlToValidate="ddlSMinSS" ErrorMessage="Please select any Sales Manager"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                                  <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Depot<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlDepotSAM" runat="server"  Width="100%" CausesValidation="false" OnSelectedIndexChanged="ddlDepotSAM_SelectedIndexChanged" EmptyMessage="Select Depot" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                            ControlToValidate="ddlDepotSAM" ErrorMessage="Please select any Depot"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                                      <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Depot Area<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="ddlDepotAreaSAM" runat="server"  Width="100%" CausesValidation="false"  EmptyMessage="Select Depot Area" OnSelectedIndexChanged="ddlDepotAreaSAM_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                            ControlToValidate="ddlDepotAreaSAM" ErrorMessage="Please select any Depot Area"  Display="Dynamic" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                                      <div class="col-lg-4 form-group" style="padding-top:10px;">
                                    <label class="control-label col-lg-12">Depot Sub Area<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox  ID="cbDepotSAM" runat="server"  Width="100%" CheckBoxes="true" CausesValidation="false" EmptyMessage="Select Depot SubArea" EnableCheckAllItemsCheckBox="true"></telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                            ControlToValidate="cbDepotSAM" ErrorMessage="Please select any Depot Sub Area"  Display="Dynamic"  ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                        
                                    </div>

                                </div>

                   </asp:PlaceHolder>
                               





                                <div class="col-lg-1 form-group">
                                    <label class="control-label col-lg-12">Active</label>
                                    <div class="col-lg-12">
                                        <asp:CheckBox ID="chkActive" runat="server" />
                                    </div>
                                </div>
                            </div>
</telerik:RadAjaxPanel>
                              <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="lnkAdds" runat="server" Text="Yes" OnClick="btnSave_Click" CssClass="btn btn-sm fw-bold btn-primary" />

                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(modalConfirm);">
                        Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>
      <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="success"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="LinkButton2" runat="server"  CssClass="btn btn-sm fw-bold btn-secondary">Ok</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <style type="text/css">
        .modal-center {
            position: absolute;
            top: 50% !important;
            transform: translate(0, -50%) !important;
            -ms-transform: translate(0, -50%) !important;
            -webkit-transform: translate(0, -50%) !important;
            margin: auto 5%;
        }
    </style>
    <a href="javascript:;" class="page-quick-sidebar-toggler">
        <i class="icon-login"></i>
    </a>

</asp:Content>
