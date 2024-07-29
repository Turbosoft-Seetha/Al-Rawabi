<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="ListPriceListDetail.aspx.cs" Inherits="Merchandising.Admin.ListPriceListDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
    function delConfim() {
            $('#modaldelConfirm').modal('show');
            
        }
       
    function successModal() {
            $('#modaldelConfirm').modal('hide');
            $('#kt_modal_1_7').modal('show');
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


                            <a href="ListPriceListHeader.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i>List Price List Header</a>
                          <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link">List Price List Detail </a>
                       <!--     <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link">Reviewer/Approver Assignment </a> -->

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                          <div class="kt-portlet__head-actions">

                            <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../Media/excel.png" Height="50" ToolTip="Download" OnClick="imgExcel_Click" AlternateText="Xlsx" />

                         </div>
                    </div>
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">List Price List Detail</h3>
                        <div style="padding-left:60rem;">
                            <asp:LinkButton ID="ButtonAdd" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" Text="Add" OnClick="ButtonAdd_Click" Style="padding-top:14px;"></asp:LinkButton>
                               </div> 
                        </div>


                    </div>

                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body pb-0">

                            <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server">
                                <Items>
                                    <telerik:RadPanelItem Font-Bold="true" Expanded="true" BackColor="#F2F6F9">

                                        <ContentTemplate>
                                            <div class="kt-portlet__body" style="background-color: #F9FAFC; display: grid">
                                                <table>
                                                    <td style="width: 56%">
                                                        <div class="col-lg-6 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Price List Name:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblRoute" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                       
                                                    <td>

                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Status:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblstatus" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        

                                                    </td>
                                                </table>


                                            </div>

                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
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
                                ShowFooter="false" DataKeyNames="pld_ID"
                                EnableHeaderContextMenu="true">
                                <Columns>
                                     <telerik:GridTemplateColumn HeaderStyle-Width="50px" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Delete">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Delete" ID="Delete" Visible="true" AlternateText="Delete" runat="server"
                                                     SetFocusOnError="false"
                                                    ImageUrl="../assets/media/icons/svg/General/Trash.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                   <%-- <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="50px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                    </telerik:GridButtonColumn>--%>
                                    <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Product Code" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                    </telerik:GridBoundColumn>
                                    
                                    <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Product Name" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="cat_Code" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Category Code" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="cat_Code">
                                    </telerik:GridBoundColumn>
                                    
                                     <telerik:GridBoundColumn DataField="cat_Name" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="cat_Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="sct_Code" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Sub Category Code" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="sct_Code">
                                    </telerik:GridBoundColumn>
                                   
                                    <telerik:GridBoundColumn DataField="sct_Name" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Sub Category" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="sct_Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="brd_Code" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Brand Code" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="brd_Code">
                                    </telerik:GridBoundColumn>
                                
                                     <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="uom_Name" AllowFiltering="true" HeaderStyle-Width="130px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="UOM" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="uom_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="pld_Price" AllowFiltering="true" HeaderStyle-Width="130px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Standard Selling Price" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="pld_Price">
                                        </telerik:GridBoundColumn>


                                    
                                   
                                     <telerik:GridBoundColumn DataField="pld_VATPerc" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="VAT Percentage" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="pld_VATPerc">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="Status">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                            <GroupingSettings CaseSensitive="false" />
                            <ClientSettings  EnableRowHoverStyle="true" AllowColumnsReorder="True">
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
   <div class="modal fade modal-center" id="modaldelConfirm" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to delete..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel4" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="BtnDelete" runat="server" Text="Yes" OnClick="BtnDelete_Click"  CssClass="btn btn-brand btn-elevate btn-icon-sm" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
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
    <div class="modal fade" id="kt_modal_1_7" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span>Data Deleted Successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="BtnDelConfrm" runat="server" OnClick="BtnDelConfrm_Click" CssClass="btn btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->
</asp:Content>


