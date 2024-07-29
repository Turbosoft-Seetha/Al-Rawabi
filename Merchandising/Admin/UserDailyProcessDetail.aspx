<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="UserDailyProcessDetail.aspx.cs" Inherits="Merchandising.Admin.UserDailyProcessDetail" %>

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
                                <a href="Reports.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> User Daily Process Report </a>

                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> User Daily Process Detail </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">User Daily Process Detail
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions" style="padding-top: 10px;">
                            <div class="row">
                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../Media/excel.png" Height="50" ToolTip="Download" OnClick="ImageButton4_Click" AlternateText="Xlsx" Visible="false" />
                                <asp:LinkButton ID="lnkCancel" runat="server" CssClass="btn" BackColor="#E2E5EE" OnClick="lnkCancel_Click">Cancel</asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body pb-0">

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
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">App User:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblUser" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">App Version:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblVersion" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>

                                                    </td>
                                                    <td>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Start Time:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblStartTime" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">End Time:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblEndTime" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                    </td>

                                                </table>
                                            </div>
                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>

                            <div class="col-lg-12 row" style="padding-bottom: 30px;">

                                <div class="col-lg-3" style="padding-top: 8px;">
                                    <div class="col-lg-12">
                                        <label class="control-label col-lg-12 pl-0">Select Customer </label>
                                    </div>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox Skin="Material" Filter="Contains" CloseDropDownOnBlur="true" RenderMode="Lightweight"
                                            ID="ddlCustomer" runat="server" CheckBoxes="true" EnableCheckAllItemsCheckBox="true"
                                            EmptyMessage="Select Customer" Width="100%">
                                        </telerik:RadComboBox>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center; top: 25px;">
                                    <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" OnClick="lnkFilter_Click">
                                                    Apply Filter
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>



                        <!-- ---------------------------- -->
                        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid" style="margin-bottom: 0px; padding-top: 20px; padding-bottom: 1px; align-content: center;">
                            <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
                                <div class="m-grid__item m-grid__item--fluid  m-grid m-grid--ver	m-container m-container--responsive m-container--xxl m-page__container" style="background: white;">
                                    <div class="m-grid__item m-grid__item--fluid col-lg-12">
                                        <div class="col-lg-12 row" style="padding-right: 1px;">

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkDeliveryCheck" runat="server" OnClick="lnkDeliveryCheck_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100;">
                                                                        <asp:Label ID="lblDeliveryCheck" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Delivery Check</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkOutOfStock" runat="server" OnClick="lnkOutOfStock_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100; text-align: left;">
                                                                        <asp:Label ID="lblOutOfStock" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Out Of Stock</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkItemAvailability" runat="server" OnClick="lnkItemAvailability_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100;">
                                                                        <asp:Label ID="lblItemAvailability" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Item Availability</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkItemPricing" runat="server" OnClick="lnkItemPricing_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100; text-align: left;">
                                                                        <asp:Label ID="lblItemPricing" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Item Pricing</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkInventory" runat="server" OnClick="lnkInventory_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100;">
                                                                        <asp:Label ID="lblInventory" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Customer Inventory</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkComplaints" runat="server" OnClick="lnkComplaints_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100; text-align: left;">
                                                                        <asp:Label ID="lblComplaints" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Complaints</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkSurvey" runat="server" OnClick="lnkSurvey_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100;">
                                                                        <asp:Label ID="lblSurvey" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Survey</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkAssetTracking" runat="server" OnClick="lnkAssetTracking_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100; text-align: left;">
                                                                        <asp:Label ID="lblAssetTracking" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Asset Tracking</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkCompetitor" runat="server" OnClick="lnkCompetitor_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100;">
                                                                        <asp:Label ID="lblCompetitor" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Competitor Activities</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkDisplayAgreement" runat="server" OnClick="lnkDisplayAgreement_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100; text-align: left;">
                                                                        <asp:Label ID="lblDisplayAgreement" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Display Agreements</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkTasks" runat="server" OnClick="lnkTasks_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100; text-align: left;">
                                                                        <asp:Label ID="lblTasks" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Tasks</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkImageCapture" runat="server" OnClick="lnkImageCapture_Click">
                                                    <div class="kt-portlet kt-callout kt-callout--info" style="background-image: linear-gradient(to right, #434D5D, #294153); padding: 0.1rem;">
                                                        <div class="kt-portlet__body" style="width: 100%; padding-bottom: 10px; padding-top: 10px;">
                                                            <div class="kt-callout__body" style="width: 100%;">
                                                                <div class="kt-callout__content">
                                                                    <h5><span class="" style="color: white; font-weight: 100; text-align: left;">
                                                                        <asp:Label ID="lblImageCapture" runat="server" Text="0"></asp:Label></span></h5>
                                                                    <h6 class="" style="font-weight: 100; color: white; margin-bottom: 0px;">Image Capture</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:LinkButton>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- ---------------------------- -->

                        <telerik:RadAjaxPanel ID="pll" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                            <div class="kt-portlet__body">
                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="50" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="ucp_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ucp_CusStartTime" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Start Time" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ucp_CusStartTime">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ucp_CusEndTime" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="End Time" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ucp_CusEndTime">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Duration" AllowFiltering="true" HeaderStyle-Width="90px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Duration" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Duration">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="DeliveryCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Delivery Check" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="DeliveryCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="OutOfStockCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Out Of Stock" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="OutOfStockCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ItemAvailabilityCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Item Availability" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ItemAvailabilityCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ItemPricingCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Item Pricing" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ItemPricingCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="InventoryCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer Inventory" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="InventoryCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ComplaintCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Complaints" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ComplaintCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="SurveyCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Survey" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="SurveyCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="AssetTrackingCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Asset Tracking" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="AssetTrackingCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="CompetitorActivityCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Competitor Activities" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="CompetitorActivityCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="DisplayAgreementCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Display Agreements" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="DisplayAgreementCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="TaskCount" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Tasks" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="TaskCount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ImageCapture" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Image Capture" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ImageCapture">
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
                        </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                            </div>

                        </telerik:RadAjaxLoadingPanel>
                    </div>

                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body pb-0">

                            <div class="col-lg-12 row" style="padding-bottom: 30px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
