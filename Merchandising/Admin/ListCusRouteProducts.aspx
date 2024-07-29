<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="ListCusRouteProducts.aspx.cs" Inherits="Merchandising.Admin.ListCusRouteProducts" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
        function cusroute() {
            var url = new URL(window.location.href);
            var c = url.searchParams.get("Id");
            var R = url.searchParams.get("RID");
            window.location.href = "ListCustomerRoute.aspx?Id=" + R;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head" style="padding-top: 20px">

                        <span class="kt-subheader__separator kt-hidden"></span>
                        <div class="kt-subheader__breadcrumbs">


                            <a href="ListRoute.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i>Route </a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:cusroute();" class="kt-subheader__breadcrumbs-link">Route Customer </a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link">Customer Products </a>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                        <div class="kt-portlet__head-actions" style="padding-bottom: 1.5rem;">
                            <div class="row">
                                <asp:LinkButton ID="lnkSubCat" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" Text="Add" OnClick="lnkSubCat_Click" Style="padding-top: 14px;"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">

                            <table>
                                <tr>
                                    <td class="kt-portlet__head-title">Route Customer Products /<telerik:RadLabel ID="cusroute" runat="server" CssClass="kt-portlet__head-title"><br />
                                    </telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="kt-portlet__head-title">
                                        <telerik:RadLabel ID="Cusname" runat="server" CssClass="kt-portlet__head-title"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <%-- <tr>
                            <td class="kt-portlet__head-title"><telerik:RadLabel id="Prhname" runat="server" CssClass="kt-portlet__head-title"></telerik:RadLabel>
                            </td>
                            </tr>--%>
                            </table>


                        </div>
                    </div>






                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body">


                            <div class=" col-lg-12 row" style="display: -webkit-box; padding-bottom: 10px">
                                <%--<telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">--%>
                                    <div class="col-lg-3 ">
                                        <label class="control-label col-lg-8">Price List Header</label>
                                        <div class="col-lg-8">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CloseDropDownOnBlur="true" RenderMode="Lightweight"
                                                ID="rdprhead" runat="server" OnSelectedIndexChanged="rdprhead_SelectedIndexChanged"
                                                EmptyMessage="Select Price List" Width="170%">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>
                                <%--</telerik:RadAjaxPanel>--%>
                                <%--<telerik:RadAjaxPanel ID="RadAjaxPanel4" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">--%>
                                    <div class="col-lg-3" style="text-align: center; top: 10px; padding-bottom: 20px;">
                                        <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" CausesValidation="false" OnClick="lnkFilter_Click">
                                                    Apply Filter
                                        </asp:LinkButton>
                                    </div>
                                <%--</telerik:RadAjaxPanel>--%>
                            </div>

                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                            <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

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
                                    ShowFooter="false" DataKeyNames="crp_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                        <%--<telerik:GridBoundColumn DataField="crp_rcs_ID" AllowFiltering="true" HeaderStyle-Width="200px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" crp_rcs_ID" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="crp_rcs_ID">
                                        </telerik:GridBoundColumn>--%>
                                        <%-- <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="60px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                        </telerik:GridButtonColumn>--%>

                                        <telerik:GridBoundColumn DataField="prh_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Price List Header Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="prh_Name" Visible="true">
                                        </telerik:GridBoundColumn>

                                        
                                        <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Product Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Product" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="cat_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Category Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="cat_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="cat_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="cat_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="sct_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Sub Category Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="sct_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="sct_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Sub Category" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="sct_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="brd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Brand Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="brd_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="110px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Created Date" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="CreatedDate" Visible="false">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="crp_StartDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="From Date" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="crp_StartDate" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="crp_EndDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="To Date" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="crp_EndDate" Visible="true">
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
</asp:Content>