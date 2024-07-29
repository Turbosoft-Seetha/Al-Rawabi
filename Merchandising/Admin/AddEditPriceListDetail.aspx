﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="AddEditPriceListDetail.aspx.cs" Inherits="Merchandising.Admin.AddEditPriceListDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
         function Confim() {
             $('#modalConfirm').modal('show');
         }
        function Succcess(a) {
             $('#modalConfirm').modal('hide');
             $('#kt_modal_1_4').modal('show');
             $('#success').text(a);
         }
         function Failure() {
             $('#modalConfirm').modal('hide');
             $('#kt_modal_1_5').modal('show');
        }
        function redirect() {
            var url = new URL(window.location.href);
            var c = url.searchParams.get("hid");
            window.location.href = "ListPriceListDetail.aspx?ID=" + c;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <br />
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head" style="padding-top: 20px">

                        <span class="kt-subheader__separator kt-hidden"></span>
                        <div class="kt-subheader__breadcrumbs">


                            <a href="ListPriceListHeader.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i> Special Price</a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                             <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Special Price Detail </a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link">Add Edit Special Price Items</a>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                    </div>
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Special Price Items
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions">
                            <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="Button1Save" Width="100px" runat="server" ValidationGroup="form" OnClick="Button1Save_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Save'
                                    CssClass="btn btn-brand btn-elevate btn-icon-sm"  CausesValidation="true"/>
                                <asp:LinkButton ID="Button2Cancel" Width="100px" runat="server"
                                    Text="Cancel" CssClass="btn btn-brand btn-elevate btn-icon-sm"
                                    CausesValidation="False" OnClick="Button2Cancel_Click" />
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                        </div>
                    </div>

                    <div class="kt-portlet__body">

                        <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

                        <div class="col-lg-12 row">
                           
                           
                             <div class="col-lg-4 form-group" >
                                <label class="control-label col-lg-12">Product Name <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlp" runat="server" EmptyMessage="Select Product Name" OnSelectedIndexChanged="ddlp_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false" Width="81%" Filter="Contains"></telerik:RadComboBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="ddlp" ErrorMessage="Please select Product Name" ForeColor="Red" Display="Dynamic" ValidationGroup="form"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                              <div class="col-lg-4 form-group" >
                                <label class="control-label col-lg-12" style="padding-left:2rem;">UOM <span class="required">* </span></label>
                                <div class="col-lg-12">
                                     <telerik:RadComboBox ID="ddlUom" runat="server" Width="100%" EmptyMessage="Select Uom" RenderMode="Lightweight"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="frm"
                                        ControlToValidate="ddlUom" ErrorMessage="Please choose Uom" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="false"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                              <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-12">Price <span class="required">*</span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtprice" runat="server" CssClass="form-control" Width="85%"></telerik:RadNumericTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="txtprice" ErrorMessage="Please Enter   price" ForeColor="Red" Display="Dynamic" ValidationGroup="form"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>



                          
                                <div class="col-lg-4 form-group" ">
                                <label class="control-label col-lg-12">VATPerc <span class="required">*</span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtvat" runat="server" CssClass="form-control" Width="81%"></telerik:RadNumericTextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                        ControlToValidate="txtvat" ErrorMessage="Please Enter VAT Percentage" ForeColor="Red" Display="Dynamic" ValidationGroup="form"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>
                                   <div class="col-lg-4 form-group"style=" padding-left:11px;">
                                    <label class="control-label col-lg-12">Status <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlstatus" runat="server" Width="85%">
                                        <items>
                                            <telerik:DropDownListItem Text="Active" Value="Y" Selected="true" />
                                            <telerik:DropDownListItem Text="Inactive" Value="N" />
                                        </items>
                                    </telerik:RadDropDownList>
                                    </div>
                                       </div>

                           
                            <div class="col-lg-12 row">

                             
                                 
                                 

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
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                    <asp:LinkButton ID="Confrmsave" runat="server" Text="Yes" OnClick="Confrmsave_Click" CssClass="btn btn-brand btn-elevate btn-icon-sm" />
                        </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
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
                    <span id="success"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-secondary">OK</asp:LinkButton>
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
                    <span>Something went wrong, please try again later.</span>
                </div>
                <div class="modal-footer">
                    <button type="reset" data-dismiss="modal" class="btn btn-secondary">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
