<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="OutOfStockDetail.aspx.cs" Inherits="Merchandising.BO_Digits.en.OutOfStockDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
      <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../assets/media/icons/excel.png" Height="50" ToolTip="Download"
                                OnClick="ImageButton4_Click" AlternateText="Xlsx" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="card-body p-8" style="background-color:white;">
                    <div class="kt-portlet__body">
                        <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server">
                            <Items>
                                <telerik:RadPanelItem Font-Bold="true" Expanded="false" BackColor="#F2F6F9">
                                    <ContentTemplate>
                                        <div class="kt-portlet__body p-6" style="background-color: #F9FAFC; display: grid;">
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
                                                    
                                                   
                                                </td>
                                                <td style="width: 56%">
                                                  
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

                    <!--begin::Form-->
                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <div class="kt-form kt-form--label-right">
                            <div class="kt-portlet__body">

                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    OnItemCommand="grvRpt_ItemCommand"
                                     OnItemDataBound="grvRpt_ItemDataBound"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="osd_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="30px" HeaderText="Detail" AllowFiltering="false" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Detail" ID="RadImageButton1" Visible="true" AlternateText="Details" runat="server"
                                                        ImageUrl="../assets/media/svg/general/details.png"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="inl_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Location" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="inl_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="inl_Type" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Location Type" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="inl_Type">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="inl_IsMandatory" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Is Mandatory" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="inl_IsMandatory">
                                            </telerik:GridBoundColumn>


                                             <telerik:GridBoundColumn DataField="osd_InitailImage" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="osd_InitailImage" Display="false">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Initial Images" UniqueName="Images1" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                            <ItemTemplate>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="osd_InitialRemarks" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Initial Remarks" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="osd_InitialRemarks">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="osd_FinalImage" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="osd_FinalImage" Display="false">
                                            </telerik:GridBoundColumn>
                                            
                                              <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Final Images" UniqueName="Images2" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                            <ItemTemplate>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="osd_FinalRemarks" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Final Remarks" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="osd_FinalRemarks">
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
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
