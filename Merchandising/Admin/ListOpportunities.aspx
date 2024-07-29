<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="ListOpportunities.aspx.cs" Inherits="Merchandising.Admin.ListOpportunities" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadImageButton4">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ltTable" />

                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManagerProxy>
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <span class="kt-subheader__separator kt-hidden"></span>
                            <div class="kt-subheader__breadcrumbs">
                                <a href="ListOpportunities.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Opportunities </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title"> Opportunities
                            </h3>
                        </div>
                       <%-- <div class="kt-portlet__head-actions" style="padding-top: 10px;">
                            <asp:LinkButton ID="lnkAddUser" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" OnClick="lnkAddUser_Click" Visible="false">
                                                    Add
                            </asp:LinkButton>

                        </div>--%>
                    </div>
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
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
                                        ShowFooter="false" DataKeyNames="opt_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                           <%-- <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="60px" EditFormColumnIndex="0" UniqueName="EditColumn" Visible="false">
                                            </telerik:GridButtonColumn>--%>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false" HeaderText="Documents" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Documents">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Documents" ID="Documents" Visible="true" AlternateText="Documents" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Files/File.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                           
                                            <telerik:GridBoundColumn DataField="opt_cus_Code" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="csh_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Parent Company" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="csh_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_ShortName" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="ShortName" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_ShortName">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_Address" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Address" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_Address">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_Mobile" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Mobile" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Mobile">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_Email" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Email" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Email">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_GeoLoc" AllowFiltering="true" HeaderStyle-Width="180px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Geo Location" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_GeoLoc">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_IsVATEnabled" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="VAT" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_IsVATEnabled">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="are_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Area" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="are_Name">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="cls_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Class" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cls_Name">
                                            </telerik:GridBoundColumn>

                                            <%--<telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="GeoLocation" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" Display="false">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="opt_GeoLoc" ID="RadImageButton3" Visible="true" AlternateText="GeoLoc" runat="server"
                                                        ImageUrl="assets/media/icons/svg/Map/Position.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>--%>

                                            
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
                        </div>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
