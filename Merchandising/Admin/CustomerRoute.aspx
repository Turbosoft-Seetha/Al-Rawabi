<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="CustomerRoute.aspx.cs" Inherits="Merchandising.Admin.CustomerRoute" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script>
        function ConfimAdd() {
            $('#kt_modal_1_3').modal('show');
        }
        function ConfimRemove() {
            $('#kt_modal_1_4').modal('show');
        }
        function failedModal() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_4').modal('hide');
            $('#kt_modal_1_5').modal('show');
        }
        function SuccessModal() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_4').modal('hide');
            $('#kt_modal_1_6').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="lnkAdds">
        <UpdatedControls>
        <telerik:AjaxUpdatedControl ControlID="grvRpt" />
        <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
        </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="lnkRemoves">
        <UpdatedControls>
        <telerik:AjaxUpdatedControl ControlID="grvRpt" />
        <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
        </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
    </telerik:RadAjaxManagerProxy>
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
                <div class="col-lg-12">
                    <div class="kt-portlet">
                        <div class="kt-portlet__head" style="padding-top: 20px">

                            <span class="kt-subheader__separator kt-hidden"></span>
                            <div class="kt-subheader__breadcrumbs">


                                <a href="ListRoute.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Routes </a>
                                <%--<span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>--%>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> Route Customers </a>

                                <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                            </div>
                        </div>
                        <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">
                                    
                                    Route Customers
                                </h3>
                            </div>
                            <div class="kt-portlet__head-actions">
                                <h5 class="kt-portlet__head-title">
                            <asp:Literal ID="ltrlRoute" runat="server"></asp:Literal>
                                </h5>
                            </div>
                        </div>
                        <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                            <div class="col-lg-12 row">
                                <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                    <label class="control-label col-lg-12">Parent Company <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlCust" runat="server" Filter="Contains" AutoPostBack="true" OnSelectedIndexChanged="ddlCust_SelectedIndexChanged" Width="100%" RenderMode="Lightweight" EmptyMessage="Select Parent Company"></telerik:RadComboBox>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-6">

                    <!--begin::Portlet-->
                    <div class="kt-portlet">

                        <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">Un Assigned Customers
                                </h3>
                            </div>
                            <div class="kt-portlet__head-actions">
                                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                    <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" Text="Add" OnClientClick="ConfimAdd()" style="background-color: green;border-color: green;"></asp:LinkButton>
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

                        <!--begin::Form-->
                        <div class="kt-form kt-form--label-right">
                            <div class="kt-portlet__body">
                                <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadAjaxPanel ID="RadAjaxPanel4" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
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
                                        ShowFooter="false" DataKeyNames="cus_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>
                                            <telerik:GridClientSelectColumn UniqueName="GridCheckBoxColumn"   HeaderStyle-Width="30px">
                                            </telerik:GridClientSelectColumn>

                                            <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="csh_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Parent Company" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="csh_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Add" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" Visible="false">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Add" ID="RadImageButton1" ClientIDMode="AutoID" Visible="true" AlternateText="Add" runat="server"
                                                        ImageUrl="assets/media/icons/svg/Files/File-plus.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                        <Resizing AllowColumnResize="true"></Resizing>
                                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                    </ClientSettings>
                                </telerik:RadGrid>
                                </telerik:RadAjaxPanel>

                                <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                    <div class="col-lg-12 text-center">
                                        <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                                    </div>
                                </telerik:RadAjaxLoadingPanel>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-6">

                    <!--begin::Portlet-->
                    <div class="kt-portlet">

                        <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">Assigned Customers
                                </h3>
                            </div>
                            <div class="kt-portlet__head-actions">
                                <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" Text="Remove" OnClientClick="ConfimRemove()" style="background-color: red;border-color: red;"></asp:LinkButton>
                                </telerik:RadAjaxPanel>

                                <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel5" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                    <div class="col-lg-12 text-center">
                                        <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                                    </div>
                                </telerik:RadAjaxLoadingPanel>
                            </div>
                        </div>

                        <!--begin::Form-->
                        <div class="kt-form kt-form--label-right">
                            <div class="kt-portlet__body">

                                <telerik:RadAjaxPanel ID="RadAjaxPanel5" runat="server" LoadingPanelID="RadAjaxLoadingPanel6">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                    ID="RadGrid1" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="RadGrid1_NeedDataSource"
                                    OnItemCommand="RadGrid1_ItemCommand"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="rcs_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>
                                            <telerik:GridClientSelectColumn UniqueName="GridCheckBoxColumn"   HeaderStyle-Width="30px">
                                            </telerik:GridClientSelectColumn>

                                            <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="csh_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Parent Company" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="csh_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Remove" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" Visible="false">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Remove" ID="RadImageButton2" Visible="true" AlternateText="Remove" runat="server"
                                                        ImageUrl="assets/media/icons/svg/Files/File-minus.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                        <Resizing AllowColumnResize="true"></Resizing>
                                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                    </ClientSettings>
                                </telerik:RadGrid>
                                </telerik:RadAjaxPanel>

                                <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel6" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                    <div class="col-lg-12 text-center">
                                        <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                                    </div>
                                </telerik:RadAjaxLoadingPanel>
                            </div>
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
                    <h5 class="modal-title">Are you sure you want to add selected customer ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                        <asp:LinkButton ID="lnkAdds" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" OnClick="lnkAdds_Click">
                                                    Add
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
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

    <!--begin::ValidationModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to remove selected customer ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel4">
                        <asp:LinkButton ID="lnkRemoves" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" OnClick="lnkRemoves_Click">
                                                    Remove
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
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

    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">No selection found..!</h5>
                </div>
                <div class="modal-body">
                    <p>Please make selection and try again.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->

    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_6" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Request has been successfully completed.</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

</asp:Content>
