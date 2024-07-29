<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="UserDailyProcessDetail.aspx.cs" Inherits="Merchandising.BO_Digits.en.UserDailyProcessDetail" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="background-color: white; padding: 20px;">
        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!--begin::Portlet-->
                    <div class="kt-portlet">
                        <div class="kt-portlet__head" style="border-bottom-style: ridge; border-bottom-width: thin;padding-bottom: 10px;">

                            <div class="kt-portlet__head-actions col-lg-12 row">
                                <div class="col-lg-6">
                                    <h5 class="card-title text-gray-800">
                                        <asp:Label ID="lblRoute" runat="server"></asp:Label>
                                    </h5>
                                </div>
                                <div class="col-lg-6 row" style="display: flex; justify-content: flex-end;">
                                   
                                    <div class="col-sm-1">
                                        <asp:ImageButton ID="lnkKpi" Visible="false" ToolTip="KPI" AlternateText="KPI" Height="20" runat="server" OnClick="lnkKpi_Click"
                                            ImageUrl="../assets/media/UDP/kpi.png"></asp:ImageButton>
                                    </div>
                                 
                                     <div class="col-sm-1">
                                        <asp:ImageButton ID="lnkMap" Visible="true" ToolTip="Map" AlternateText="Map" runat="server" Height="20" OnClick="lnkMap_Click"
                                            ImageUrl="../assets/media/UDP/tracking.png"></asp:ImageButton>
                                    </div>
                                       <div class="col-sm-1" >
                                        <asp:ImageButton ID="lnkLastRouteCom" Visible="true" ToolTip="LastRouteCommunication" AlternateText="LastRouteCommunication" Height="20" runat="server" OnClick="lnkLastRouteCom_Click"
                                            ImageUrl="../assets/media/UDP/lastupdate.png" ></asp:ImageButton>

                                    </div>
                                    <div class="col-sm-1">
                                        <asp:ImageButton ID="Imgexcel" runat="server" ImageUrl="../assets/media/UDP/excel.png" Height="20" ToolTip="Download" OnClick="Imgexcel_Click" AlternateText="Xlsx" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--begin::Form-->
                        <div class="kt-form kt-form--label-right">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                                <div class="kt-portlet__body pb-0" style="border-bottom-style: inset; border-bottom-width: thin;">

                                    <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server" BorderStyle="None">
                                        <Items>
                                            <telerik:RadPanelItem Font-Bold="true" Expanded="true" BackColor="">
                                                <ContentTemplate>
                                                    <div class="col-lg-12 row mb-2 pt-5">

                                                        <div class="col-sm-4">
                                                            <span class="svg-icon svg-icon-2">
                                                                <svg id="Group_1833" data-name="Group 1833" xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17">
                                                                    <path id="Path_1746" data-name="Path 1746" d="M0,0H17V17H0Z" fill="none" fill-rule="evenodd" />
                                                                    <path id="Path_1747" data-name="Path 1747" d="M10.833,8.667a2.833,2.833,0,1,1,2.833-2.833A2.833,2.833,0,0,1,10.833,8.667Z" transform="translate(-2.333 -0.875)" fill="#6092aa" opacity="0.3" />
                                                                    <path id="Path_1748" data-name="Path 1748" d="M3,18.1C3.275,14.719,6.019,13,9.363,13c3.391,0,6.178,1.624,6.385,5.1a.487.487,0,0,1-.532.567H3.515A.784.784,0,0,1,3,18.1Z" transform="translate(-0.875 -3.792)" fill="#6092aa" />
                                                                </svg>

                                                            </span>
                                                            <%--<img src="../assets/media/UDP/User.png" class="img-responsive" style="height: 20px;" alt="Image">--%>
                                                            <label class="col-lg-2" style="display: contents;">User:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblUser" runat="server"></asp:Label></label>
                                                        </div>

                                                        <div class="col-sm-2">
                                                            <span class="svg-icon svg-icon-2">
                                                                <svg id="Group_1825" data-name="Group 1825" xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17">
                                                                    <rect id="Rectangle_959" data-name="Rectangle 959" width="17" height="17" fill="none" />
                                                                    <path id="Path_1738" data-name="Path 1738" d="M15.11,13.72,11,9.61V3.742a.742.742,0,1,1,1.483,0V9l3.676,3.676,1.623-1.623a.371.371,0,0,1,.633.262v3.925a.371.371,0,0,1-.371.371H14.12a.371.371,0,0,1-.262-.633Z" transform="translate(-2.395 -1.255)" fill="#6092aa" />
                                                                    <path id="Path_1739" data-name="Path 1739" d="M6.155,16.116,7.639,17.6a.371.371,0,0,1-.262.633H3.4a.371.371,0,0,1-.371-.371V13.885a.371.371,0,0,1,.633-.262L5.1,15.063l2.246-1.9L8.306,14.3Z" transform="translate(-0.335 -3.882)" fill="#6092aa" opacity="0.3" />
                                                                </svg>

                                                            </span>
                                                            <%-- <img src="../assets/media/UDP/version.png" class="img-responsive" style="height: 20px;" alt="Image">--%>
                                                            <label class="col-lg-2" style="display: contents;">Version:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblVersion" runat="server"></asp:Label></label>
                                                        </div>

                                                        <div class="col-sm-2">
                                                            <span class="svg-icon svg-icon-2">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17">
                                                                    <g id="Group_1826" data-name="Group 1826" transform="translate(0.062)">
                                                                        <rect id="Rectangle_960" data-name="Rectangle 960" width="17" height="17" transform="translate(-0.062)" fill="none" />
                                                                        <path id="Path_1740" data-name="Path 1740" d="M9.375,16.75a6.375,6.375,0,1,1,6.375-6.375A6.375,6.375,0,0,1,9.375,16.75Z" transform="translate(-0.756 -1.167)" fill="#6092aa" fill-rule="evenodd" opacity="0.3" />
                                                                        <path id="Path_1741" data-name="Path 1741" d="M11.691,7.5h.06a.354.354,0,0,1,.352.319l.322,3.223,2.3,1.315a.354.354,0,0,1,.178.308v.149a.27.27,0,0,1-.342.261l-3.272-.892a.354.354,0,0,1-.26-.369l.307-3.985A.354.354,0,0,1,11.691,7.5Z" transform="translate(-3.098 -2.188)" fill="#6092aa" fill-rule="evenodd" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <%--  <img src="../assets/media/UDP/duration.png" class="img-responsive" style="height: 20px;" alt="Image">--%>
                                                            <label class="col-lg-2" style="display: contents;">Start Time:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblStartTime" runat="server"></asp:Label></label>
                                                        </div>

                                                        <div class="col-sm-2">
                                                            <span class="svg-icon svg-icon-2">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17">
                                                                    <g id="Group_1826" data-name="Group 1826" transform="translate(0.062)">
                                                                        <rect id="Rectangle_960" data-name="Rectangle 960" width="17" height="17" transform="translate(-0.062)" fill="none" />
                                                                        <path id="Path_1740" data-name="Path 1740" d="M9.375,16.75a6.375,6.375,0,1,1,6.375-6.375A6.375,6.375,0,0,1,9.375,16.75Z" transform="translate(-0.756 -1.167)" fill="#6092aa" fill-rule="evenodd" opacity="0.3" />
                                                                        <path id="Path_1741" data-name="Path 1741" d="M11.691,7.5h.06a.354.354,0,0,1,.352.319l.322,3.223,2.3,1.315a.354.354,0,0,1,.178.308v.149a.27.27,0,0,1-.342.261l-3.272-.892a.354.354,0,0,1-.26-.369l.307-3.985A.354.354,0,0,1,11.691,7.5Z" transform="translate(-3.098 -2.188)" fill="#6092aa" fill-rule="evenodd" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <%--<img src="../assets/media/UDP/duration.png" class="img-responsive" style="height: 20px;" alt="Image">--%>
                                                            <label class="col-lg-2" style="display: contents;">End Time:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblEndTime" runat="server"></asp:Label></label>
                                                        </div>

                                                        <div class="col-sm-2">
                                                            <span class="svg-icon svg-icon-2">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17">
                                                                    <g id="Group_1828" data-name="Group 1828" transform="translate(-0.305)">
                                                                        <rect id="Rectangle_961" data-name="Rectangle 961" width="17" height="17" transform="translate(0.305)" fill="none" />
                                                                        <path id="Path_1742" data-name="Path 1742" d="M9.667,16.333a5.667,5.667,0,1,1,5.667-5.667A5.667,5.667,0,0,1,9.667,16.333Z" transform="translate(-1.167 -1.458)" fill="#6092aa" fill-rule="evenodd" opacity="0.3" />
                                                                        <path id="Path_1743" data-name="Path 1743" d="M11.833,4.169a5.744,5.744,0,0,0-1.417,0V3.417H9.708A.708.708,0,0,1,9.708,2h2.833a.708.708,0,1,1,0,1.417h-.708Z" transform="translate(-2.625 -0.583)" fill="#6092aa" fill-rule="evenodd" />
                                                                        <path id="Path_1744" data-name="Path 1744" d="M16.71,6.206l.585-.585a.708.708,0,1,1,1,1l-.554.554A5.7,5.7,0,0,0,16.71,6.206Z" transform="translate(-4.874 -1.579)" fill="#6092aa" fill-rule="evenodd" />
                                                                        <path id="Path_1745" data-name="Path 1745" d="M11.694,7.5h.052a.354.354,0,0,1,.353.327l.3,3.9a.354.354,0,0,1-.326.38h-.679a.354.354,0,0,1-.354-.354c0-.009,0-.018,0-.027l.3-3.9A.354.354,0,0,1,11.694,7.5Z" transform="translate(-3.22 -2.187)" fill="#6092aa" fill-rule="evenodd" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <%--<img src="../assets/media/UDP/duration.png" class="img-responsive" style="height: 20px;" alt="Image">--%>
                                                            <label class="col-lg-2" style="display: contents;">Duration:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblDuration" runat="server"></asp:Label></label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-12 row" style="padding-top: 10px;">
                                                        <div class="col-lg-5">
                                                            <h5 style="color: black; font-weight: 300; padding-top: 8px;">Total Customer Visits : <b>
                                                                <asp:Label ID="lblTotalCustomerCount" runat="server"></asp:Label></b></h5>
                                                        </div>
                                                        <div class="col-lg-7 row">
                                                            <div class="col-lg-9 row">
                                                                <div class="col-lg-3" style="padding-top: 9px;">
                                                                    <label class="control-label col-lg-12">Customers </label>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <telerik:RadComboBox ID="ddlCustomers" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Customers"
                                                                        CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight">
                                                                    </telerik:RadComboBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3">
                                     
                                                                <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" CausesValidation="false" OnClick="lnkFilter_Click">
                                                                    Apply Filter
                                                                </asp:LinkButton>
                                        
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-12 row" style="margin-bottom: 15px;">
                                                        <div class="col-lg-12 mb-4">
                                                            <div class="card-body d-flex flex-column">
                                                                <!--begin::Row-->
                                                                <div class="row g-0">
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkDeliveryCheck" runat="server" OnClick="lnkDeliveryCheck_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/deliverycheck.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblTotalDeliveryCheck" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Delivery Check</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkOutOfStock" runat="server" OnClick="lnkOutOfStock_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/outofstock.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblOutOfStock" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Out Of Stock</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkItemAvailability" runat="server" OnClick="lnkItemAvailability_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/itemavailability.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblItemAvailability" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Item Availability</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkItemPricing" runat="server" OnClick="lnkItemPricing_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/pricing.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblItemPricing" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Item Pricing</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkCustomerInventory" runat="server" OnClick="lnkCustomerInventory_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/inventory.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblCustomerInventory" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Customer Inventory</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkComplaints" runat="server" OnClick="lnkComplaints_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/complaints.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblComplaints" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">General Complaints</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                      <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="LinkProductComplaints" runat="server" OnClick="LinkProductComplaints_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/complaints.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblProductComplaints" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Product Complaints</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkSurvey" runat="server" OnClick="lnkSurvey_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/survey.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblSurvey" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Survey</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkAssetTracking" runat="server" OnClick="lnkAssetTracking_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/asset.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblAssetTracking" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Asset Tracking</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkCompetitorActivities" runat="server" OnClick="lnkCompetitorActivities_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/competitor.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblCompetitorActivites" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Competitor Activites</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkDisplayAgreements" runat="server" OnClick="lnkDisplayAgreements_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/displayagreement.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblDisplayAgreements" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Display Agreements</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkTasks" runat="server" OnClick="lnkTasks_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/task.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblTasks" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Tasks</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkImageCapture" runat="server" OnClick="lnkImageCapture_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/imagecapture.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblImageCapture" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Image Capture</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                      <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkCusActivities" runat="server" OnClick="lnkCusActivities_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/task.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblcusActivities" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Customer Activities</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                    <!--begin::Col-->
                                                                    <div class="col-3">
                                                                        <asp:LinkButton ID="lnkRequests" runat="server" OnClick="lnkRequests_Click">
                                                                            <div class="d-flex align-items-center mb-2 me-2">
                                                                                <!--begin::Symbol-->
                                                                                <div class="col-3">
                                                                                    <div class="symbol symbol-40px me-3" style="background-color: white; padding-top: 20px;">
                                                                                        <div class="symbol-label bg-secondary bg-opacity-0.85" style="border-radius: 10px;">
                                                                                            <!--begin::Svg Icon | path: icons/duotune/abstract/abs043.svg-->
                                                                                            <span class="svg-icon svg-icon-1 svg-icon-dark">
                                                                                                <img src="../assets/media/UDP/imagecapture.png" alt="Invoice" width="28" height="25" style="margin: 10px; margin-left: 15px; margin-right: 15px;" />
                                                                                            </span>
                                                                                            <!--end::Svg Icon-->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--end::Symbol-->
                                                                                <!--begin::Title-->
                                                                                <div class="col-9">
                                                                                    <div class="fs-7 fw-bold pt-6" style="color: black;">
                                                                                        <span class="" style="font-size: 17px; font-weight: bold;">
                                                                                            <asp:Label ID="lblRequests" runat="server"></asp:Label>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="fs-7" style="color: black; margin-right: 40px;">Requests</div>
                                                                                </div>
                                                                                <!--end::Title-->
                                                                            </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    <!--end::Col-->
                                                                </div>
                                                                <!--end::Row-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </telerik:RadPanelItem>
                                        </Items>
                                    </telerik:RadPanelBar>
                                </div>

                                <div class="kt-portlet__body">
                                    <%--<h3 style="color: blue">Customer Visits </h3>--%>
                                    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                        <script type="text/javascript"> 
                                            function grvRpt_RowDblClick(sender, args) {
                                                debugger;
                                                var ClickedIndex = args._itemIndexHierarchical;
                                                //changed code here 
                                                var grid = $find("<%=grvRpt.ClientID %>");
                                                if (grid) {
                                                    var MasterTable = grid.get_masterTableView();
                                                    var Rows = MasterTable.get_dataItems();
                                                    for (var i = 0; i < Rows.length; i++) {
                                                        var row = Rows[i];
                                                        if (ClickedIndex != null && ClickedIndex == i) { // newly added
                                                            MasterTable.fireCommand("MyClick1", ClickedIndex); // newly added
                                                        } // newly added
                                                    }
                                                }
                                            }
                                        </script>
                                    </telerik:RadScriptBlock>

                                    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                    <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                        ID="grvRpt" GridLines="None" BorderWidth="0"
                                        ShowFooter="True" AllowSorting="True"
                                        OnNeedDataSource="grvRpt_NeedDataSource"
                                        OnItemCommand="grvRpt_ItemCommand"
                                        AllowFilteringByColumn="true"
                                        ClientSettings-Resizing-ClipCellContentOnResize="true"
                                        EnableAjaxSkinRendering="true"
                                        AllowPaging="true" PageSize="50" CellSpacing="0">
                                        <ClientSettings>
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                            <ClientEvents OnRowClick="grvRpt_RowDblClick" />
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
                                    <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                                </div>

                            </telerik:RadAjaxLoadingPanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
