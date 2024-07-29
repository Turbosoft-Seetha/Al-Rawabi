<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListOpportunities.aspx.cs" Inherits="Merchandising.BO_Digits.en.ListOpportunities" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body p-8" style="background-color:white;">
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
           <div class="col-lg-12 row" style="display: -webkit-box;padding-bottom:10px;">

                                   <div class="col-lg-3">
                                        <label class="control-label col-lg-12">Route</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="rdRoute" runat="server" EmptyMessage="Select Route" Width="100%" OnSelectedIndexChanged="rdRoute_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>

                                 <div class="col-lg-3" >
                                            <div class="col-lg-12">
                                                <label class="control-label col-lg-12 pl-0">Opportunities </label>
                                            </div>
                                            <div class="col-lg-12">
                                                <telerik:RadComboBox ID="rdCustomer" runat="server" Filter="Contains" RenderMode="Lightweight" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" EmptyMessage="Select Customer" Width="100%">
                                                </telerik:RadComboBox>
                                            </div>
                                        </div>
                                <div class="col-lg-2">
                                    <div class="col-lg-12">
                                    <label class="control-label col-lg-6">From Date</label>
                                        </div>
                                    <div class="col-lg-12">
                                        <telerik:RadDatePicker RenderMode="Lightweight" ID="rdFromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%">
                                        </telerik:RadDatePicker>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdFromDate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="col-lg-12">
                                    <label class="control-label col-lg-6">To Date</label>
                                        </div>
                                    <div class="col-lg-12">
                                        <telerik:RadDatePicker RenderMode="Lightweight" ID="rdEndDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%">
                                        </telerik:RadDatePicker>
                                        <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdEndDate" ControlToCompare="rdFromDate" ErrorMessage="End date must be greater"
                                            Display="Dynamic" ForeColor="Red" Operator="GreaterThanEqual">
                                        </asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdEndDate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>


                                <div class="col-lg-2"  style="text-align: right; top: 10px; text-align: center; padding-top:15px;">
                                    <asp:LinkButton ID="lnkfilter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8"  ForeColor="#009EF7" CausesValidation="true" OnClick="lnkfilter_Click">
                                                    Apply Filter
                                    </asp:LinkButton>
                                </div>


                            </div>
                               <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    OnItemCommand="grvRpt_ItemCommand"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="50" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="opt_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                           <%-- <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="60px" EditFormColumnIndex="0" UniqueName="EditColumn" Visible="false">
                                            </telerik:GridButtonColumn>--%>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false" HeaderText="Document" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Documents">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Documents" ID="Documents" Visible="true" AlternateText="Documents" runat="server"
                                                    ImageUrl="../assets/media/svg/files/File.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                           
                                              <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_Code" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Opportunity Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Opportunity" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="csh_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Parent Company" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="csh_Name" Display="false">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_ShortName" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="ShortName" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_ShortName" Display="false">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_Address" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Address" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_Address">
                                            </telerik:GridBoundColumn>

                                              <telerik:GridBoundColumn DataField="opt_cus_Email" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Email" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Email">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_Mobile" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Mobile" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Mobile">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_GeoLoc" AllowFiltering="true" HeaderStyle-Width="180px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Geo Location" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_GeoLoc" Display="false">
                                            </telerik:GridBoundColumn>

                                               <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="GeoCode" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Map" ID="RadImageButton3" Visible="true" AlternateText="Map" runat="server"
                                                        ImageUrl="../assets/media/svg/general/Compass.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="opt_cus_IsVATEnabled" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="VAT" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="opt_cus_IsVATEnabled" Display="false">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="cls_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cls_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="are_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Area" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="are_Name">
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
