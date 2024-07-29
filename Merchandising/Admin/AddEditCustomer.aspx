<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="AddEditCustomer.aspx.cs" Inherits="Merchandising.Admin.AddEditCustomer" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script>
        function Confim() {
            $('#kt_modal_1_3').modal('show');
        }
        function successModal() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_4').modal('show');
        }
        function failedModal() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_5').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid" style="padding-top: 40px;">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head" style="padding-top: 20px">

                        <span class="kt-subheader__separator kt-hidden"></span>
                        <div class="kt-subheader__breadcrumbs">


                            <a href="ListCustomer.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i> Customers </a>
                            <%--<span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>--%>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link"> Add Edit Customer </a>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                    </div>
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Add Edit Customer
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="lnkSave" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" Text="Save" OnClick="lnkSave_Click" CausesValidation="true" ValidationGroup="form"></asp:LinkButton>
                                &nbsp;
                                    <a class="btn btn-brand btn-elevate btn-icon-sm" href="ListCustomer.aspx">Cancel
                                    </a>
                            </telerik:RadAjaxPanel>

                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center">
                                    <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                        </div>
                    </div>
                    <!--begin::Forkt-->

                    <div class="kt-portlet__body">
                        <div class="col-lg-12 row">

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Code <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtCode" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtCode" ErrorMessage="Please Enter Code" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Name <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtName" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtName" ErrorMessage="Please Enter Name" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Address <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtAddress" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtAddress" ErrorMessage="Please Enter Address" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Mobile <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtMobile" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtMobile" ErrorMessage="Please Enter Mobile" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Email <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtMail" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtMail" ErrorMessage="Please Enter Email" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtMail"
                                        ErrorMessage="Please enter valid email address"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Geo Location <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtGeo" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtGeo" ErrorMessage="Please Enter Geo Location" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;" hidden="hidden">
                                <label class="control-label col-lg-12">Route<span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlRoute" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Route"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlRoute" ErrorMessage="Please Select Route" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Is Location Needed <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlLocationNeeded" runat="server" Width="100%">
                                        <Items>
                                            <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                            <telerik:DropDownListItem Text="No" Value="N" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Status <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlStatus" runat="server" Width="100%">
                                        <Items>
                                            <telerik:DropDownListItem Text="Active" Value="Y" Selected="true" />
                                            <telerik:DropDownListItem Text="Inactive" Value="N" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </div>
                            </div>

                        </div>

                        <!--end::Form-->
                    </div>
                    <!--end::Portlet-->

                </div>
            </div>
        </div>
    </div>

    <!--begin::ValidationModal-->
    <div class="modal fade" id="kt_modal_1_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to save ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" OnClick="LinkButton1_Click">
                                                    Save
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::ValidationModal-->

    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Customer has been updated successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-secondary">Ok</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

    <!--begin::FailureModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span>Something went wrong, please try again later.</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailureModal-->
</asp:Content>
