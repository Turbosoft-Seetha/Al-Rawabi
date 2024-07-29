<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditSpecialPriceDetail.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditSpecialPriceDetail" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function Succcess(a) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#success').text(a);
        }
        function Failure() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_5').modal('show');
        }
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <asp:LinkButton ID="ButtonCancel" runat="server"
            Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
            CausesValidation="False" OnClick="ButtonCancel_Click" />
        <asp:LinkButton ID="ButtonSave" runat="server" ValidationGroup="form" OnClick="ButtonSave_Click"
            UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed'
            CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" />
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
    <div class="card-body p-8" style="background-color: white;">
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
            <div class="col-lg-12 row">


                <div class="col-lg-4 form-group">
                    <label class="control-label col-lg-12">Product Name <span class="required"></span></label>
                    <div class="col-lg-12">
                        <telerik:RadComboBox ID="ddlp" runat="server" EmptyMessage="Select Product Name" OnSelectedIndexChanged="ddlp_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false" Width="100%" RenderMode="Lightweight" Filter="Contains"></telerik:RadComboBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="ddlp" ErrorMessage="Please select Product Name" ForeColor="Red" Display="Dynamic" ValidationGroup="form"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                    </div>
                </div>

                <div class="col-lg-4 form-group">
                    <label class="control-label col-lg-12">UOM <span class="required"></span></label>
                    <div class="col-lg-12">
                        <telerik:RadComboBox ID="ddlUom" runat="server" Width="100%" EmptyMessage="Select Uom" Filter="Contains" RenderMode="Lightweight"></telerik:RadComboBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="frm"
                            ControlToValidate="ddlUom" ErrorMessage="Please choose Uom" Display="Dynamic" ForeColor="Red"
                            SetFocusOnError="false"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="col-lg-4 form-group">
                    <label class="control-label col-lg-12">Price <span class="required"></span></label>
                    <div class="col-lg-12">
                        <telerik:RadNumericTextBox ID="txtprice" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadNumericTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="txtprice" ErrorMessage="Please Enter   price" ForeColor="Red" Display="Dynamic" ValidationGroup="form"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                    </div>
                </div>

                <div class="col-lg-4 form-group">
                    <label class="control-label col-lg-12">VATPerc <span class="required"></span></label>
                    <div class="col-lg-12">
                        <telerik:RadNumericTextBox ID="txtvat" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadNumericTextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="txtvat" ErrorMessage="Please Enter VAT Percentage" ForeColor="Red" Display="Dynamic" ValidationGroup="form"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                    </div>
                </div>
                <div class="col-lg-4 form-group">
                    <label class="control-label col-lg-12">Status <span class="required"></span></label>
                    <div class="col-lg-12">
                        <telerik:RadDropDownList ID="ddlstatus" runat="server" Width="100%" RenderMode="Lightweight">
                            <Items>
                                <telerik:DropDownListItem Text="Active" Value="Y" Selected="true" />
                                <telerik:DropDownListItem Text="Inactive" Value="N" />
                            </Items>
                        </telerik:RadDropDownList>
                    </div>
                </div>



            </div>
        </telerik:RadAjaxPanel>

        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
            BackColor="Transparent"
            ForeColor="Blue">
            <div class="col-lg-12 text-center mt-5">
                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
            </div>
        </telerik:RadAjaxLoadingPanel>

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
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="Confrmsave" runat="server" Text="Yes" OnClick="Confrmsave_Click" CssClass="btn btn-sm fw-bold btn-primary" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
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
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="success"></span>
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
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal();">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
