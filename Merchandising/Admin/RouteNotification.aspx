<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="RouteNotification.aspx.cs" Inherits="Merchandising.Admin.RouteNotification" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
      <script>
        
        function Confim() {
                $('#modalConfirm').modal('show');
        }
        function successModal() {
                $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
        }
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head" style="padding-top: 20px">

                        <span class="kt-subheader__separator kt-hidden"></span>
                        <div class="kt-subheader__breadcrumbs">


                            <a href="RouteNotification.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i> Route Notifications </a>
                            <%--<span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link">Reviewer/Approver Assignment </a>--%>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">List Route Notifications</h3>
                        </div>
                        <div class="kt-portlet__head-actions"  style="padding-top:10px;">
                            <div class="row">
                                <asp:LinkButton ID="lnkSubCat" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" Text="Add" OnClick="lnkSubCat_Click"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <!--end: Search Form -->
                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
                        <div class="kt-portlet__body">
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
                                    ShowFooter="false" DataKeyNames="rnt_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                       <%-- <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="5px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                        </telerik:GridButtonColumn>--%>
                                          <telerik:GridTemplateColumn HeaderStyle-Width="5px" AllowFiltering="false" HeaderText="Delete" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Delete" ID="RadImageButton2" Visible="true" AlternateText="Delete" runat="server"
                                                        ImageUrl="assets/media/icons/svg/Home/Trash.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="10px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Route Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rnt_Header" AllowFiltering="true" HeaderStyle-Width="10px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Notification Header" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rnt_Header">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rnt_Desc" AllowFiltering="true" HeaderStyle-Width="10px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Description" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rnt_Desc">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rnt_ReadFlag" AllowFiltering="true" HeaderStyle-Width="10px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Read Flag" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rnt_ReadFlag">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rnt_ReplyMessage" AllowFiltering="true" HeaderStyle-Width="10px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Reply Message" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rnt_ReplyMessage">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="10px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Replied User" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rnt_ReplyTime" AllowFiltering="true" HeaderStyle-Width="10px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="ReplyTime" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rnt_ReplyTime">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="10px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Created Date" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="10px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="Status">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <GroupingSettings CaseSensitive="false" />
                                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                    <Resizing AllowColumnResize="true"></Resizing>
                                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>
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
      <%--delete--%>
   <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to delete..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Yes" OnClick="lnkDelete_Click" CssClass="btn btn-brand btn-elevate btn-icon-sm" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="reset" data-dismiss="modal" class="btn btn-secondary">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Data Deleted Successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

</asp:Content>
