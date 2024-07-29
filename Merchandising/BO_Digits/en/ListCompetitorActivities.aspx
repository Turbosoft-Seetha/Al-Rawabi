<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListCompetitorActivities.aspx.cs" Inherits="Merchandising.BO_Digits.en.ListCompetitorActivities" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
     <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../assets/media/icons/excel.png" Height="50" ToolTip="Download"
                                OnClick="ImageButton4_Click" AlternateText="Xlsx" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
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
    <div class="card-body" style="background-color:white; padding:20px;">

    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                   

                    <div class="kt-portlet__head" style=" padding-bottom: 10px;">
                        <div class="col-lg-12 row">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <div class="row">

                                     <div class="col-lg-3" >
                                        <label class="control-label col-lg-12">Region</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddlRegion" runat="server" EmptyMessage="Select Region" Width="100%" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                         <div class="col-lg-3" >
                                        <label class="control-label col-lg-12">Depot</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddldepot" runat="server" EmptyMessage="Select Depot" Width="100%" OnSelectedIndexChanged="ddldepot_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                                      <div class="col-lg-3" >
                                        <label class="control-label col-lg-12">Area</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddldpoArea" runat="server" EmptyMessage="Select Area" Width="100%" OnSelectedIndexChanged="ddldpoArea_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                                      <div class="col-lg-3" >
                                        <label class="control-label col-lg-12">Subarea</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddldpoSubArea" runat="server" EmptyMessage="Select Subarea" Width="100%" OnSelectedIndexChanged="ddldpoSubArea_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>

                                    <div class="col-lg-3"   style="padding-top:10px;">
                                        <label class="control-label col-lg-12">Route</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlRoute" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Route"
                                                CheckBoxes="true" EnableCheckAllItemsCheckBox="true" AutoPostBack="true" RenderMode="Lightweight" OnSelectedIndexChanged="ddlRoute_SelectedIndexChanged">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-3"   style="padding-top:10px;">
                                        <label class="control-label col-lg-12">Customer</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox ID="ddlCustomer" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Customer" RenderMode="Lightweight"
                                                CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-2"   style="padding-top:10px;">
                                        <label class="control-label col-lg-12">From Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker ID="rdFromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" RenderMode="Lightweight"></telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdFromDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-2"   style="padding-top:10px;">
                                        <label class="control-label col-lg-12">To Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker ID="rdEndDate" runat="server" DateInput-DateFormat="dd-MMM-yyyy" Width="100%" RenderMode="Lightweight"></telerik:RadDatePicker>
                                            <asp:CompareValidator ID="cmp" runat="server" ControlToCompare="rdFromDate" ControlToValidate="rdEndDate" Operator="GreaterThanEqual"
                                                ErrorMessage="To data must be greater" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdEndDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-2" style="text-align: center; top: 19px;padding-top:25px;">
                                        <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" CausesValidation="true" OnClick="lnkFilter_Click">
                                                    Apply Filter
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </telerik:RadAjaxPanel>
                        </div>
                    </div>

                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body">

                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">

                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                     OnItemDataBound="grvRpt_ItemDataBound"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="50" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="cma_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="80px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                            </telerik:GridBoundColumn>
                                            
                                            <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="User" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                            </telerik:GridBoundColumn>

                                            

                                            <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Trans Time" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                            </telerik:GridBoundColumn>
                                            
                                            <telerik:GridBoundColumn DataField="com_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Competitor" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="com_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cat_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Type" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cat_Name">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="brd_Code" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Code">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                            </telerik:GridBoundColumn>


                                            <telerik:GridBoundColumn DataField="cma_Desc" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Description" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cma_Desc">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cma_SpaceVisiblity" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Space Visiblity" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cma_SpaceVisiblity">
                                            </telerik:GridBoundColumn>

                                            
                                              <telerik:GridBoundColumn DataField="cmi_Image" AllowFiltering="true" HeaderStyle-Width="100px" Display="false"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="cmi_Image">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Images" UniqueName="Images" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                            <ItemTemplate>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>


                                            <telerik:GridBoundColumn DataField="cma_Remarks" AllowFiltering="true" HeaderStyle-Width="120px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Remarks" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cma_Remarks">
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
                                    <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                                </div>

                            </telerik:RadAjaxLoadingPanel>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
