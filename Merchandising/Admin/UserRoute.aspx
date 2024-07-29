<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="UserRoute.aspx.cs" Inherits="Merchandising.Admin.UserRoute" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="kt-portlet">
                    <div class="kt-portlet__head" style="padding-top: 20px">

                        <span class="kt-subheader__separator kt-hidden"></span>
                        <div class="kt-subheader__breadcrumbs">


                            <a href="ListRoute.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i> Routes </a>
                            <%--<span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>--%>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link"> Route Users </a>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                    </div>
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">
                            <asp:Literal ID="ltrlRoute" runat="server"></asp:Literal> Route Users
                            </h3>
                        </div>

                    </div>
                    
                </div>
            </div>
            <div class="col-lg-6">

                <!--begin::Portlet-->
                <div class="kt-portlet">
                    
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Un Assigned Users
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
                                OnItemCommand="grvRpt_ItemCommand"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="10" CellSpacing="0">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="usr_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Add" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Add" ID="RadImageButton1" Visible="true" AlternateText="Add" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Files/File-plus.svg"></asp:ImageButton>
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
            <div class="col-lg-6">

                <!--begin::Portlet-->
                <div class="kt-portlet">

                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Assigned Users
                            </h3>
                        </div>

                    </div>

                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>


                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                ID="RadGrid1" GridLines="None"
                                ShowFooter="True" AllowSorting="True"
                                OnNeedDataSource="RadGrid1_NeedDataSource"
                                OnItemCommand="RadGrid1_ItemCommand"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="10" CellSpacing="0">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="uir_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Remove" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Remove" ID="RadImageButton2" Visible="true" AlternateText="Remove" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Files/File-minus.svg"></asp:ImageButton>
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
