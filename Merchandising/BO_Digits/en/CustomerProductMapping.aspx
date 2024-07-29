<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="CustomerProductMapping.aspx.cs" Inherits="Merchandising.BO_Digits.en.CustomerProductMapping" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
      <script type="text/javascript">
     
        function Confim() {
            $('#kt_modal_1_3').modal('show');
        }
        function successModal() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_4').modal('show');
        }
        function failedModal(res) {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_5').modal('show');
            $('#failres').text(res);
        }
        //function Delete() {
        //    $('#kt_modal_1_7').modal('show');
        //}
        //function deleteSucces() {
        //    $('#kt_modal_1_7').modal('hide');
        //    $('#kt_modal_1_8').modal('show');
        //}
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">

    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
     <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-sm fw-bold btn-secondary" CausesValidation="false" OnClick="LinkButton3_Click">
                                                    Cancel
                                    </asp:LinkButton>  
         </telerik:RadAjaxPanel>

                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body p-8" style="background-color:white;"> 
        <div class="kt-portlet__body pb-0 mb-6">
                        <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server">
                                <Items>
                                    <telerik:RadPanelItem Font-Bold="true" Expanded="true" BackColor="#F2F6F9">

                                        <ContentTemplate>
                                            <div class="kt-portlet__body" style="background-color: #F9FAFC; display: grid">
                                                <table>
                                                    <td style="width: 56%">
                                                        <div class="col-lg-6 my-2 ps-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;"></label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="custname" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        </td>
                                                    <td>
                                                        <div class="col-lg-6 my-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;"></label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="Progrp" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>

                                                    </td>
                                                    
                                                </table>


                                            </div>

                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
                     </div>

          <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1"  >
                                <div class="col-lg-12 row mb-8">
                                    <div class="col-lg-4 form-group">
                                     <label  class="control-label">Change Product Group <span class="required"> </span></label>
                                        <div class="col-lg-12">
                                        <telerik:RadDropDownList Skin="Material" Filter="Contains" CloseDropDownOnBlur="true"   RenderMode="Lightweight" OnSelectedIndexChanged="rdPromapping_SelectedIndexChanged"  AutoPostBack="true"
                                                    ID="rdPromapping" runat="server" 
                                                    EmptyMessage="Select Product Group" Width="80%">
                                    </telerik:RadDropDownList>
                                        </div>
                                    </div>

                                  
                                        <div class="col-lg-4 pt-4">
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="false" OnClientClick="Confim();">
                                                    Change Mapping
                                            </asp:LinkButton>
                                        </div>
                                        
                                      
                                       
                                    </div>
                               
                          
                              
                                    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                               <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
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
                                    ShowFooter="false"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                       
                                        <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Product Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="itm_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Product" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="itm_Name">
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
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Subcategory Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="sub_Code">
                                        </telerik:GridBoundColumn>



                                        <telerik:GridBoundColumn DataField="sct_Name" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Subcategory" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="sub_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                        </telerik:GridBoundColumn>
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

       <!--begin::ValidationModal-->
    <div class="modal fade" id="kt_modal_1_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to save ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <asp:LinkButton ID="BtncnfrmSave" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="BtncnfrmSave_Click">
                                                    Save
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
                    <span>Product Group has been updated successfully.</span>
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
                    <span id="failres"></span>
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
