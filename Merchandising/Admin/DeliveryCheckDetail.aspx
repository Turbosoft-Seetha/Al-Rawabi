<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="DeliveryCheckDetail.aspx.cs" Inherits="Merchandising.Admin.DeliveryCheckDetail" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
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


                                <a href="DeliveryCheck.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Delivery Check </a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> Delivery Check Detail </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Delivery Check Detail
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
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Transaction No:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblTransaction" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
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
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">User:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblUser" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                </td>
                                                <td style="width: 56%">
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Date:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Delivered By:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblDelivered" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Status:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblStatus" Font-Bold="true" runat="server"></asp:Label></label>
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
                                        ShowFooter="false" DataKeyNames="dcd_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="dcd_HUOM" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Higher UOM" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dcd_HUOM">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="dcd_LUOM" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Lower UOM" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dcd_LUOM">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="dcd_CheckedHUOM" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Checked Higher UOM" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dcd_CheckedHUOM">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="dcd_CheckedLUOM" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Checked Lower UOM" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dcd_CheckedLUOM">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="dcd_HQty" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Higher Qty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dcd_HQty">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="dcd_LQty" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Lower Qty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dcd_LQty">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="dcd_CheckedHQty" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Checked Higher Qty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dcd_CheckedHQty">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="dcd_CheckedLQty" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Checked Lower Qty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dcd_CheckedLQty">
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
