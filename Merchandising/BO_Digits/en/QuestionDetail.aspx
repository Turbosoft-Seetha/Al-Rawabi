﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="QuestionDetail.aspx.cs" Inherits="Merchandising.BO_Digits.en.QuestionDetail" %>
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
        function Delete() {
            $('#kt_modal_1_7').modal('show');
        }
        function deleteSucces() {
            $('#kt_modal_1_7').modal('hide');
            $('#kt_modal_1_8').modal('show');
        }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
      <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="btnCancel" Width="100px" runat="server"
                                    Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
                                    CausesValidation="False"  OnClick="btnCancel_Click" />
                                <asp:LinkButton ID="lnkAdd" Width="100px"
                               runat="server" ValidationGroup="form" OnClick="lnkAdd_Click" UseSubmitBehavior="false" 
                                    Text='<i class="icon-ok"></i>Proceed' CssClass="btn btn-sm fw-bold btn-primary"  CausesValidation="true"/>
                               
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel5" EnableEmbeddedSkins="false"
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
                    
                   
                            <h3 class="kt-portlet__head-title">Assets Name:
                                <telerik:RadLabel runat="server" ID="labelqno" Text=""></telerik:RadLabel>
                            </h3>
                      
                    <!--begin::Forkt-->

                    <div class="kt-portlet__body" style="padding-bottom:0px;">
                        <div class="col-lg-12 row">
                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Questions <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <!-- rad combo box is not a text box its a drop down - athu veruthe angane name koduthatha..kuzhapavuo angane koduthal?- ivide name kodukuna polle alla, c# il villiachath text area ude polle aanu,, ath kuzaoppam avum-->
                                    <telerik:RadComboBox ID="ddlQtns" runat="server" Width="100%" EmptyMessage="Select Question" RenderMode="Lightweight"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="frm"
                                        ControlToValidate="ddlQtns" ErrorMessage="Please choose Question" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Order <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtorder" runat="server" NumberFormat-AllowRounding="false" DecimalDigits="0" 
                                        NumberFormat-GroupSeparator="" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadNumericTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="frm"
                                        ControlToValidate="txtorder" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Is Mandatory <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlMandat" runat="server" Width="100%" RenderMode="Lightweight" Visible="true" ValidationGroup="frm">
                                        <Items>
                                            <telerik:RadComboBoxItem Text="Yes" Value="Y" Selected="true" />
                                            <telerik:RadComboBoxItem Text="No" Value="N" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </div>
                            </div>
                        </div>
                    </div>
                     <asp:PlaceHolder ID="pnls" runat="server" Visible="true">
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Details
                            </h3>
                        </div>
                    </div>

                   
                        <div class="kt-portlet__body">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel4">
                                <div class="col-lg-12 row">

                                    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                    <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                        ID="grvRpt" GridLines="None"
                                        ShowFooter="True" AllowSorting="True"
                                        OnNeedDataSource="grvRpt_NeedDataSource"
                                        OnItemCommand="grvRpt_ItemCommand"
                                        AllowFilteringByColumn="true"
                                        ClientSettings-Resizing-ClipCellContentOnResize="true"
                                        EnableAjaxSkinRendering="true"
                                        AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                        <ClientSettings>
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                        </ClientSettings>
                                        <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                            ShowFooter="false" DataKeyNames="clq_ID"
                                            EnableHeaderContextMenu="true">
                                            <Columns>
                                                 <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Delete" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                    <ItemTemplate>
                                                        <asp:ImageButton CommandName="Delete" ID="RadImageButton3" Visible="true" AlternateText="Delete" runat="server"
                                                            ImageUrl="../assets/media/svg/general/Trash.svg"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridBoundColumn DataField="surQuestion" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Question" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="cqm_Question">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Mandat" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Is Mandatory" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="clq_IsMandatory">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Orders" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Order" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="clq_Order">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="user" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Order" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="user" Visible="false">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="ResponseID" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Order" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="ResponseID" Visible="false">
                                                </telerik:GridBoundColumn>

                                               
                                            </Columns>
                                        </MasterTableView>
                                        <GroupingSettings CaseSensitive="false" />
                                        <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                            <Resizing AllowColumnResize="true"></Resizing>
                                            <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                        </ClientSettings>
                                    </telerik:RadGrid>

                                </div>
                                <!--End Detail Body-->
                                <!--Delete Anser-->


                                <!--end::Portlet-->
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                        </div>
                    </asp:PlaceHolder>

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
                        <asp:LinkButton ID="lnkSave" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="lnkSave_Click">
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
                    <span>Question has been assigned successfully.</span>
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
    <!--begin::ValidationModal-->
    <div class="modal fade" id="kt_modal_1_7" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to delete ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="LinkButton2_Click">
                                                    Yes
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                      <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_7);">Cancel</button>

                </div>
            </div>
        </div>
    </div>
    <!--end::ValidationModal-->

    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_8" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Survey question has been deleted successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" CssClass="btn btn-sm fw-bold btn-secondary">Ok</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>