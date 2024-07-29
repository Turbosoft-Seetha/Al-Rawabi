<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditSpecialPrice.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditSpecialPrice" %>

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

        <asp:LinkButton ID="ButtonCancel" runat="server" Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
            CausesValidation="False" OnClick="ButtonCancel_Click" />

        <asp:LinkButton ID="ButtonSave" runat="server" ValidationGroup="form" OnClick="ButtonSave_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed'
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
        <div class="col-lg-12 row">

            <asp:PlaceHolder runat="server" ID="divcode">

                <div class="col-lg-4 form-group">
                    <label class="control-label col-lg-12">Code</label>
                    <div class="col-lg-12">
                        <telerik:RadTextBox ID="txtcode" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight" Enabled="false"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            ControlToValidate="txtcode" ErrorMessage="Please Enter Code" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                    </div>
                </div>
            </asp:PlaceHolder>

            <div class="col-lg-4 form-group">
                <label class="control-label col-lg-12">Name</label>
                <div class="col-lg-12">
                    <telerik:RadTextBox ID="txtname" runat="server" CssClass="form-control" RenderMode="Lightweight" Width="100%"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                        ControlToValidate="txtname" ErrorMessage="Please Enter Name" ForeColor="Red" Display="Dynamic"
                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                </div>
            </div>


            <div class="col-lg-4 form-group">
                <label class="control-label col-lg-12">Status</label>
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
                        <asp:LinkButton ID="confrmsave" runat="server" Text="Yes" OnClick="confrmsave_Click" CssClass="btn btn-sm fw-bold btn-primary" />
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
