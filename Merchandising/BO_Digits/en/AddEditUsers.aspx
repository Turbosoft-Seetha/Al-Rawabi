<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditUsers.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditUsers" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">

    
     <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="LinkButton2" Width="100px" runat="server"
                                    Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
                                    CausesValidation="False"  OnClick="LinkButton2_Click"/>
                                <asp:LinkButton ID="LinkButton3" Width="100px"
                               runat="server" ValidationGroup="form" OnClick="LinkButton3_Click" UseSubmitBehavior="false" 
                                    Text='<i class="icon-ok"></i>Proceed' CssClass="btn btn-sm fw-bold btn-primary"  CausesValidation="true"/>
                               
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="card-body" style="background-color:white; padding:20px;">
     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                  
                  
                    <!--begin::Forkt-->

                    <div class="kt-portlet__body">
                        <div class="col-lg-12 row">

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Code <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtCode" runat="server" CssClass="form-control" OnTextChanged="txtCode_TextChanged" Width="100%" AutoPostBack="true" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtCode" ErrorMessage="Please Enter Code" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                     <asp:Label ID="lblCodeDupli" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Name <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtName" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtName" ErrorMessage="Please Enter Name" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Type <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlType" runat="server" Width="100%" RenderMode="Lightweight">
                                        <Items>
                                            <telerik:DropDownListItem Text="Sales Executive" Value="S" Selected="true" />
                                            <telerik:DropDownListItem Text="Merchandiser" Value="M" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Mobile Number <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtMobile" runat="server" CssClass="form-control" Width="100%" NumberFormat-AllowRounding="false" DecimalDigits="0" 
                                        NumberFormat-GroupSeparator="" RenderMode="Lightweight"></telerik:RadNumericTextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtMobile" ErrorMessage="Please Enter Mobile" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Password <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtPass" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtPass" ErrorMessage="Please Enter Password" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Is Tracking Needed <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlTrNeed" runat="server" Width="100%" RenderMode="Lightweight">
                                        <Items>
                                            <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                            <telerik:DropDownListItem Text="No" Value="N" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Tracking Duration in Minutes<span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtTrDuration" runat="server" CssClass="form-control" Width="100%" NumberFormat-AllowRounding="false" DecimalDigits="0" NumberFormat-GroupSeparator="" RenderMode="Lightweight"></telerik:RadNumericTextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtTrDuration" ErrorMessage="Please Enter Tracking Duration" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Status <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlStatus" runat="server" Width="100%" RenderMode="Lightweight">
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
                        <asp:LinkButton ID="SaveButton1" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="SaveButton1_Click">
                                                    Save
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_3);">Cancel</button>
                       
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
                    <span>User has been updated successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">Ok</asp:LinkButton>
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
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Cancel</button>
                       
                </div>
            </div>
        </div>
    </div>
    <!--end::FailureModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
