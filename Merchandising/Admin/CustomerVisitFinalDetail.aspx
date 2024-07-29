<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="CustomerVisitFinalDetail.aspx.cs" Inherits="Merchandising.Admin.CustomerVisitFinalDetail" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script>
        function redirect() {
            var url = new URL(window.location.href);
            var c = url.searchParams.get("DId");
            window.location.href = "UserDailyProcessDetail.aspx?Id=" + c;
        }
        function redirects() {
            var url = new URL(window.location.href);
            var c = url.searchParams.get("DId");
            var d = url.searchParams.get("UId");
            window.location.href = "CustomerVisitDetail.aspx?Id=" + d + "&DId=" + c;
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
                            <span class="kt-subheader__separator kt-hidden"></span>
                            <div class="kt-subheader__breadcrumbs">


                                <a href="Reports.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> User Daily Process Report </a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link"> Customer Visit Report </a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a href="javascript:redirects();" class="kt-subheader__breadcrumbs-link"> Customer Visit Detail </a>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> Customer Visit Final Detail </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Customer Visit Final Detail
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
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">App User:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblUser" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Route Name:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblRoute" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Date:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCreatedDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                    </td>
                                                    <td style="width: 56%">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Customer:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCustomer" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Code:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCode" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Type:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblType" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                    </td>
                                                </table>
                                            </div>
                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
                        </div>
                        <telerik:RadAjaxPanel ID="pll" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                            <div class="kt-portlet__body">
                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" AllowMultiRowSelection="false"
                                    ID="grvRpt" AutoGenerateColumns="true" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    OnItemDataBound="grvRpt_ItemDataBound"
                                    ClientSettings-AllowColumnsReorder="true"
                                    OnPreRender="grvRpt_PreRender"
                                    AllowFilteringByColumn="false"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0" ShowFilterIcon="false">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="true" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="S"
                                        EnableHeaderContextMenu="true">

                                        <Columns>
                                            <telerik:GridBoundColumn DataField="answer" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Imagess" FilterControlWidth="100%" Display="false"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="image">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="type" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="type" FilterControlWidth="100%" Display="false"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="type">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridTemplateColumn UniqueName="Images" AllowFiltering="false" Visible="false"
                                                HeaderStyle-Width="180px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Images"
                                                HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                        <PagerStyle AlwaysVisible="true" />

                                    </MasterTableView>
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
