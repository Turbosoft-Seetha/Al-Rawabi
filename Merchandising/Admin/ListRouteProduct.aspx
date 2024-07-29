<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="ListRouteProduct.aspx.cs" Inherits="Merchandising.Admin.ListRouteProduct" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script>
        function Confirm() {
            $('#modalConfim').modal('show');
        }
        function Succcess(a) {
            $('#modalConfirm').modal('hide');
            $('#modalSuccess').modal('show');

            $('#success').text(a);
        }
        function Failure() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_5').modal('show');
        }
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function successModal() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head" style="padding-top: 20px">

                        <span class="kt-subheader__separator kt-hidden"></span>
                        <div class="kt-subheader__breadcrumbs">


                            <a href="ListRoute.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i>Route </a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <%--<a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>--%>
                            <%--<span class="kt-subheader__breadcrumbs-separator">></span>--%>
                            <a class="kt-subheader__breadcrumbs-link">Products Route </a>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                    </div>
                    <div class="kt-portlet__head" style="padding-top: 8px; padding-bottom: 8px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Route Product
                            </h3>
                            <telerik:RadLabel ID="Proroute" runat="server" CssClass="kt-portlet__head-title"></telerik:RadLabel>
                        </div>

                    </div>
                    <div class="kt-portlet__head" style="padding-top: 8px; padding-bottom: 8px;">
                        <%--<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">--%>
                        <div class="kt-portlet__head-label">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel5" runat="server" LoadingPanelID="RadAjaxLoadingPanel4">
                                <div class="col-lg-12 form-group">
                                    <label class="control-label col-lg-6">Product <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                            ID="ddlItems" runat="server" Width="150%">
                                        </telerik:RadComboBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ControlToValidate="ddlItems" ErrorMessage="Please Select Product" ForeColor="Red" Display="Dynamic" ValidationGroup="form"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    </div>
                                </div>
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                        </div>
                        <div class="kt-portlet__head-actions">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                                <div class="col-lg-12 row" style="padding-top: 10px;">
                                    <div class="col-lg-6">
                                        <asp:LinkButton ID="LinkButton1Save" Width="100px" runat="server" ValidationGroup="form" OnClick="LinkButton1Save_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Save'
                                            CssClass="btn btn-brand btn-elevate btn-icon-sm" CausesValidation="true" />
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:LinkButton ID="LinkButton2Delete" Width="100px" runat="server"
                                            Text="Delete" CssClass="btn btn-brand btn-elevate btn-icon-sm"
                                            CausesValidation="False" OnClick="LinkButton2Delete_Click" />
                                    </div>
                                </div>
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                        </div>
                        <%--</telerik:RadAjaxPanel>--%>
                    </div>



                    <!--begin::Form-->
                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <div class="kt-form kt-form--label-right">
                            <div class="kt-portlet__body">

                                <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>


                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    OnItemCommand="grvRpt_ItemCommand"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="rop_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridClientSelectColumn HeaderStyle-Width="40px" UniqueName="chkAll">
                                            </telerik:GridClientSelectColumn>

                                            <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                            </telerik:GridBoundColumn>

                                            
                                            <telerik:GridBoundColumn DataField="cat_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cat_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="sct_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Sub Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="sct_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
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
                        </div>
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
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfim" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel4" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-brand btn-elevate btn-icon-sm" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel5" EnableEmbeddedSkins="false"
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
    <div class="modal fade" id="modalSuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="success"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="LinkButton1Ok" runat="server" OnClick="LinkButton1Ok_Click" CssClass="btn btn-secondary">OK</asp:LinkButton>
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
    <%--delete--%>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to delete..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Yes" OnClick="lnkDelete_Click" CssClass="btn btn-brand btn-elevate btn-icon-sm" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="reset" data-dismiss="modal" class="btn btn-secondary">Cancel</button>
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
                    <span>Data Deleted Successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="OKdelete" runat="server" OnClick="OKdelete_Click" CssClass="btn btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->
</asp:Content>
