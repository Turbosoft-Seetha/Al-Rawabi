<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="RouteTypes.aspx.cs" Inherits="Merchandising.BO_Digits.en.RouteTypes" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="lnkMerchRoute">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="lnkMerchandising">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                </UpdatedControls>
            </telerik:AjaxSetting>

        </AjaxSettings>
    </telerik:RadAjaxManagerProxy>

    <div class="col-lg-12">
        <div class="kt-portlet">
            <div class="kt-portlet__head" style="padding: 0px; border-bottom: 0px;">
                <div class="kt-portlet__head-label row" style="padding-bottom: 20px;">

                    <div class="col-lg-12 row">

                        <div class="col-lg-3">
                            <label class="control-label col-lg-12">Date</label>
                            <div class="col-lg-12">
                                <telerik:RadDatePicker RenderMode="Lightweight" ID="rdfromDate" runat="server" DateInput-DateFormat="dd-MMM-yyyy" Width="100%">
                                </telerik:RadDatePicker>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdfromDate"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col-lg-2" style="text-align: center; padding-top: 10px; padding-left: 10px; top: 19px;">
                            <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" OnClick="lnkFilter_Click" AutoPostBack="true">
                                                    Apply Filter
                            </asp:LinkButton>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="card-body" style="background-color: white; padding: 20px;">
        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

                    <div class="col-lg-12">
                        <!--begin::Portlet-->
                        <div class="kt-portlet">
                            <div class="col-xl-12">
                                <div class="card" style="background-color: #f1faff;">
                                    <asp:LinkButton ID="lnkMerchRoute" runat="server" OnClick="lnkMerchRoute_Click">
                                        <div class="card-body" style="padding: 0px; padding-left: 20px;">
                                            <div class="py-2">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-4">
                                                        <!--begin::Item-->
                                                        <div class="col">
                                                            <div class="border border-dashed border-gray-500 text-center min-w-125px rounded pt-4 pb-2 my-3">
                                                                <span class="fs-2 fw-bold text-gray-900">
                                                                    <asp:Label ID="lblMerchRoute" runat="server">0</asp:Label>
                                                                </span>
                                                                <span class="fs-6 fw-semibold d-block">Merchandising Route</span>
                                                            </div>
                                                        </div>
                                                        <!--end::Item-->
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <!--begin::Item-->
                                                        <div class="col">
                                                            <div class="border border-dashed border-gray-500 text-center min-w-125px rounded pt-4 pb-2 my-3">
                                                                <span class="fs-2 fw-bold text-gray-900">
                                                                    <asp:Label ID="lblMerchStart" runat="server">0</asp:Label>
                                                                </span>
                                                                <span class="fs-6 fw-semibold d-block">Start Day</span>
                                                            </div>
                                                        </div>
                                                        <!--end::Item-->
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <!--begin::Item-->
                                                        <div class="col">
                                                            <div class="border border-dashed border-gray-500 text-center min-w-125px rounded pt-4 pb-2 my-3">
                                                                <span class="fs-2 fw-bold text-gray-900">
                                                                    <asp:Label ID="lblMerchEnd" runat="server">0</asp:Label>
                                                                </span>
                                                                <span class="fs-6 fw-semibold d-block">End Day</span>
                                                            </div>
                                                        </div>
                                                        <!--end::Item-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 pt-2">
                        <!--begin::Portlet-->
                        <div class="kt-portlet">
                            <div class="col-xl-12">
                                <div class="card" style="background-color: #f1f3ff;">
                                    <asp:LinkButton ID="lnkOrderRoutes" runat="server" OnClick="lnkOrderRoutes_Click">
                                        <div class="card-body" style="padding: 0px; padding-left: 20px;">
                                            <div class="py-2">
                                                <div class="col-lg-12 row">
                                                    <div class="col-lg-4">
                                                        <!--begin::Item-->
                                                        <div class="col">
                                                            <div class="border border-dashed border-gray-500 text-center min-w-125px rounded pt-4 pb-2 my-3">
                                                                <span class="fs-2 fw-bold text-gray-900">
                                                                    <asp:Label ID="lblOrderRoutes" runat="server">0</asp:Label>
                                                                </span>
                                                                <span class="fs-6 fw-semibold d-block">Order Routes</span>
                                                            </div>
                                                        </div>
                                                        <!--end::Item-->
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <!--begin::Item-->
                                                        <div class="col">
                                                            <div class="border border-dashed border-gray-500 text-center min-w-125px rounded pt-4 pb-2 my-3">
                                                                <span class="fs-2 fw-bold text-gray-900">
                                                                    <asp:Label ID="lblOrderStart" runat="server">0</asp:Label>
                                                                </span>
                                                                <span class="fs-6 fw-semibold d-block">Start Day</span>
                                                            </div>
                                                        </div>
                                                        <!--end::Item-->
                                                    </div>
                                                    <%--<div class="col-lg-3">
                                                        <!--begin::Item-->
                                                        <div class="col">
                                                            <div class="border border-dashed border-gray-500 text-center min-w-125px rounded pt-4 pb-2 my-3">
                                                                <span class="fs-2 fw-bold text-gray-900" data-kt-countup="true" data-kt-countup-value="36899">
                                                                    <asp:Label ID="lblOrderSettle" runat="server">36899</asp:Label>
                                                                </span>
                                                                <span class="fs-6 fw-semibold d-block">Settlement</span>
                                                            </div>
                                                        </div>
                                                        <!--end::Item-->
                                                    </div>--%>
                                                    <div class="col-lg-4">
                                                        <!--begin::Item-->
                                                        <div class="col">
                                                            <div class="border border-dashed border-gray-500 text-center min-w-125px rounded pt-4 pb-2 my-3">
                                                                <span class="fs-2 fw-bold text-gray-900">
                                                                    <asp:Label ID="lblOrderEnd" runat="server">0</asp:Label>
                                                                </span>
                                                                <span class="fs-6 fw-semibold d-block">End Day</span>
                                                            </div>
                                                        </div>
                                                        <!--end::Item-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>
                                </div>
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
                <div class="col-lg-12" style="padding-top: 10px;">
                    <div class="kt-portlet">
                        <div class="col-xl-12">
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
                                    <div class="mt-5 mb-5">
                                        <h7 style="font-size: medium; color: grey">Delivery Routes</h7>
                                    </div>
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
                                            ShowFooter="false" DataKeyNames="dph_ID"
                                            EnableHeaderContextMenu="true">
                                            <Columns>

                                                <telerik:GridTemplateColumn HeaderStyle-Width="40px" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                    <ItemTemplate>
                                                        <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                                            ImageUrl="../assets/media/icons/details.png"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Route Name" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="startTime" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Start Day" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="startTime">
                                                </telerik:GridBoundColumn>

                                                <%--<telerik:GridBoundColumn DataField="settlementTime" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Settlement" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="settlementTime">
                                                </telerik:GridBoundColumn>--%>

                                                <telerik:GridBoundColumn DataField="endTime" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="End Day" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="endTime">
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


            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
