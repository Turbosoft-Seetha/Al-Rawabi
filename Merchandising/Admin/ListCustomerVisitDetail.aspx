<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="ListCustomerVisitDetail.aspx.cs" Inherits="Merchandising.Admin.ListCustomerVisitDetail" %>

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
                                <a href="ListCustomerVisit.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Customer Visit </a>
                                <%--<span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>--%>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> Customer Visit Detail </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Customer Visit Detail
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions" style="padding-top: 10px;">
                            <div class="row">
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
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Customer:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCustomer" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Route:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblRoute" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Is Schedule:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblIsSchedule" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                    </td>
                                                    <td style="width: 56%">
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
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Duration:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblTransTime" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                    </td>
                                                </table>
                                            </div>
                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
                        </div>

                        <!-- ---------------------------- -->
                        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid" style="margin-bottom: 0px; padding-top: 20px; padding-bottom: 1px; align-content: center;">
                            <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
                                <div class="m-grid__item m-grid__item--fluid  m-grid m-grid--ver	m-container m-container--responsive m-container--xxl m-page__container" style="background: white;">
                                    <div class="m-grid__item m-grid__item--fluid col-lg-12">
                                        <div class="col-lg-12 row" style="padding-right: 1px;">

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                            <div class="col-lg-4">
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
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
