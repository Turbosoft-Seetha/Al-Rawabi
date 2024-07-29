<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="ItemNotAvailable.aspx.cs" Inherits="Merchandising.Admin.ItemNotAvailable" %>
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
                                <a href="AdminDashboard.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Dashboard </a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> Item Not Availabile </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Item Not Availabile
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions">
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../Media/excel.png" Height="50" ToolTip="Download"
                                OnClick="ImageButton4_Click" AlternateText="Xlsx" />

                        </div>
                    </div>

                    <!--begin::Form-->
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <div class="kt-form kt-form--label-right">
                            <div class="kt-portlet__body">
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
                                        ShowFooter="false" DataKeyNames="iad_itm_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="50px" UniqueName="Detail" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                                        ImageUrl="assets/media/icons/svg/General/Clipboard.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Desc" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Description" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Desc">
                                            </telerik:GridBoundColumn>

                                            <%--<telerik:GridBoundColumn DataField="cat_Code" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cat_Code">
                                            </telerik:GridBoundColumn>--%>

                                            <telerik:GridBoundColumn DataField="cat_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cat_Name">
                                            </telerik:GridBoundColumn>

                                            <%--<telerik:GridBoundColumn DataField="sct_Code" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Subcategory Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="sct_Code">
                                            </telerik:GridBoundColumn>--%>

                                            <telerik:GridBoundColumn DataField="sct_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Subcategory Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="sct_Name">
                                            </telerik:GridBoundColumn>

                                            <%--<telerik:GridBoundColumn DataField="iad_Availability" AllowFiltering="true" HeaderStyle-Width="90px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Availability" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="iad_Availability">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rsn_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Reason" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rsn_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="iad_Remarks" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Remark" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="iad_Remarks">
                                            </telerik:GridBoundColumn>--%>

                                            <telerik:GridBoundColumn DataField="dph_Date" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dph_Date">
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
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
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
