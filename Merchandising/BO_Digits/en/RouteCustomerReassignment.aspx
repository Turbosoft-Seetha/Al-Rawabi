<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="RouteCustomerReassignment.aspx.cs" Inherits="Merchandising.BO_Digits.en.RouteCustomerReassignment" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
        <asp:LinkButton ID="LinkButton2" Width="100px" runat="server"
            Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
            CausesValidation="False" OnClick="LinkButton2_Click" />
        <asp:LinkButton ID="LinkButton1" Width="100px" runat="server" ValidationGroup="form" OnClick="LinkButton1_Click" UseSubmitBehavior="false" Text='Proceed'
            CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" />

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
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet" style="background-color: white; padding: 20px;">
                                        <div class="kt-portlet__body">
                         <div class="card-body" style="background-color:white; padding-bottom:10px;">
                        <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="98%" ID="RadPanelBar0" runat="server">
                            <Items>
                                <telerik:RadPanelItem Font-Bold="true" Text="Note:" Expanded="false" ForeColor="Blue" BackColor="white">
                                    <ContentTemplate>
                                        <div class="kt-portlet__body" style="background-color: white; display: grid;padding:15px;">
                                            <table>
                                                <td style="width: 100%">
                                                   
										<div class="fs-6 text-dark-400 fw-bold pe-7">When you reassign certain customers from the "From Route" to the "To Route", several things will happen: </div>
										<div class="fs-6 text-gray-700 pe-7">1. The selected customers in the 'From Route' will be marked as inactive and their settings in 'From Route' will be saved under the 'To Route'.
										</div>
										<div class="fs-6 text-gray-700 pe-7">2. An entry containing the selected customers and their new route (i.e. 'To Route') will be added to the 'Customer Week Route'.</div>
										<div class="fs-6 text-gray-700 pe-7">3. If there was a customer item mapping in the 'From Route', a new entry will be created in the 'Customer Item Mapping' with the same values as before, 
                                            except for the route, which will be changed to the 'To Route'.
										</div>
                                                </td>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelBar>
                             </div>
                    </div>

                    <div class="kt-portlet__body">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                           <div class="col-lg-12 row">
                            
                            <div class="col-lg-4 form-group">
                            <label class="control-label col-lg-12">From Route <span class="required"></span></label>
                            <div class="col-lg-12">
                            <telerik:RadComboBox ID="ddlfromroute" runat="server" EmptyMessage="Select From Route" CausesValidation="false"  Width="100%" Filter="Contains" AutoPostBack="true" OnSelectedIndexChanged="ddlfromroute_SelectedIndexChanged"></telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                ControlToValidate="ddlfromroute" ErrorMessage="Please Select Route" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            </div>
                            </div>

                            <div class="col-lg-4 form-group">
                            <label class="control-label col-lg-12">To Route <span class="required"> </span></label>
                            <div class="col-lg-12">
                            <telerik:RadComboBox ID="ddltoroute" runat="server" EmptyMessage="Select To Route" CausesValidation="false" OnSelectedIndexChanged="ddltoroute_SelectedIndexChanged" AutoPostBack="true"  Width="100%" Filter="Contains" ></telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ValidationGroup="form"
                                ControlToValidate="ddltoroute" ErrorMessage="Please Select Route" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            </div>
                            </div>
                                                                                        <div class="col-lg-4 form-group">
                                        <label class="control-label col-lg-12">Customer <span class="required"></span></label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlcus" runat="server" Width="100%" EmptyMessage="Select Customer"  Filter="Contains"  CheckBoxes="true" EnableCheckAllItemsCheckBox="true"  AllowCustomText="true"  CausesValidation="false"></telerik:RadComboBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="form"
                                            ControlToValidate="ddlcus" ErrorMessage="Please Select Customer" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                        </div>
                                    </div>

</div>
                          
                        </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
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
    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" style="height: auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-sm fw-bold btn-primary"></asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(modalConfirm);">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="Success"></span>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel4">
                        <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
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
    <div class="modal fade" id="FailureAlert" tabindex="-1" role="dialog" style="height: auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Failure</h5>
                </div>
                <div class="modal-body">
                    <span style="color: red"><strong></strong>&nbsp;&nbsp; <span id="failres"></span></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(FailureAlert);">Dismiss</button>
                </div>
            </div>
        </div>
    </div>

    <!--end::SuccessModal-->

    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span id="fail"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
