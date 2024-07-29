<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditCusRouteProducts.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditCusRouteProducts" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script type="text/javascript">
        function cusroute() {
            var url = new URL(window.location.href);
            var c = url.searchParams.get("Id");
            var R = url.searchParams.get("RID");
            window.location.href = "ListCustomerRoute.aspx?Id=" + R;
        }
        function cusproduct() {
            var url = new URL(window.location.href);
            var S = url.searchParams.get("ID");
            var P = url.searchParams.get("RID");
            window.location.href = "ListCusRouteProducts.aspx?CID=" + S + "&RID=" + P;
        }
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function Succcess(ab) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#Success').text(ab);
        }
        function Failure() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_5').modal('show');
        }
     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="btnCancel" Width="100px" runat="server"
                                    Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
                                    CausesValidation="False"  OnClick="btnCancel_Click" />
                                <asp:LinkButton ID="lnkSave" Width="100px"
                               runat="server" ValidationGroup="form" OnClick="lnkSave_Click" UseSubmitBehavior="false" 
                                    Text='<i class="icon-ok"></i>Proceed' CssClass="btn btn-sm fw-bold btn-primary"  CausesValidation="true"/>
                               
                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
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
                    
                    
                            <div class="kt-portlet__head-title" style="border-bottom-style:inset;">
                           
                           <telerik:RadLabel id="Proroute" runat="server" CssClass="kt-portlet__head-title"></telerik:RadLabel>
                                 /
                                <telerik:RadLabel ID="Cusname" runat="server" CssClass="kt-portlet__head-title"></telerik:RadLabel>
 </div>
                      
                       
                   
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                    <div class="kt-portlet__body">

                        <label class="control-label"></label>
                        <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
                        <div class="col-lg-12 row" style="padding-top:10px;">
                            
                           
                            <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-12">Price List Header <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlprh" runat="server" EmptyMessage="Select Price List Header" CausesValidation="false" Width="100%" Filter="Contains" OnSelectedIndexChanged="ddlprh_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlprh" ErrorMessage="Please Select Category" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                             
                            <div class="col-lg-4" >
                                        <div class="col-lg-12">
                                            <label class="control-label col-lg-12 pl-0">Start Date </label>
                                        </div>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker ID="rdFromData" DateInput-DateFormat="yyyy-MM-dd" runat="server"
                                                Width="100%"></telerik:RadDatePicker>
                                        </div>
                                    </div>
                                 <div class="col-lg-4" ">
                                        <div class="col-lg-12">
                                            <label class="control-label col-lg-12 pl-0">End Date </label>
                                        </div>
                                        <div class="col-lg-12" style="padding-left:1rem;">
                                            <telerik:RadDatePicker ID="rdEndDate" runat="server" DateInput-DateFormat="yyyy-MM-dd" Width="100%" ></telerik:RadDatePicker>
                                            <asp:CompareValidator ID="cmp" runat="server" ControlToCompare="rdFromData" ControlToValidate="rdEndDate" Operator="GreaterThanEqual"
                                                ErrorMessage="To data must be greater" Display="Dynamic" ForeColor="Red"
                                                ></asp:CompareValidator>
                                        </div>
                                    </div>

                        </div>

                    </div>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
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
    
    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                    <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-sm fw-bold btn-primary" />
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
                    <span id="Success"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary" >OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

    <!--begin::FailedModal-->
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
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">OK</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
