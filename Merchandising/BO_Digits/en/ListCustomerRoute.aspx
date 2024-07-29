<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListCustomerRoute.aspx.cs" Inherits="Merchandising.BO_Digits.en.ListCustomerRoute" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
          <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                <asp:LinkButton ID="lnkSettings" runat="server" Text="Settings" CssClass="btn btn-sm btn-light-primary me-2 border-1"  CausesValidation="false" OnClick="lnkSettings_Click">
</asp:LinkButton>
    <asp:LinkButton ID="lnkAddEmployee" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Add" OnClick="lnkAddEmployee_Click" ></asp:LinkButton>
             </telerik:RadAjaxPanel>
     <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../assets/media/icons/excel.png" Height="50" ToolTip="Download" OnClick="imgExcel_Click" AlternateText="Xlsx" ImageAlign="Right" />


                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="card-body" style="background-color:white; padding:20px;">
     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                   
               <h3 class="kt-portlet__head-title"> 
                    <telerik:RadLabel ID="cusroute" runat="server" CssClass="kt-portlet__head-title"></telerik:RadLabel>

                        </h3>
                       
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
                                OnItemCommand="grvRpt_ItemCommand"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"  ScrollHeight="500px"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="rcs_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                        <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="50px"
                                            EditFormColumnIndex="0" UniqueName="EditColumn">
                                        </telerik:GridButtonColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="50px" AllowFiltering="false" HeaderText=""
                                            HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Delete">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Delete" ID="Delete" Visible="true" AlternateText="Delete" runat="server"
                                                    ImageUrl="../assets/media/svg/general/Trash.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                         <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Special Pricing" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="ProAssigned">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="ProAssigned" ID="ProAssigned" Visible="true" AlternateText="Assigned" runat="server"
                                                    ImageUrl="../assets/media/svg/General/Clipboard.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>


                                        <%-- <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Special Pricing" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="ProAssigned">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="ProAssigned" ID="ProAssigned" Visible="true" AlternateText="Assigned" runat="server"
                                                    ImageUrl="../assets/media/icons/svg/General/BookMark.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>--%>

                                        <%-- <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Products" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="ProMapping">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="ProMapping" ID="ProMapping" Visible="true" AlternateText="Product Mapping" runat="server"
                                                    ImageUrl="../assets/media/icons/svg/General/Star.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>--%>



                                        <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="200px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Customer" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                        </telerik:GridBoundColumn>



                                        <telerik:GridBoundColumn DataField="IsInvoicing" AllowFiltering="true" HeaderStyle-Width="110px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" Invoicing " FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsInvoicing">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="IsSalesOrder" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Sales Order" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsSalesOrder" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="IsMerchandising" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Merchandising" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsMerchandising" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="IsAR" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" AR" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsAR" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="IsInvoicing_Sales" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" Invoicing Sales" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsInvoicing_Sales" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="IsInvoicing_GR" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Invoicing GR" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsInvoicing_GR" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="IsInvoicing_BR" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Invoicing BR" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsInvoicing_BR" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="IsInvoicing_FG" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Invoicing FG" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsInvoicing_FG" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_TotalCreditLimit" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Total Credit Limit" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_TotalCreditLimit" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_UsedCreditLimit" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Used Credit Limit" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_UsedCreditLimit" Visible="true">
                                        </telerik:GridBoundColumn>


                                        <telerik:GridBoundColumn DataField="rcs_CreditDays" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Credit Days" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_CreditDays" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_VoidEnable" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Void Enable" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_VoidEnable" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_EditEnable" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Edit Enable" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_EditEnable" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_StockEnable" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Stock Enable" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_StockEnable" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_PaymentTerms" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Payment Terms" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_PaymentTerms" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_Signature" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Signature" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_Signature" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_RoundAmount" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Round Amount" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_RoundAmount" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_IsVAT" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" VAT" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_IsVAT" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_IsInvoiceDraft" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Invoice Draft" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_IsInvoiceDraft" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_IsPrintOut" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Print Out" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_IsPrintOut" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_cusType" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Cus Type" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_cusType" Visible="true">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rcs_AvailableCreditLimit" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Available Credit Limit" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_AvailableCreditLimit" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_IsSignatureInvoice" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" Signature Invoice" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsSignatureInvoice" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_IsRemarkInvoice" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" Remark Invoice" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_IsRemarkInvoice" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_IsSignatureAR" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" Signature AR" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_IsSignatureAR" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_IsRemarkAR" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Remark AR" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_IsRemarkAR" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_IsRemarkOrderReq" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" Remark OrderReq" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_IsRemarkOrderReq" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_SelectionType" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Selection Type" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_SelectionType" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_IsHold" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText=" Hold" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_IsHold" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_FencingRadius" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Fencing Radius" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_FencingRadius" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_IsOrderPromo" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Order Promo" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_IsOrderPromo" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_NoOfInvoice" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="No Of Invoice" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_NoOfInvoice" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcs_MandColumns" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Mand Columns" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_MandColumns" Visible="true">
                                        </telerik:GridBoundColumn>
                                        <%-- <telerik:GridBoundColumn DataField="rcs_OnCallFeatures" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="On Call Features" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rcs_OnCallFeatures" Visible="true">
                                        </telerik:GridBoundColumn>--%>
                                    </Columns>
                                </MasterTableView>
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
                        <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                    </div>
                </telerik:RadAjaxLoadingPanel>
            </div>
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
                        <asp:LinkButton ID="lnkAdds" runat="server" Text="Yes" OnClick="lnkAdds_Click" CssClass="btn btn-sm fw-bold btn-primary" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                                        <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(modalConfirm);">Cancel</button>

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
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
