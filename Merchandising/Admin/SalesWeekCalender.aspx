<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="SalesWeekCalender.aspx.cs" Inherits="Merchandising.Admin.SalesWeekCalender" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="ddlYear">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManagerProxy>
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head" style="padding-top: 20px">

                        <span class="kt-subheader__separator kt-hidden"></span>
                        <div class="kt-subheader__breadcrumbs">


                            <a href="SalesWeekCalender.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i> Sales Week Calender </a>
                            <%--<span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link">Reviewer/Approver Assignment </a>--%>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                    </div>
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Sales Week Calender
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions">
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../Media/excel.png" Height="50" ToolTip="Download"
                                OnClick="ImageButton4_Click" AlternateText="Xlsx" />

                        </div>
                    </div>

                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <div class="kt-portlet__body">
                            <div class="col-lg-12 row">
                                <div class="col-lg-4" style="padding-top: 8px;">
                                    <div class="col-lg-12">
                                        <label class="control-label col-lg-12 pl-0">Year </label>
                                    </div>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlYear" EmptyMessage="Select Year" runat="server" Filter="Contains" RenderMode="Lightweight" Width="100%" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="true">
                                            <Items>
                                                <telerik:RadComboBoxItem Text="All Years" Value="" />
                                                <telerik:RadComboBoxItem Text="Year 2021" Value="2021" />
                                                <telerik:RadComboBoxItem Text="Year 2022" Value="2022" />
                                                <telerik:RadComboBoxItem Text="Year 2023" Value="2023" />
                                                <telerik:RadComboBoxItem Text="Year 2024" Value="2024" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </telerik:RadAjaxPanel>
                        <div class="kt-portlet__body">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                            <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

                            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
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
                                    ShowFooter="false" DataKeyNames="slw_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="slw_WeekNumber" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Week Number" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="slw_WeekNumber">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="slw_Period" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Month" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="slw_Period">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="slw_WeekSeq" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Week Seq" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="slw_WeekSeq">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="slw_WeekStart" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Week Start" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="slw_WeekStart">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="slw_WeekEnd" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Week End" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="slw_WeekEnd">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="slw_Year" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Year" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="slw_Year">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <GroupingSettings CaseSensitive="false" />
                                <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                    <Resizing AllowColumnResize="true"></Resizing>
                                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>
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
        </div>
    </div>
</asp:Content>
