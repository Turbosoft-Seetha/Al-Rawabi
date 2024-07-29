<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditCustomerTasks.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditCustomerTasks" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script>
        function Confim() {

            $('#modalConfirm').modal('show');
        }
        function Succcess(ab) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#Success').text(ab);
        }
        function FailureAlert(res) {
            $('#FailureAlert').modal('show');
            $('#failres').text(res);
            x++;
        }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
      <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                
                                    <a class="btn btn-sm fw-bold btn-secondary" href="ListCustomerTasks.aspx">Cancel
                                    </a>  &nbsp;
            <asp:LinkButton ID="lnkSave" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Proceed" OnClick="lnkSave_Click" CausesValidation="true" ValidationGroup="form"></asp:LinkButton>
                            
                            </telerik:RadAjaxPanel>

                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                                BackColor="Transparent"
                                ForeColor="Blue">
                                <div class="col-lg-12 text-center">
                                    <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="card-body p-8" style="background-color:white;"> 

     <div class="col-lg-12 row">



                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Route<span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlRoute" runat="server" Width="100%" Filter="Contains" OnSelectedIndexChanged="ddlRoute_SelectedIndexChanged" AutoPostBack="true" Visible="true" EmptyMessage="Select Route" RenderMode="Lightweight"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlRoute" ErrorMessage="Please Select Route" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Customer<span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlCus" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Customer" RenderMode="Lightweight"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlCus" ErrorMessage="Please Select Customer" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Brand<span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlbrd" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Brand" RenderMode="Lightweight"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlbrd" ErrorMessage="Please Select Brand" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Task Name<span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txttask" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                        ControlToValidate="txttask" ErrorMessage="Please Enter task Name" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Due Date <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <%--<telerik:RadTextBox ID="txtdate" runat="server" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtdate" ErrorMessage="Please Enter Mobile" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    --%>
                                    <telerik:RadDatePicker RenderMode="Lightweight" ID="date" runat="server" Width="100%">
                                        <DateInput DateFormat="dd/MM/yyyy" runat="server" DisplayDateFormat="dd/MM/yyyy" />
                                    </telerik:RadDatePicker>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                        ControlToValidate="date" ErrorMessage="Please Select Date" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>
                            </div>



                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Description<span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtDesc" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtDesc" ErrorMessage="Please Enter Description" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Remarks<span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtremarks" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtremarks" ErrorMessage="Please Enter Remarks" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Status <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlStatus" runat="server" Width="100%" RenderMode="Lightweight">
                                        <Items>
                                            <telerik:DropDownListItem Text="Active" Value="P" Selected="true" />
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
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-sm fw-bold btn-primary" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
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
                    <span id="Success"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="FailureAlert" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Failure</h5>
                </div>
                <div class="modal-body">
                    <span style="color: red"><strong></strong>&nbsp;&nbsp; <span id="failres"></span></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal();">Ok</button>
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
                    <span id="fail"></span>
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
