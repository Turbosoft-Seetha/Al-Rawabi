<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="UserDailyProcess.aspx.cs" Inherits="Merchandising.BO_Digits.en.UserDailyProcess" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--end: Search Form -->
                <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
                <div class="card-body" style="background-color: white; padding: 20px;">

                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

                        <div class="col-lg-12 row" style="padding-bottom: 10px;">

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
                            <div class="col-lg-3"  style="padding-top:10px;">
                                <div class="col-lg-12">
                                    <label class="control-label col-lg-12">Route </label>
                                </div>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlRoute" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Route"
                                        CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight">
                                    </telerik:RadComboBox>
                                </div>
                            </div>
                            <div class="col-lg-3"  style="padding-top:10px;">
                                <label class="control-label col-lg-12">From Date</label>
                                <div class="col-lg-12">
                                    <telerik:RadDatePicker RenderMode="Lightweight" ID="rdFromData" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%">
                                    </telerik:RadDatePicker>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdFromData"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-3"  style="padding-top:10px;">
                                <label class="control-label col-lg-12">To Date</label>
                                <div class="col-lg-12">
                                    <telerik:RadDatePicker RenderMode="Lightweight" ID="rdEndDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%">
                                    </telerik:RadDatePicker>
                                    <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdEndDate" ControlToCompare="rdFromData" ErrorMessage="To date must be greater"
                                        Display="Dynamic" ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdEndDate"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-3" style="padding-top: 25px;">
                                <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" CausesValidation="false" OnClick="lnkFilter_Click">
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
                                    ShowFooter="false" DataKeyNames="dph_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                                    ImageUrl="../assets/media/svg/general/details.png"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                         <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Map" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="map" ID="RadImageButton3" Visible="true" AlternateText="Map" runat="server"
                                                    ImageUrl="../assets/media/UDP/tracking.png"></asp:ImageButton>
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

                                       

                                        <telerik:GridTemplateColumn DataField="udp_LogFile" UniqueName="udp_LogFile" AllowFiltering="false"
                                            HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Log File"
                                            HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="pp" runat="server"
                                                    ImageUrl="../assets/media/svg/files/File.svg" NavigateUrl='<%# "../" + Eval("dph_LogFile")%>' Height="50" Width="50" Target="_blank">
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn DataField="udp_DataBase" UniqueName="udp_DataBase" AllowFiltering="false" Display="false"
                                            HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="DataBase"
                                            HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ps" runat="server"
                                                    ImageUrl="../assets/media/svg/files/Pictures.svg" NavigateUrl='<%# "../" + Eval("dph_Database")%>' Height="50" Width="50" Target="_blank">
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                    </Columns>
                                </MasterTableView>
                            <PagerStyle AlwaysVisible="true" />
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
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>

                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Merchandising Route..!</h5>
                </div>
                <div class="modal-body">
                    <span>It is a merchandising route and hence can not do settlement.</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
