<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="DailyTranDetModes.aspx.cs" Inherits="Merchandising.Admin.DailyTranDetModes" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
        function redirects() {
            var url = new URL(window.location.href);
            var id = url.searchParams.get("HID");
            var mode = url.searchParams.get("mode");
            window.location.href = "DetailedDailyTransactions.aspx?Id=" + id + "&&mode=" + mode;
        }
        function redirect() {
            var url = new URL(window.location.href);
            var id = url.searchParams.get("HID");
            window.location.href = "UserDailyProcessDetail.aspx?Id=" + id;
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
                            <div class="kt-subheader__breadcrumbs">


                                <a href="UserDailyProcess.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> User Daily Process </a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link"> User Daily Process Detail </a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a href="javascript:redirects();" class="kt-subheader__breadcrumbs-link"> Customer Operations </a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> Customer Operations Detail </a>
                                <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Customer Operations -
                                <asp:Label ID="lblType" runat="server" Font-Bold="true" ForeColor="Blue"></asp:Label>
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions" style="padding-top: 10px;">
                            <div class="row">

                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../Media/excel.png" Height="39" ToolTip="Download" OnClick="ImageButton4_Click" AlternateText="Xlsx" Visible="false"/>
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
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Version:</label>
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
                        </div>

                        <div class="kt-portlet__body pb-0">
                            <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar1" runat="server">
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
                                                        
                                                        <asp:PlaceHolder ID="pnlVisitEnd" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Visit End:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblVisitEnd" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder ID="pnlTransNo" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Trans Number:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblTransNumb" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder ID="pnlDeliveryBy" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Delivery By:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblDeliveryBy" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder ID="pnlStatus" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Satus:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblStatus" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder ID="pnlCompletedDate" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Completed Date:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCompletedDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder ID="pnlAssetName" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Asset Name:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblAssetName" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                    </td>
                                                    <td>
                                                        <asp:PlaceHolder ID="pnlVisitStart" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Visit Start:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblVisitStart" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder ID="pnlTransTime" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Trans Time:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblTransTime" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder ID="pnlDate" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Date:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                        <asp:PlaceHolder ID="pnlDeliveredDate" runat="server" Visible="false">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Delivered Date:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblDeliveredDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </asp:PlaceHolder>
                                                    </td>
                                                </table>
                                            </div>
                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
                        </div>
                        <!-- ---------------------------- -->


                        <!-- ---------------------------- -->




                        <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                            <div class="kt-portlet__body">
                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    OnPreRender="grvRpt_PreRender"
                                    AllowFilteringByColumn="false"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="50" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="true" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="id"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

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
