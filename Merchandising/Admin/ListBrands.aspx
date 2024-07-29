<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="ListBrands.aspx.cs" Inherits="Merchandising.Admin.ListBrands" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
                                <a href="ListBrands.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Brands </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Brands
                            </h3>
                        </div>
                    </div>

                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body">
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
                                    ShowFooter="false" DataKeyNames="brd_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="brd_Code" AllowFiltering="true" HeaderStyle-Width="100%"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="brd_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="100%"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                        </telerik:GridBoundColumn>


                                        <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" HeaderText="Image" HeaderStyle-Width="100%" HeaderStyle-Font-Size="Smaller"
                                            HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="Img" runat="server" NavigateUrl=' <%#  Eval("brd_Image") %>' Target="_blank">
                                                    <asp:Image ID="Image" runat="server" ImageUrl=' <%#  Eval("brd_Image") %>' Height="65px" />
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

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
