<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="CustomerWeekRoute.aspx.cs" Inherits="Merchandising.Admin.CustomerWeekRoute" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <telerik:RadAjaxPanel ID="pnl" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
            <div class="row">
                <div class="col-lg-12">
                    <div class="kt-portlet">
                        <div class="kt-portlet__head">
                            <div class="kt-portlet__head-label">
                                <span class="kt-subheader__separator kt-hidden"></span>
                                <div class="kt-subheader__breadcrumbs">
                                    <a href="ListRoute.aspx" class="kt-subheader__breadcrumbs">
                                        <i class="flaticon2-shelter"></i> Routes </a>
                                    <%--<span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>--%>
                                    <span class="kt-subheader__breadcrumbs-separator">></span>
                                    <a class="kt-subheader__breadcrumbs-link"> Route Customers - Weekly Plan </a>
                                </div>
                            </div>
                        </div>
                        <div class="kt-portlet__head">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">Route Customers - Weekly Plan
                                </h3>
                            </div>
                            <div class="kt-portlet__head-actions" style="padding-top: 20px;">
                                <h5 class="kt-portlet__head-title">
                                    <asp:Literal ID="ltrlRoute" runat="server"></asp:Literal>
                                </h5>
                            </div>
                        </div>
                        <div class="kt-portlet__head">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">Assigned Customers
                                </h3>
                            </div>

                        </div>

                        <!--begin::Form-->
                        <div class="kt-form kt-form--label-right">

                            <div class="kt-portlet__body">
                                <div class="col-lg-12 row">
                                    <div class="col-lg-4" style="padding-top: 8px;">
                                        <div class="col-lg-12">
                                            <label class="control-label col-lg-12 pl-0">Customer </label>
                                        </div>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlCustomer" runat="server" Filter="Contains" RenderMode="Lightweight" EmptyMessage="Select Customer" Width="100%" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4" style="padding-top: 8px;">
                                        <div class="col-lg-12">
                                            <label class="control-label col-lg-12 pl-0">Week </label>
                                        </div>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlWeek" EmptyMessage="Select Week" runat="server" Filter="Contains" RenderMode="Lightweight" Width="100%">
                                                <Items>
                                                    <telerik:RadComboBoxItem Text="All Weeks" Value="" />
                                                    <telerik:RadComboBoxItem Text="Week 1" Value="1" />
                                                    <telerik:RadComboBoxItem Text="Week 2" Value="2" />
                                                    <telerik:RadComboBoxItem Text="Week 3" Value="3" />
                                                    <telerik:RadComboBoxItem Text="Week 4" Value="4" />
                                                </Items>
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 " style="margin-top: 20px">
                                        <asp:LinkButton ID="BtnSearch" runat="server" OnClick="btnSearch_Click" CssClass="btn btn-brand btn-elevate btn-icon-sm">Apply Filter</asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="kt-portlet__body">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
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
                                        ShowFooter="false" DataKeyNames="cwr_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="30px" AllowFiltering="false" HeaderText="Add" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Edits" ID="RadImageButton1" ClientIDMode="AutoID" Visible="true" AlternateText="Edit" runat="server"
                                                        ImageUrl="assets/media/icons/svg/Design/pencil.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="WeekNum" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Week Number" FilterControlWidth="100%"
                                                CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="WeekNum">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Sat" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Saturday" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Saturday">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Sun" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Sunday" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Sunday">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Mon" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Monday" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Monday">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Tue" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Tuesday" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Tuesday">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Wed" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Wednsday" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Wednsday">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Thu" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Thursday" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Thursday">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Fri" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Friday" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Friday">
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
                    </div>
                </div>

            </div>
        </telerik:RadAjaxPanel>
        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
            BackColor="Transparent"
            ForeColor="Blue">
            <div class="col-lg-12 text-center">
                <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
            </div>
        </telerik:RadAjaxLoadingPanel>
    </div>


</asp:Content>
