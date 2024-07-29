<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="CustomerGeoLocation.aspx.cs" Inherits="Merchandising.BO_Digits.en.CustomerGeoLocation" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script>
        function Confirm() {
            $('#kt_modal_1_3').modal('show');
        }
        function successModal() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_4').modal('show');
        }
        function failedModal() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_5').modal('show');
        }
     </script>
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
                                                <label class="control-label col-lg-12 pl-0">Customer </label>
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
                                        ShowFooter="false" DataKeyNames="cgl_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                              <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Route" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Customer" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                            </telerik:GridBoundColumn>

                                           
                                            <telerik:GridBoundColumn DataField="cgl_CusGeoLoc" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Geo Location" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cgl_CusGeoLoc">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="userName" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="User" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="userName">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Created Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Map" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Map" ID="RadImageButton3" Visible="true" AlternateText="Map" runat="server"
                                                        ImageUrl="../assets/media/icons/Compass.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Update Geo Location" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="GeoLoc" ID="RadImageButton4" Visible="true" AlternateText="GeoLoc" runat="server"
                                                        ImageUrl="../assets/media/icons/Position.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="cus_ID" AllowFiltering="true" HeaderStyle-Width="60px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="ID" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false" Display="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_ID">
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

         </telerik:RadAjaxPanel>

                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>
         </div>

     <!--begin::ValidationModal-->
    <div class="modal fade" id="kt_modal_1_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to update ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="lnkSave" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="lnkSave_Click">
                                                    Yes
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal();">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::ValidationModal-->

    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Geo location has been updated successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">Ok</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

    <!--begin::FailureModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span>Something went wrong, please try again later.</span>
                </div>
                <div class="modal-footer">
                   <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal();">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailureModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
