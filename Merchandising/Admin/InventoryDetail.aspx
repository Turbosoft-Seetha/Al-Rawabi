<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="InventoryDetail.aspx.cs" Inherits="Merchandising.Admin.InventoryDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script type="text/javascript">
     function redirect() {
            var url = new URL(window.location.href);
            var c = url.searchParams.get("IId");
            window.location.href = "InventoryItem.aspx?Id=" + c;
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


                                <a href="Inventory.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Customer Inventory</a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Customer Inventory Item</a>
                                 <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> Customer Inventory Detail </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Customer Inventory Detail
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions">
                            <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../Media/excel.png" Height="50" ToolTip="Download" OnClick="imgExcel_Click" AlternateText="Xlsx" ImageAlign="Right" />
                        </div>
                    </div>

                    <div class="kt-portlet__body">
                        <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server">
                            <Items>
                                <telerik:RadPanelItem Font-Bold="true" Expanded="false" BackColor="#F2F6F9">
                                    <ContentTemplate>
                                        <div class="kt-portlet__body" style="background-color: #F9FAFC; display: grid;">
                                            <table>
                                                <td style="width: 56%">
                                                    
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Route:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblRoute" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Customer:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblCustomer" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                     <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Product:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblProduct" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">UOM:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblUom" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                      <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Location:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblLocation" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                   
                                                </td>
                                                <td style="width: 56%">
                                                     <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Total Quantity:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblTQty" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Visit Start:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblVisitStart" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Visit End:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblVisitEnd" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Trans Time:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblTransTime" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                     <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Remarks:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblRemarks" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                </td>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelBar>
                    </div>

                    <!--begin::Form-->
                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <div class="kt-form kt-form--label-right">
                            <div class="kt-portlet__body">

                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="ihd_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                         

                                            <telerik:GridBoundColumn DataField="ihd_BatchCode" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Batch Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ihd_BatchCode">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ihd_ExpiryDate" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Expiry Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ihd_ExpiryDate">
                                            </telerik:GridBoundColumn>

                                         

                                            <telerik:GridBoundColumn DataField="ihd_Qty" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Quantity" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ihd_Qty">
                                            </telerik:GridBoundColumn>

                                           
                                        </Columns>
                                    </MasterTableView>
                                    <PagerStyle AlwaysVisible="true" />
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
</asp:Content>
