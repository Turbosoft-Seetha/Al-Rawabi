<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditProductMappingGroup.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditProductMappingGroup" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script type="text/javascript">
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
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

                                <asp:LinkButton ID="LinkButton2"  runat="server"
                                    Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
                                    CausesValidation="False" OnClick="LinkButton2_Click" />
      <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="form" OnClick="LinkButton1_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed'
                                    CssClass="btn btn-sm fw-bold btn-primary"  CausesValidation="true"/>
         </telerik:RadAjaxPanel>

                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="card-body p-8" style="background-color:white;"> 
     <div class="col-lg-12 row">
                           <div class="col-lg-4 form-group">

                                <label class="control-label col-lg-12">Code <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtCode" runat="server" CssClass="form-control" RenderMode="Lightweight" width="100%" OnTextChanged="txtCode_TextChanged" AutoPostBack="true"></telerik:RadTextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ValidationGroup="form"
                                        ControlToValidate="txtCode" ErrorMessage="Please Enter Code" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    <asp:Label ID="lblCodeDupli" runat="server" Visible="false" ForeColor="Red"></asp:Label>

                                </div>
                            </div>

                            <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-6">Name <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtName" runat="server" RenderMode="Lightweight" CssClass="form-control" width="100%"></telerik:RadTextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ValidationGroup="form"
                                        ControlToValidate="txtName" ErrorMessage="Please Enter Name" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                           
                           
                            <div class="col-lg-4 form-group">
                                  <label class="control-label col-lg-12">Status<span class="required"> </span></label>
                                  <div class="col-lg-12">
                                  <telerik:RadDropDownList ID="ddlStat" runat="server" RenderMode="Lightweight" Width="100%"  >
                                  <items>
                                  <telerik:DropDownListItem Text="Active" Value="Y"  />
                                  <telerik:DropDownListItem Text="Inactive" Value="N" />
                                  </items>
                                  </telerik:RadDropDownList>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ValidationGroup="form"
                                        ControlToValidate="ddlStat" ErrorMessage="Please select Status" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
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
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
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
                   <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
