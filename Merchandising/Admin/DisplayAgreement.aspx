<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="DisplayAgreement.aspx.cs" Inherits="Merchandising.Admin.DisplayAgreement" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="lnkFilter">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
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


                                <a href="DisplayAgreement.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Display Agreement </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Display Agreement
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions">
                            <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../Media/excel.png" Height="50" ToolTip="Download" OnClick="imgExcel_Click" AlternateText="Xlsx" ImageAlign="Right" />
                        </div>
                    </div>

                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px">
                        <div class="col-lg-12 row">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <label class="control-label col-lg-12">Route</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlRoute" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Route"
                                                CheckBoxes="true" EnableCheckAllItemsCheckBox="true" AutoPostBack="true" RenderMode="Lightweight" OnSelectedIndexChanged="ddlRoute_SelectedIndexChanged">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="control-label col-lg-12">Customer</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlCustomer" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Customer" RenderMode="Lightweight"
                                                CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="control-label col-lg-12">From Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker ID="rdFromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" RenderMode="Lightweight"></telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdFromDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="control-label col-lg-12">To Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker ID="rdEndDate" runat="server" DateInput-DateFormat="dd-MMM-yyyy" Width="100%" RenderMode="Lightweight"></telerik:RadDatePicker>
                                            <asp:CompareValidator ID="cmp" runat="server" ControlToCompare="rdFromDate" ControlToValidate="rdEndDate" Operator="GreaterThanEqual"
                                                ErrorMessage="To data must be greater" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdEndDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-2" style="text-align: center; top: 19px;">
                                        <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" CausesValidation="true" OnClick="lnkFilter_Click">
                                                    Apply Filter
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </telerik:RadAjaxPanel>
                        </div>
                    </div>

                    <!--begin::Form-->
                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <div class="kt-form kt-form--label-right">
                            <div class="kt-portlet__body">

                                <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
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
                                        ShowFooter="false" DataKeyNames="dag_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                            </telerik:GridBoundColumn>

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

                                            <telerik:GridBoundColumn DataField="VisitStart" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Visit Start" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="VisitStart">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="VisitEnd" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Visit End" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="VisitEnd">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="TransTime" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Trans Time" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="TransTime">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="dag_Number" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Transaction No" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_Number">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="act_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="act_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="asc_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Subcategory" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="asc_Name">
                                            </telerik:GridBoundColumn>
                                            
                                            <telerik:GridBoundColumn DataField="agt_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Type" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="agt_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="apt_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Pay Terms" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="apt_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ago_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Offers" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ago_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="dag_StartDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Start Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_StartDate">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="dag_EndDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="End Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_EndDate">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="brd_Code" AllowFiltering="true" HeaderStyle-Width="110px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand Name" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="dag_TotalAmount" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Total Amount" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_TotalAmount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="dag_MonthlyAmount" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Monthly Amount" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_MonthlyAmount">
                                            </telerik:GridBoundColumn>

                                            <%--<telerik:GridBoundColumn DataField="dag_Image" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Image" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_Image">
                                            </telerik:GridBoundColumn>--%>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Image" UniqueName="Images" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="salImg" runat="server" NavigateUrl=' <%#  Eval("dag_Image") %>' Target="_blank" Visible="true">
                                                        <asp:Image ID="salImage" runat="server" ImageUrl=' <%#  Eval("dag_Image") %>' Height="65px" Visible="true" />
                                                    </asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <%--<telerik:GridBoundColumn DataField="dag_Attachment" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Attachment" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_Attachment">
                                            </telerik:GridBoundColumn>--%>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Attachment" UniqueName="Imagess" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="salImgs" runat="server" NavigateUrl=' <%#  Eval("dag_Attachment") %>' Target="_blank" Visible="true" ImageUrl="assets/media/icons/svg/Files/File.svg">
                                                        <asp:Image ID="salImages" runat="server" ImageUrl=' <%#  Eval("dag_Attachment") %>' Height="65px" Visible="true" />
                                                    </asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="dag_Remarks" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Remarks" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_Remarks">
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
