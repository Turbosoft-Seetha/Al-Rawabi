<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListCustomerRetailPriceDetail.aspx.cs" Inherits="Merchandising.BO_Digits.en.ListCustomerRetailPriceDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
     <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../assets/media/icons/excel.png" Height="50" ToolTip="Download"
                                OnClick="ImageButton4_Click" AlternateText="Xlsx" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="card-body p-8" style="background-color:white;">

    <div class="kt-portlet__body pb-0">

                            <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server">
                                <Items>
                                    <telerik:RadPanelItem Font-Bold="true" Expanded="false" BackColor="#F2F6F9">
                                        <ContentTemplate>
                                            <div class="kt-portlet__body p-4" style="background-color: #F9FAFC; display: grid;">
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
                                                                <asp:Label ID="lblAppUser" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                       
                                                        
                                                    </td>
                                                    <td style="width: 56%">
                                                       <%-- <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Visit Start:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblVisitStart" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Visit End:</label>
                                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                                            <asp:Label ID="lblVisitEnd" Font-Bold="true" runat="server"></asp:Label></label>
                                                    </div>--%>
                                                         <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Customer:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCustomer" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                    <div class="col-lg-12 mb-2">
                                                        <label class="col-lg-2 col-form-label" style="display: contents;">Trans Date & Time:</label>
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

        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
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
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="crd_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>
                                            
                                            <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cat_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cat_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="sct_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Sub Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="sct_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="uom_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="UOM" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="uom_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="crd_RetailPrice" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Retail Price" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="crd_RetailPrice">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="crd_SellingPrice" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Selling Price" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="crd_SellingPrice">
                                            </telerik:GridBoundColumn>

                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                        <Resizing AllowColumnResize="true"></Resizing>
                                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center mt-5">
                                    <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                                </div>

                            </telerik:RadAjaxLoadingPanel>
         </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
