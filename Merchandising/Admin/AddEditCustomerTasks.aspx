<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="AddEditCustomerTasks.aspx.cs" Inherits="Merchandising.Admin.AddEditCustomerTasks" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script>
        function Confim() {

            $('#modalConfirm').modal('show');
        }
        function Succcess(ab) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#Success').text(ab);
        }
        function FailureAlert(res) {
            $('#FailureAlert').modal('show');
            $('#failres').text(res);
            x++;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <span class="kt-subheader__separator kt-hidden"></span>
                            <div class="kt-subheader__breadcrumbs">
                                <a href="ListCustomerTasks.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Customers Tasks</a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> Add Edit Customer Tasks</a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Add Edit Customer Tasks
                            </h3>
                            <telerik:RadLabel ID="custask" runat="server" CssClass="kt-portlet__head-title"></telerik:RadLabel>

                        </div>
                        <div class="kt-portlet__head-actions" style="padding-top: 10px;">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="lnkSave" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" Text="Save" OnClick="lnkSave_Click" CausesValidation="true" ValidationGroup="form"></asp:LinkButton>
                                &nbsp;
                                    <a class="btn btn-brand btn-elevate btn-icon-sm" href="ListCustomerTasks.aspx">Cancel
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
                                <label class="control-label col-lg-12">Route<span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlRoute" runat="server" Width="100%" Filter="Contains" Visible="true" EmptyMessage="Select Route" RenderMode="Lightweight"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlRoute" ErrorMessage="Please Select Route" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Customer<span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlCus" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Customer" RenderMode="Lightweight"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlCus" ErrorMessage="Please Select Customer" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Brand<span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlbrd" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Brand" RenderMode="Lightweight"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlbrd" ErrorMessage="Please Select Brand" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Task Name<span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txttask" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                        ControlToValidate="txttask" ErrorMessage="Please Enter task Name" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Due Date <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <%--<telerik:RadTextBox ID="txtdate" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtdate" ErrorMessage="Please Enter Mobile" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    --%>
                                    <telerik:RadDatePicker RenderMode="Lightweight" ID="date" runat="server" Width="100%">
                                        <DateInput DateFormat="dd/MM/yyyy" runat="server" DisplayDateFormat="dd/MM/yyyy" />
                                    </telerik:RadDatePicker>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                        ControlToValidate="date" ErrorMessage="Please Select Date" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>
                            </div>



                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Description<span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtDesc" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtDesc" ErrorMessage="Please Enter Description" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Remarks<span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtremarks" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtremarks" ErrorMessage="Please Enter Remarks" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Status <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlStatus" runat="server" Width="100%" RenderMode="Lightweight">
                                        <Items>
                                            <telerik:DropDownListItem Text="Active" Value="P" Selected="true" />
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

    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-brand btn-elevate btn-icon-sm" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="reset" data-dismiss="modal" class="btn btn-secondary">
                        Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="Success"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="FailureAlert" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Failure</h5>
                </div>
                <div class="modal-body">
                    <span style="color: red"><strong></strong>&nbsp;&nbsp; <span id="failres"></span></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>
                </div>
            </div>
        </div>
    </div>

    <!--end::SuccessModal-->

    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span id="fail"></span>
                </div>
                <div class="modal-footer">
                    <button type="reset" data-dismiss="modal" class="btn btn-secondary">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
