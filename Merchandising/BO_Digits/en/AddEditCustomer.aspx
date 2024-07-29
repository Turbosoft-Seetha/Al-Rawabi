<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditCustomer.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditCustomer" %>
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
                               <asp:LinkButton ID="lnkCancel" runat="server"
                                    Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
                                    CausesValidation="False" OnClick="lnkCancel_Click" />
                                <asp:LinkButton ID="lnkSave" runat="server" ValidationGroup="form" OnClick="lnkSave_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed'
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

     <div class="card-body p-8" style="background-color:white;">
                        <div class="col-lg-12 row">

                            <div class="mb-4" > <b> Basic Info</b></div>


                              <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Code <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtCode" runat="server" CssClass="form-control" RenderMode="Lightweight" Width="100%" OnTextChanged="txtCode_TextChanged" AutoPostBack="true"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtCode" ErrorMessage="Please Enter Code" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    <asp:Label ID="lblCodeDupli" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                            <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Name <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtname" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"  ValidationGroup="form"
                                        ControlToValidate="txtname" ErrorMessage="Please Enter Name" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>
                             <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Arabic Name <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtArabicname" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtArabicname" ErrorMessage="Please Enter Arabic Name" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>
                             <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Short Name <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtshortname" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtshortname" ErrorMessage="Please Enter Short Name" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>
                          
                             <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Parent Company <span class="required"></span></label>
                                <div class="col-lg-12">
                                      <telerik:RadComboBox ID="ddlParent" runat="server" EmptyMessage="Select Parent Company" Width="100%" Filter="Contains" RenderMode="Lightweight"></telerik:RadComboBox>                              
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlParent" ErrorMessage="Please select Company" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>
                              <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Address <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtAddress" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtAddress" ErrorMessage="Please Enter Arabic Name" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>
                              <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Mobile <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtmobile" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtmobile" ErrorMessage="Please Enter Mobile" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>
                             <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Email <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtemail" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtemail" ErrorMessage="Please Enter Email" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>
                            <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">GeoCode <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtgeocode" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtgeocode" ErrorMessage="Please Enter GeoCode" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>
                              <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Recapture GeoCode <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlrecapture" runat="server" Width="100%" RenderMode="Lightweight">
                                        <Items>
                                            <telerik:DropDownListItem Text="Yes" Value="Y" Selected="true" />
                                            <telerik:DropDownListItem Text="No" Value="N" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4 form-group mb-6">
                                <label class="control-label col-lg-12">Status <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlStatus" runat="server" Width="100%" RenderMode="Lightweight">
                                        <Items>
                                            <telerik:DropDownListItem Text="Active" Value="Y" Selected="true" />
                                            <telerik:DropDownListItem Text="Inactive" Value="N" />
                                        </Items>
                                    </telerik:RadDropDownList>
                                </div>
                            </div>


                              <div class="my-4" > <b> Categorization</b></div>

                             <div class="col-lg-4 form-group" >
                                <label class="control-label col-lg-12"> Class <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlclass" runat="server" EmptyMessage="Select Class" Width="100%" RenderMode="Lightweight" Filter="Contains"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlclass" ErrorMessage="Please select Category" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                             <div class="col-lg-4 form-group" >
                                <label class="control-label col-lg-12"> Area <span class="required"></span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlarea" runat="server" EmptyMessage="Select Area" Width="100%" RenderMode="Lightweight" Filter="Contains"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="form"
                                        ControlToValidate="ddlarea" ErrorMessage="Please select Category" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
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
                   <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
