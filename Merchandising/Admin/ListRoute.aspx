<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="ListRoute.aspx.cs" Inherits="Merchandising.Admin.ListRoute" %>

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
                                <a href="ListRoute.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Routes </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Routes
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions" style="padding-top: 10px;">
                            <asp:LinkButton ID="lnkAddUser" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" OnClick="lnkAddUser_Click">
                                                    Add
                            </asp:LinkButton>

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
                                    ShowFooter="false" DataKeyNames="rot_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                        <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="20px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                        </telerik:GridButtonColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="20px" AllowFiltering="false" HeaderText="Customer" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Customer" ID="RadImageButton3" Visible="true" AlternateText="Customer" runat="server"
                                                    ImageUrl="assets/media/icons/svg/General/User.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="20px" AllowFiltering="false" HeaderText="Customer Weeks" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="CWS" ID="RadImageButtosn3" Visible="true" AlternateText="Customer Week Schedule" runat="server"
                                                    ImageUrl="assets/media/icons/svg/General/User.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                         <telerik:GridTemplateColumn HeaderStyle-Width="50px" AllowFiltering="false" HeaderText="Products" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="ProAssigned">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="ProAssigned" ID="ProAssigned" Visible="true" AlternateText="Assigned" runat="server"
                                                    ImageUrl="../assets/media/icons/svg/General/Star.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="30px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Route" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                        </telerik:GridBoundColumn>


                                        <%--<telerik:GridBoundColumn DataField="rso_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Route Sequence Order" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rso_Name">
                                        </telerik:GridBoundColumn>--%>

                                        <telerik:GridBoundColumn DataField="usr_Code" AllowFiltering="true" HeaderStyle-Width="20px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="User Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="usr_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="User" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                        </telerik:GridBoundColumn>

                                        <%--<telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="Status">
                                        </telerik:GridBoundColumn>--%>

                                        <%--<telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Device" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Device" ID="RadImageButton1" Visible="true" AlternateText="Device" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Devices/Android.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>--%>

                                        <%--<telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="User" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="User" ID="RadImageButton2" Visible="true" AlternateText="User" runat="server"
                                                    ImageUrl="assets/media/icons/svg/General/User.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>--%>
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
