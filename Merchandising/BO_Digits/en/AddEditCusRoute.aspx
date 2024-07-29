<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditCusRoute.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditCusRoute" %>
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

        function Cusroute() {
            var url = new URL(window.location.href);
            var c = url.searchParams.get("RID");
            window.location.href = "ListCustomerRoute.aspx?ID=" + c;
        }

     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
   <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="LinkButton2" Width="100px" runat="server"
                                    Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
                                    CausesValidation="False"  OnClick="LinkButton2_Click" />
                                <asp:LinkButton ID="LinkButton1" Width="100px"
                               runat="server" ValidationGroup="form" OnClick="LinkButton1_Click" UseSubmitBehavior="false" 
                                    Text='<i class="icon-ok"></i>Proceed' CssClass="btn btn-sm fw-bold btn-primary"  CausesValidation="true"/>
                               
                            </telerik:RadAjaxPanel>
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
                    
                   
                      
                            <h3 class="kt-portlet__head-title">Add Edit Customer Route : 
                           
                            <telerik:RadLabel ID="cusroute" runat="server" CssClass="kt-portlet__head-title"></telerik:RadLabel>
                                 </h3>
                       
                       
                   
                    <div class="kt-portlet__body">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                            <telerik:RadComboBox ID="ddlroute" runat="server" EmptyMessage="Select Route" CausesValidation="false" Visible="false" Width="100%" Filter="Contains" OnSelectedIndexChanged="ddlroute_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                ControlToValidate="ddlroute" ErrorMessage="Please Select Route" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            <div class="col-lg-12 row">

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Customer <span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlcus" runat="server" EmptyMessage="Select Customer"  Width="100%"  ></telerik:RadComboBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="form"
                                            ControlToValidate="ddlcus" ErrorMessage="Please Select Customer" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsInvoicing<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlIsInvoicing" runat="server" Width="100%" emptymessage="Please Select" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddlIsInvoicing" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group"style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsAR<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlIsAR" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddlIsAR" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsSalesOrder<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddIsSOrder" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddIsSOrder" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsMerchandising<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddIsMerchand" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddIsMerchand" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsInvoicing_Sales<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddIsI_Sales" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddIsI_Sales" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsInvoicing_GR<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddIsI_GR" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddIsI_GR" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsInvoicing_BR<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddIsI_BR" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddIsI_BR" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsInvoicing_FG<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddIsI_FG" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddIsI_FG" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-6">TotalCreditLimit <span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadNumericTextBox ID="txtTCL" runat="server" CssClass="form-control" Width="100%" Enabled="true" ></telerik:RadNumericTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="txtTCL" ErrorMessage="This field is Empty" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-6">UsedCreditLimit <span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadNumericTextBox ID="txtUCL" runat="server" CssClass="form-control" Width="100%" Enabled="true" ></telerik:RadNumericTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="txtUCL" ErrorMessage="This field is Empty" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-6">CreditDays <span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadNumericTextBox ID="txtCDays" runat="server" NumberFormat-AllowRounding="false" DecimalDigits="0" 
                                        NumberFormat-GroupSeparator="" CssClass="form-control" Width="100%" Enabled="true" ></telerik:RadNumericTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="txtCDays" ErrorMessage="This field is Empty" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </div>


                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">VoidEnable<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddVoidEnable" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddVoidEnable" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">EditEnable<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddEditEnable" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddEditEnable" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">StockEnable<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddSE" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddSE" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">PaymentTerms<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddPT" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddPT" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Signature<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddSign" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddSign" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">RoundAmount<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddRoundAmount" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddRoundAmount" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsVAT<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddIsVAT" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddIsVAT" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsInvoiceDraft<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddIsID" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddIsID" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">IsPrintOut<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddIsPO" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddIsPO" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">CusType<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddcusType" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="CR" Value="CR" />
                                                <telerik:DropDownListItem Text="CS" Value="CS" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddcusType" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">AvailableCreditLimit <span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadNumericTextBox ID="txtACL" runat="server" CssClass="form-control" Width="100%" Enabled="true" ></telerik:RadNumericTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="txtACL" ErrorMessage="This field is Empty" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Signature Invoice<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlSI" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddSign" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Remark Invoice<span class="required"></span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddRe" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddSign" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Signature AR<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddSAR" runat="server" Width="100%" RenderMode="Lightweight">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddSign" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Remark AR<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddRAR" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddSign" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Remark Order Request<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddROQ" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddSign" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Selection Type<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddltype" runat="server" Width="100%" emptymessage="Please Select" RenderMode="Lightweight">
                                            <Items>
                                                <telerik:DropDownListItem Text="Geocode" Value="G" />
                                                <telerik:DropDownListItem Text="Barcode" Value="B" />
                                                <telerik:DropDownListItem Text="Manual" Value="M" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddlIsInvoicing" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Fencing Radius <span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadNumericTextBox MinValue="20" ID="txtradius" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadNumericTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ValidationGroup="form"
                                            ControlToValidate="txtradius" Display="Dynamic" ForeColor="Red" ErrorMessage="This field is Empty"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Is Order Promo<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlordpro" runat="server" Width="100%" RenderMode="Lightweight">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddlordpro" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Is Hold<span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlIsHold" runat="server" Width="100%" RenderMode="Lightweight">
                                            <Items>
                                                <telerik:DropDownListItem Text="Yes" Value="Y" />
                                                <telerik:DropDownListItem Text="No" Value="N" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="ddlIsHold" ErrorMessage="Please select " ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-6">No Of Invoice <span class="required"> </span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadNumericTextBox ID="txtinv" runat="server"             NumberFormat-AllowRounding="false" DecimalDigits="0" 
                                        NumberFormat-GroupSeparator="" CssClass="form-control" Width="100%" Enabled="true" RenderMode="Lightweight"></telerik:RadNumericTextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" Display="Dynamic" ValidationGroup="form"
                                            ControlToValidate="txtinv" ErrorMessage="This field is Empty" ForeColor="Red"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                                <div class="col-lg-4 form-group" style="padding-bottom:10px;">
                                    <label class="control-label col-lg-12">Mand Columns</label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlMandColumns" runat="server" Width="100%" CheckBoxes="true" EnaeckAllItemsCheckBox="true" RenderMode="Lightweight">
                                            <Items>
                                                <telerik:RadComboBoxItem Text="DC" Value="DC" />
                                                <telerik:RadComboBoxItem Text="OOS" Value="OOS" />
                                                <telerik:RadComboBoxItem Text="CA" Value="CA" />
                                                <telerik:RadComboBoxItem Text="CC" Value="CC" />
                                                <telerik:RadComboBoxItem Text="AT" Value="AT" />
                                                <telerik:RadComboBoxItem Text="IA" Value="IA" />
                                                <telerik:RadComboBoxItem Text="IP" Value="IP" />
                                                <telerik:RadComboBoxItem Text="I" Value="I" />
                                                <telerik:RadComboBoxItem Text="S" Value="S" />
                                                <telerik:RadComboBoxItem Text="DA" Value="DA" />
                                                <telerik:RadComboBoxItem Text="T" Value="T" />
                                                <telerik:RadComboBoxItem Text="IC" Value="IC" />

                                            </Items>
                                        </telerik:RadComboBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ValidationGroup="form"
                                            ControlToValidate="ddlMandColumns" ErrorMessage="  Please  select Mand Columns" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />

                                    </div>
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
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(FailureAlert);">Dismiss</button>
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
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">OK</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
