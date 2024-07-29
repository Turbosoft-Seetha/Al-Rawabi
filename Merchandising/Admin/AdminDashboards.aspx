<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="AdminDashboards.aspx.cs" Inherits="Merchandising.Admin.AdminDashboards" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="assets/style.bundle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-lg-12" style="padding-left: 40px; padding-right: 40px;">
        <div class="kt-portlet">
            <div class="kt-portlet__head" style="background-color: #f2f3f8; padding: 0px; border-bottom: 0px;">
                <div class="kt-portlet__head-label">
                    <div class="col-lg-12 row">
                        <div class="col-lg-3">
                            <label class="control-label col-lg-12">Route</label>
                            <div class="col-lg-12">
                                <telerik:RadComboBox ID="ddlRoute" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Route"
                                    CheckBoxes="true" EnableCheckAllItemsCheckBox="true" AutoPostBack="true" RenderMode="Lightweight">
                                </telerik:RadComboBox>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <label class="control-label col-lg-12">From Date</label>
                            <div class="col-lg-12">
                                <telerik:RadDatePicker ID="rdFromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" RenderMode="Lightweight"></telerik:RadDatePicker>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdFromDate"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <label class="control-label col-lg-12">To Date</label>
                            <div class="col-lg-12">
                                <telerik:RadDatePicker ID="rdEndDate" runat="server" DateInput-DateFormat="dd-MMM-yyyy" Width="100%" RenderMode="Lightweight"></telerik:RadDatePicker>
                                <asp:CompareValidator ID="cmp" runat="server" ControlToCompare="rdFromDate" ControlToValidate="rdEndDate" Operator="GreaterThanEqual"
                                    ErrorMessage="To data must be greater" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdEndDate"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col-lg-3" style="text-align: center; top: 19px;">
                            <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" CausesValidation="true" OnClick="lnkFilter_Click">
                                                    Apply Filter
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>

                <div class="kt-portlet__head-actions">
                    <ul class="nav" style="padding-top: 22px;">
                        <li class="nav-item">
                            <asp:LinkButton ID="lnkToday" runat="server" CssClass="btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4 me-1" OnClick="lnkToday_Click">Today</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lnkMonth" runat="server" CssClass="nav-link btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4 me-1" OnClick="lnkMonth_Click">Month</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lnkYear" runat="server" CssClass="nav-link btn btn-sm btn-color-muted btn-active btn-active-light-primary fw-bolder px-4" OnClick="lnkYear_Click">Year</asp:LinkButton>
                        </li>
                    </ul>
                </div>

            </div>
        </div>

    </div>
    <div class="post d-flex flex-column-fluid" id="kt_post">

        <div id="kt_content_container" class="container-xxl" style="margin-left: 0px; margin-right: 0px; max-width: none;">

            <div class="row g-5 g-xl-8">
                <div class="col-xl-4">
                    <asp:LinkButton ID="lnkTotalVisits" runat="server" OnClick="lnkTotalVisits_Click">
                        <!--begin::Statistics Widget 1-->
                        <div class="card bgi-no-repeat card-xl-stretch mb-xl-8" style="background-position: right top; background-size: 20% auto; background-image: url(assets/media/dashboard/total_1@2x.png)">
                            <!--begin::Body-->
                            <div class="card-body">
                                <img src="assets/media/dashboard/total@2x.png" alt="Total" style="width: 7%;" />
                                <h3 style="padding-top: 20px;"><span class="" style="color: white; font-weight: 600">
                                    <asp:Label ID="lblTotalVisits" runat="server" Text="0" ForeColor="Black"></asp:Label></span></h3>
                                <p style="color: grey; margin-bottom: 0px;">Total Visits</p>
                            </div>
                            <!--end::Body-->
                        </div>
                        <!--end::Statistics Widget 1-->
                    </asp:LinkButton>
                </div>
                <div class="col-xl-4">
                    <asp:LinkButton ID="lnkScheduledVisits" runat="server" OnClick="lnkScheduledVisits_Click">
                        <!--begin::Statistics Widget 1-->
                        <div class="card bgi-no-repeat card-xl-stretch mb-xl-8" style="background-position: right top; background-size: 25% auto; background-image: url(assets/media/dashboard/scheduled_1@2x.png); background-color: #F05555;">
                            <!--begin::Body-->
                            <div class="card-body">
                                <img src="assets/media/dashboard/scheduled@2x.png" alt="Scheduled" style="width: 7%;" />
                                <h3 style="padding-top: 20px;"><span class="" style="color: white; font-weight: 600">
                                    <asp:Label ID="lblTotalScheduledVisits" runat="server" Text="0" ForeColor="White"></asp:Label></span></h3>
                                <p style="color: white; margin-bottom: 0px;">Scheduled Visits</p>
                            </div>
                            <!--end::Body-->
                        </div>
                        <!--end::Statistics Widget 1-->
                    </asp:LinkButton>
                </div>
                <div class="col-xl-4">
                    <asp:LinkButton ID="lnkUnscheduledVisits" runat="server" OnClick="lnkUnscheduledVisits_Click">
                        <!--begin::Statistics Widget 1-->
                        <div class="card bgi-no-repeat card-xl-stretch mb-5 mb-xl-8" style="background-position: right top; background-size: 25% auto; background-image: url(assets/media/dashboard/unscheduled_1@2x.png); background-color: #31485F;">
                            <!--begin::Body-->
                            <div class="card-body">
                                <img src="assets/media/dashboard/unscheduled@2x.png" alt="Unscheduled" style="width: 7%;" />
                                <h3 style="padding-top: 20px;"><span class="" style="color: white; font-weight: 600">
                                    <asp:Label ID="lblTotalUnscheduledVisits" runat="server" Text="0" ForeColor="White"></asp:Label></span></h3>
                                <p style="color: white; margin-bottom: 0px;">Unscheduled Visits</p>
                            </div>
                            <!--end::Body-->
                        </div>
                        <!--end::Statistics Widget 1-->
                    </asp:LinkButton>
                </div>
            </div>

            <div class="row g-5 g-xl-8">
                <!--begin::Col-->
                <div class="col-xl-4">
                    <!--begin::Mixed Widget 13-->
                    <div class="card card-xl-stretch mb-xl-8">
                        <!--begin::Header-->
                        <div class="card-header border-0">
                            <h3 class="card-title text-dark">Others</h3>
                        </div>
                        <!--end::Header-->
                        <!--begin::Body-->
                        <div class="card-body pt-0">
                            <!--begin::Item-->
                            <div class="d-flex align-items-center rounded p-5 mb-7" style="background-color: #F05555;">
                                <!--begin::Icon-->
                                <span class="svg-icon svg-icon-warning">
                                    <!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
                                    <span class="svg-icon svg-icon-1" style="line-height: 4;">
                                        <img src="assets/media/dashboard/items@2x.png" alt="Survey" style="width: 60%;" />
                                    </span>
                                    <!--end::Svg Icon-->
                                </span>
                                <!--end::Icon-->
                                <!--begin::Title-->
                                <div class="flex-grow-1 me-2">
                                    <asp:LinkButton ID="lnkSurvey" runat="server" OnClick="lnkSurvey_Click" CssClass="fs-6" ForeColor="White">Survey</asp:LinkButton>
                                </div>
                                <!--end::Title-->
                                <!--begin::Lable-->
                                <span class="fw-bolder py-1" style="color: white; font-size: large;">
                                    <asp:Label ID="lblSurvey" runat="server"></asp:Label>
                                </span>
                                <!--end::Lable-->
                            </div>

                            <!--end::Item-->
                            <!--begin::Item-->
                            <div class="d-flex align-items-center rounded p-5" style="background-color: #F05555;">
                                <!--begin::Icon-->
                                <span class="svg-icon svg-icon-success">
                                    <!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
                                    <span class="svg-icon svg-icon-1" style="line-height: 4;">
                                        <img src="assets/media/dashboard/customers@2x.png" alt="Complaints" style="width: 60%;" />
                                    </span>
                                    <!--end::Svg Icon-->
                                </span>
                                <!--end::Icon-->
                                <!--begin::Title-->
                                <div class="flex-grow-1 me-2">
                                    <asp:LinkButton ID="lnkComplaints" runat="server" OnClick="lnkComplaints_Click" CssClass="fs-6" ForeColor="White">Complaints</asp:LinkButton>
                                </div>
                                <!--end::Title-->
                                <!--begin::Lable-->
                                <span class="fw-bolder py-1" style="color: white; font-size: large;">
                                    <asp:Label ID="lblComplaints" runat="server"></asp:Label>
                                </span>
                                <!--end::Lable-->
                            </div>
                            <!--end::Item-->
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Mixed Widget 13-->
                </div>
                <!--end::Col-->
                <div class="col-xl-8">
                    <!--begin::Mixed Widget 14-->
                    <div class="col-xl-12" style="padding: 0px;">
                        <!--begin::Mixed Widget 13-->
                        <div class="card card-xl-stretch mb-xl-8">
                            <!--begin::Header-->
                            <div class="card-header border-0">
                                <h3 class="card-title text-dark">Item Availability</h3>
                            </div>
                            <!--end::Header-->
                            <!--begin::Body-->
                            <div class="card-body pt-0 row">
                                <div class="col-xl-12">
                                    <!--begin::Item-->

                                    <%--<div class="d-flex align-items-center rounded p-5 mb-7" style="background-color: #31485F;">

                                        <!--begin::Icon-->
                                        <span class="svg-icon svg-icon-warning">
                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
                                            <span class="svg-icon svg-icon-1" style="line-height: 4;">
                                                <img src="assets/media/dashboard/items@2x.png" alt="AvailableItems" style="width: 60%;" />
                                            </span>
                                            <!--end::Svg Icon-->
                                        </span>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <div class="flex-grow-1 me-2">
                                            <asp:LinkButton ID="lnkAvailItems" runat="server" OnClick="lnkAvailItems_Click" CssClass="fs-6" ForeColor="White">Available Items</asp:LinkButton>
                                        </div>
                                        <!--end::Title-->
                                        <!--begin::Lable-->
                                        <span class="fw-bolder py-1" style="color: white; font-size: large;">
                                            <asp:Label ID="lblAvailableItems" runat="server" Text="0"></asp:Label>
                                        </span>
                                        <!--end::Lable-->
                                    </div>--%>

                                    <!--end::Item-->
                                    <!--begin::Item-->

                                    <div class="d-flex align-items-center rounded p-5 mb-7" style="background-color: #31485F;">

                                        <!--begin::Icon-->
                                        <span class="svg-icon svg-icon-success">
                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
                                            <span class="svg-icon svg-icon-1" style="line-height: 4;">
                                                <img src="assets/media/dashboard/customers@2x.png" alt="NotAvailableItems" style="width: 60%;" />
                                            </span>
                                            <!--end::Svg Icon-->
                                        </span>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <div class="flex-grow-1 me-2">
                                            <asp:LinkButton ID="lnkNotAvailItems" runat="server" OnClick="lnkNotAvailItems_Click" CssClass="fs-6" ForeColor="White">Not Available Items</asp:LinkButton>
                                        </div>
                                        <!--end::Title-->
                                        <!--begin::Lable-->
                                        <span class="fw-bolder py-1" style="color: white; font-size: large;">
                                            <asp:Label ID="lblNotAvailableItems" runat="server" Text="0"></asp:Label>
                                        </span>
                                        <!--end::Lable-->

                                    </div>

                                    <!--end::Item-->
                                </div>
                                <div class="col-xl-12">
                                    <!--begin::Item-->

                                    <%--<div class="d-flex align-items-center rounded p-5 mb-7" style="background-color: #31485F;">

                                        <!--begin::Icon-->
                                        <span class="svg-icon svg-icon-warning">
                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
                                            <span class="svg-icon svg-icon-1" style="line-height: 4;">
                                                <img src="assets/media/dashboard/items@2x.png" alt="AvailableCustomers" style="width: 60%;" />
                                            </span>
                                            <!--end::Svg Icon-->
                                        </span>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <div class="flex-grow-1 me-2">
                                            <asp:LinkButton ID="lnkAvailCustomers" runat="server" OnClick="lnkAvailCustomers_Click" CssClass="fs-6" ForeColor="White">Available Customers</asp:LinkButton>
                                        </div>
                                        <!--end::Title-->
                                        <!--begin::Lable-->
                                        <span class="fw-bolder py-1" style="color: white; font-size: large;">
                                            <asp:Label ID="lblAvailableCustomers" runat="server" Text="0"></asp:Label>
                                        </span>
                                        <!--end::Lable-->
                                    </div>--%>

                                    <!--end::Item-->
                                    <!--begin::Item-->

                                    <div class="d-flex align-items-center rounded p-5" style="background-color: #31485F;">

                                        <!--begin::Icon-->
                                        <span class="svg-icon svg-icon-success">
                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
                                            <span class="svg-icon svg-icon-1" style="line-height: 4;">
                                                <img src="assets/media/dashboard/customers@2x.png" alt="NotAvailableCustomers" style="width: 60%;" />
                                            </span>
                                            <!--end::Svg Icon-->
                                        </span>
                                        <!--end::Icon-->
                                        <!--begin::Title-->
                                        <div class="flex-grow-1 me-2">
                                            <asp:LinkButton ID="lnkNotAvailCustomers" runat="server" OnClick="lnkNotAvailCustomers_Click" CssClass="fs-6" ForeColor="White">Not Available Customers</asp:LinkButton>
                                        </div>
                                        <!--end::Title-->
                                        <!--begin::Lable-->
                                        <span class="fw-bolder py-1" style="color: white; font-size: large;">
                                            <asp:Label ID="lblNotAvailableCustomers" runat="server" Text="0"></asp:Label>
                                        </span>
                                        <!--end::Lable-->
                                    </div>

                                    <!--end::Item-->
                                </div>
                            </div>
                            <!--end::Body-->
                        </div>
                        <!--end::Mixed Widget 13-->
                    </div>
                    <!--end::Mixed Widget 14-->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
