<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="AddEditProducts.aspx.cs" Inherits="Merchandising.Admin.AddEditProducts" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script>
        function Confim() {
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
        function Confm() {
            $('#modalConfirm1').modal('show');
        }
        function Succces(cd) {
            $('#modalConfirm1').modal('hide');
            $('#kt_modal_1_8').modal('show');
            $('#Success1').text(cd);
        }
        function delConfim() {
            $('#modaldelConfirm').modal('show');

        }
        function succesModal() {
            $('#modaldelConfirm').modal('hide');
            $('#kt_modal_1_7').modal('show');
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <telerik:RadAjaxPanel ID="RadAjaxpanel3" runat="server" LoadingPanelID="LoadingPanel1">

    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <span class="kt-subheader__separator kt-hidden"></span>
                            <div class="kt-subheader__breadcrumbs">
                                <a href="ListProducts.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Products </a>
                                <%--<span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>--%>
                                <span class="kt-subheader__breadcrumbs-separator">></span>
                                <a class="kt-subheader__breadcrumbs-link"> Add Edit Product </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Add Edit Product
                            </h3>
                        </div>
                        <div class="kt-portlet__head-actions" style="padding-top: 10px;">
                            <telerik:RadAjaxPanel ID="pnl" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="lnkSave" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" Text="Save" OnClick="lnkSave_Click" CausesValidation="true" ValidationGroup="form"></asp:LinkButton>
                                &nbsp;
                                    <a class="btn btn-brand btn-elevate btn-icon-sm" href="ListProducts.aspx">Cancel
                                    </a>
                            </telerik:RadAjaxPanel>

                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center">
                                    <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                        </div>
                    </div>
                    <!--begin::Forkt-->

                    <div class="kt-portlet__body">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1"  >

                        <div class="col-lg-12 row">

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Code <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtCode" runat="server" CssClass="form-control" Width="100%" ></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtCode" ErrorMessage="Please Enter Code" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Name <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtName" runat="server" CssClass="form-control" Width="100%" ></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtName" ErrorMessage="Please Enter Name" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                           
                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Category <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlCateory" runat="server" Filter="Contains" RenderMode="Lightweight" AutoPostBack="true" EmptyMessage="Select Category"
                                        Width="100%" OnSelectedIndexChanged="ddlCateory_SelectedIndexChanged">
                                        
                                    </telerik:RadComboBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlCateory" ErrorMessage="Please select Category" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Sub Category <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlSubCat" runat="server" Filter="Contains" RenderMode="Lightweight" EmptyMessage="Select Sub Category" Width="100%">
                                    </telerik:RadComboBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlSubCat" ErrorMessage="Please select SubCategory" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Brand <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlBrand" runat="server" Filter="Contains" RenderMode="Lightweight" EmptyMessage="Select Brand" Width="100%">
                                    </telerik:RadComboBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlBrand" ErrorMessage="Please select Brand" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Status <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlStatus" runat="server" Width="100%" RenderMode="Lightweight">
                                        <Items>
                                            <telerik:DropDownListItem Text="Active" Value="Y" Selected="true" />
                                            <telerik:DropDownListItem Text="Inactive" Value="N" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </div>
                            </div>

                        </div>
                            </telerik:RadAjaxPanel>
                        <!--end::Form-->
                    </div>
                    <!--end::Portlet-->

                 <!--Uom header-->
                        <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title"> Add UOM
                                </h3>
                            </div>
                        </div>
                        <!--End Uom header-->
                     <div class="kt-portlet__body">                      
                        <div class="col-lg-12 row">

                            <div class="col-lg-4 form-group" >
                                <label class="control-label col-lg-12">UOM <span class="required">* </span></label>
                                <div class="col-lg-12">
                                     <telerik:RadComboBox ID="ddlUom" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Uom" RenderMode="Lightweight"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="frm"
                                        ControlToValidate="ddlUom" ErrorMessage="Please choose Uom" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="false"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-lg-4 form-group" >
                                <label class="control-label col-lg-12">Standard Selling Price <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtStdPrice" NumberFormat-DecimalDigits="0" runat="server"  RenderMode="Lightweight"
                                        CssClass="form-control" Width="100%"></telerik:RadNumericTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="frm"
                                        ControlToValidate="txtStdPrice" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Standard Selling Price"
                                        SetFocusOnError="false"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-12">UPC <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtupc" runat="server" CssClass="form-control"  width="100%"></telerik:RadNumericTextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"  RenderMode="Lightweight" Display="Dynamic" ValidationGroup="frm"
                                        ControlToValidate="txtupc" ErrorMessage="Please Enter UPC" ForeColor="Red"
                                        SetFocusOnError="false"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                             <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-12">Return Price <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtrtnPrice" runat="server" CssClass="form-control" width="100%"></telerik:RadNumericTextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  RenderMode="Lightweight" Display="Dynamic" ValidationGroup="frm"
                                        ControlToValidate="txtrtnPrice" ErrorMessage="Please Enter Return Price" ForeColor="Red"
                                        SetFocusOnError="false"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                             <div class="col-lg-4 form-group">
                                  <label class="control-label col-lg-12">Default<span class="required">* </span></label>
                                  <div class="col-lg-12">
                                  <telerik:RadDropDownList ID="ddlDefault" runat="server" Width="100%"  >
                                  <items>
                                  <telerik:DropDownListItem Text="Yes" Value="Y"  />
                                  <telerik:DropDownListItem Text="No" Value="N" />
                                  </items>
                                  </telerik:RadDropDownList>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"  Width="100%" RenderMode="Lightweight" Display="Dynamic" 
                                        ControlToValidate="ddlDefault" ErrorMessage="Please select Default" ForeColor="Red"
                                        SetFocusOnError="false"></asp:RequiredFieldValidator>

                                 </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-top: 20px; padding-bottom: 20px;">
                                <div class="col-lg-12">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel5" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="BtnAdd" Width="100px" runat="server" ValidationGroup="frm" OnClick="BtnAdd_Click"  UseSubmitBehavior="false" Text='<i class="icon-ok"></i> Add'
                                    CssClass="btn btn-brand btn-elevate btn-icon-sm"  CausesValidation="true"/>
                                </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
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
                    <!--Uom Detail header-->
                        <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title"> UOM Detail
                                </h3>
                            </div>
                        </div>
                    <!--End Uom Detail header-->
                    <!--Detail Body-->
                        
                     <div class="kt-portlet__body"> 
                         <div class="col-lg-12 row">

                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                          <%-- <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                           --%> <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
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
                                    ShowFooter="false" DataKeyNames="pum_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                       
                                         <telerik:GridTemplateColumn HeaderStyle-Width="50px" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Delete">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Delete" ID="Delete" Visible="true" AlternateText="Delete" runat="server"
                                                     SetFocusOnError="false"
                                                    ImageUrl="../assets/media/icons/svg/General/Trash.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="uom_Name" AllowFiltering="true" HeaderStyle-Width="130px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="UOM" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="uom_Name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="pum_Price" AllowFiltering="true" HeaderStyle-Width="130px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Standard Selling Price" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="pum_Price">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="pum_upc" AllowFiltering="true" HeaderStyle-Width="130px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="UPC" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="pum_upc">
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="pru_ReturnPrice" AllowFiltering="true" HeaderStyle-Width="130px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Return Price" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="pru_ReturnPrice">
                                        </telerik:GridBoundColumn>
                                       

                                        <telerik:GridBoundColumn DataField="pru_IsDefault" AllowFiltering="true" HeaderStyle-Width="130px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Default" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="pru_IsDefault">
                                        </telerik:GridBoundColumn>
                                       
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








                </div>
            </div>
        </div>
    </div>
    </telerik:RadAjaxPanel>


    <!--begin::ValidationModal-->
    <div class="modal fade" id="kt_modal_1_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to save ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" OnClick="LinkButton1_Click">
                                                    Save
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::ValidationModal-->

    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm1" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel6" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                    <asp:LinkButton ID="BtnConfim" runat="server" Text="Yes" OnClick="BtnConfim_Click" CssClass="btn btn-brand btn-elevate btn-icon-sm" />
                        </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel5" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="reset" data-dismiss="modal" class="btn btn-secondary">
                        Cancel
                    </button>
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
                    <span>Product has been updated successfully.</span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-secondary">Ok</asp:LinkButton>
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailureModal-->

      <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_8" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="Success1"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="Okbtn" runat="server" OnClick="Okbtn_Click" CssClass="btn btn-secondary">OK</asp:LinkButton>
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
                        <asp:LinkButton ID="BtnConfrmDelete" runat="server" Text="Yes" OnClick="BtnConfrmDelete_Click"   CssClass="btn btn-brand btn-elevate btn-icon-sm" />
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
                    <asp:LinkButton ID="Button3" runat="server" OnClick="Button3_Click" CssClass="btn btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

</asp:Content>
