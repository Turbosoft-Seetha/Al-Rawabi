<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="ListCoolerType.aspx.cs" Inherits="Merchandising.Admin.ListCoolerType" %>

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
                                <a href="ListCoolerType.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Assets Type </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Assets Type
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
                                    ShowFooter="false" DataKeyNames="clt_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="40px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                        </telerik:GridButtonColumn>

                                        <telerik:GridBoundColumn DataField="clt_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Assets Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="clt_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn DataField="clt_Planogram" UniqueName="clt_Planogram" AllowFiltering="false"
                                            HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Planogram"
                                            HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="pp" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Files/Pictures.svg" NavigateUrl='<%#Eval("clt_Planogram")%>' Target="_blank">
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="clt_Capacity" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Capacity" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="clt_Capacity">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="Status">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Questions" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Questions" ID="RadImageButton3" Visible="true" AlternateText="Questions" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Code/Question-circle.svg"></asp:ImageButton>
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
