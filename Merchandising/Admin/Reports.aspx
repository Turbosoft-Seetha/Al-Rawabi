<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Merchandising.Admin.Reports" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAo68pO8GJWfgkQtcr6UyogsUcMCETbBTI&callback=initMap&libraries=&v=weekly" async></script>
    <script src="WayPoints/waypoints.js"></script>
    <script>

        function WayMap(WayPoints, cusNames, DtFormat, types) {

            const checkboxArray = WayPoints.split('-');
            const CheckboxName = cusNames.split('{0}');
            const CheckboxDt = DtFormat.split('{0}');
            const Checkboxtp = types.split('{0}');
            //const checkboxArray = ["25.2768536,55.3482438" ];
            //alert(checkboxArray)

            $('#MapAlert').modal('show');
            initMapX(checkboxArray, CheckboxName, CheckboxDt, Checkboxtp);
        }
        function ErrorModal(res) {
            $('#err').text(res);
            $('#ErrorModal').modal('show');
        }



    </script>
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


                                <a href="Reports.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> User Daily Process Report </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">User Daily Process Report</h3>
                        </div>
                        <div class="kt-portlet__head-actions" style="padding-top: 10px;">
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="../Media/excel.png" Height="50" ToolTip="Download"
                                OnClick="ImageButton4_Click" AlternateText="Xlsx" />

                        </div>
                    </div>
                    <!--end: Search Form -->
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px">
                        <div class="col-lg-12 row">
                            <div class="col-lg-3">
                                <label class="control-label col-lg-12">Route</label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlRoute" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Route"
                                        CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight">
                                    </telerik:RadComboBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="col-lg-12">
                                    <label class="control-label col-lg-12 pl-0">From Date </label>
                                </div>
                                <div class="col-lg-12">
                                    <telerik:RadDatePicker ID="rdFromData" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" RenderMode="Lightweight"></telerik:RadDatePicker>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="col-lg-12">
                                    <label class="control-label col-lg-12 pl-0">To Date </label>
                                </div>
                                <div class="col-lg-12">
                                    <telerik:RadDatePicker ID="rdEndDate" runat="server" DateInput-DateFormat="dd-MMM-yyyy" Width="100%" RenderMode="Lightweight"></telerik:RadDatePicker>
                                    <asp:CompareValidator ID="cmp" runat="server" ControlToCompare="rdFromData" ControlToValidate="rdEndDate" Operator="GreaterThanEqual"
                                        ErrorMessage="To data must be greater" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                </div>
                            </div>

                            <div class="col-lg-2" style="text-align: center; top: 20px;">
                                <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" OnClick="lnkFilter_Click" AutoPostBack="true" Text="Apply Filter"></asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
                    <div class="kt-portlet__body">

                        <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
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
                                    ShowFooter="false" DataKeyNames="dph_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                                    ImageUrl="assets/media/icons/svg/General/Clipboard.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="110px" ColumnGroupName="Downloadable"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="150px" ColumnGroupName="Downloadable"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Route Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="150px" ColumnGroupName="Downloadable"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="App User" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="dph_StartDayTime" AllowFiltering="true" HeaderStyle-Width="130px" ColumnGroupName="Downloadable"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Start Time" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="dph_StartDayTime">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="dph_EndDayTime" AllowFiltering="true" HeaderStyle-Width="130px" ColumnGroupName="Downloadable"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="End Time" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="dph_EndDayTime">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Duration" AllowFiltering="true" HeaderStyle-Width="120px" ColumnGroupName="Downloadable"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Duration" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="Duration">
                                        </telerik:GridBoundColumn>

                                        <%--<telerik:GridBoundColumn DataField="dph_StartOdoMeter" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Start OdoMeter" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="dph_StartOdoMeter">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="dph_EndOdoMeter" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="End OdoMeter" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="dph_EndOdoMeter">
                                        </telerik:GridBoundColumn>--%>

                                        <telerik:GridBoundColumn DataField="dph_VersionNumber" AllowFiltering="true" HeaderStyle-Width="100px" ColumnGroupName="Downloadable"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Version" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="dph_VersionNumber">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Map" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="map" ID="RadImageButton3" Visible="true" AlternateText="Map" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Map/Compass.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn DataField="udp_LogFile" UniqueName="udp_LogFile" AllowFiltering="false"
                                            HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Log File"
                                            HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="pp" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Files/File.svg" NavigateUrl='<%#Eval("dph_LogFile")%>' Height="50" Width="50" Target="_blank">
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn DataField="udp_DataBase" UniqueName="udp_DataBase" AllowFiltering="false"
                                            HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="DataBase"
                                            HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ps" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Files/Pictures.svg" NavigateUrl='<%#Eval("dph_Database")%>' Height="50" Width="50" Target="_blank">
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                    </Columns>
                                </MasterTableView>
                                <GroupingSettings CaseSensitive="false" />
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                    <Resizing AllowColumnResize="true"></Resizing>
                                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>
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
    </div>

    <div class="modal fade" id="MapAlert" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="true" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 90% !important">
            <div class="modal-content col-lg-12">

                <div class="modal-body" style="width: auto">
                    <div class="col-lg-12 row">
                        <div class="col-lg-6">
                            <div id="map" style="height: 800px; width: inherit"></div>
                        </div>
                        <div class="col-lg-4">
                            <div id="directions-panel"></div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <span style="color: green;">The direction shows here is an appropreate route, it may varies from original route</span>
                    <button data-dismiss="modal" class="btn btn-primary">Ok</button>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="ErrorModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="true" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content col-lg-12">

                <div class="modal-body" style="width: auto">
                    <div class="col-lg-12 row">

                        <span id="err" style="color: red; font-weight: bold;"></span>
                    </div>

                </div>
                <div class="modal-footer">

                    <button data-dismiss="modal" class="btn btn-primary">Ok</button>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
