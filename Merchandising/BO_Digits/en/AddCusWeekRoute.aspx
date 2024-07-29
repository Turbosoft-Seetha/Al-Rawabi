<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddCusWeekRoute.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddCusWeekRoute" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script>
        function OpenModal() {
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

        function redirect() {
            var url = new URL(window.location.href);
            var c = url.searchParams.get("Id");
            window.location.href = "CustomerWeekRoute.aspx?Id=" + c;    
        }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="background-color:white; padding:20px;">

     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        
            <div class="row">
                <div class="col-lg-12">
                    <div class="kt-portlet">
                      
                        <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">
                                    
                                    Route Customers - Weekly Plan
                                </h3>
                          
                           
                                <h5 class="kt-portlet__head-title">
                            <asp:Literal ID="ltrlRoute" runat="server"></asp:Literal>
                                </h5>
                            </div>
                        </div>

                         <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">

                             <div class="col-lg-12 row">

                                   <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Route <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtRoute" Width="100%" runat="server" Enabled="false"  ></telerik:RadTextBox>
                                </div>
                            </div>

                                   <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Customer <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtCustomer" Width="100%" runat="server" Enabled="false"  ></telerik:RadTextBox>
                                </div>
                            </div>

                                    <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Week Sequence <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtWeekSeq" runat="server" Enabled="false"  ></telerik:RadTextBox>
                                </div>
                            </div>
                             </div>

                             </div>


                        <div class="col-lg-12 row">
                        <div class="col-lg-2" style=" border-color:#dcdcdc38 ; border-style:groove; border-width:1px">
                              <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Saturday <span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadComboBox ID="rdSaturday" Width="100%" EmptyMessage="Select" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Yes" Value="1" />
                                        <telerik:RadComboBoxItem Text="No" Value="0" />
                                    </Items>
                                </telerik:RadComboBox>
                            </div>
                        </div>

                        <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Sat Seq <span class="required"></span></label>
                            <div class="col-lg-12">
                                   <telerik:RadNumericTextBox ID="rdsatseq" NumberFormat-DecimalDigits="0" runat="server" CssClass="form-control" width="100%" Enabled="true"></telerik:RadNumericTextBox>

                            </div>
                        </div>

                        </div>
                      <div class="col-lg-2" style=" border-color:#dcdcdc38 ; border-style:groove; border-width:1px">
                        <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Sunday <span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadComboBox ID="rdSunday" Width="100%" EmptyMessage="Select" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Yes" Value="1" />
                                        <telerik:RadComboBoxItem Text="No" Value="0" />
                                    </Items>
                                </telerik:RadComboBox>
                            </div>
                        </div>

                        <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Sun Seq<span class="required"></span></label>
                            <div class="col-lg-12">
                                 
                                <telerik:RadNumericTextBox ID="rdsunseq" NumberFormat-DecimalDigits="0" runat="server" CssClass="form-control" width="100%" Enabled="true"></telerik:RadNumericTextBox>
                            </div>
                        </div>

                          </div>
                        <div class="col-lg-2" style=" border-color:#dcdcdc38 ; border-style:groove; border-width:1px">
                        <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Monday <span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadComboBox ID="rdMonday" Width="100%" EmptyMessage="Select" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Yes" Value="1" />
                                        <telerik:RadComboBoxItem Text="No" Value="0" />
                                    </Items>
                                </telerik:RadComboBox>

                            </div>
                        </div>

                         <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Mon Seq <span class="required"></span></label>
                            <div class="col-lg-12">
                              
                                <telerik:RadNumericTextBox ID="rdmonseq" NumberFormat-DecimalDigits="0" runat="server" CssClass="form-control" width="100%" Enabled="true"></telerik:RadNumericTextBox>
                            </div>
                        </div>
                            </div>

                        <div class="col-lg-2" style=" border-color:#dcdcdc38 ; border-style:groove; border-width:1px">
                        <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Tuesday <span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadComboBox ID="rdTuesday" Width="100%" EmptyMessage="Select" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Yes" Value="1" />
                                        <telerik:RadComboBoxItem Text="No" Value="0" />
                                    </Items>
                                </telerik:RadComboBox>
                            </div>
                        </div>

                         <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Tue Seq <span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadNumericTextBox ID="rdtueseq" NumberFormat-DecimalDigits="0" runat="server" CssClass="form-control" width="100%" Enabled="true"></telerik:RadNumericTextBox>
                            </div>
                        </div>
                            </div>

                        <div class="col-lg-2" style=" border-color:#dcdcdc38 ; border-style:groove; border-width:1px">
                        <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Wednesday <span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadComboBox ID="rdWednesday"  Width="100%" EmptyMessage="Select" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Yes" Value="1" />
                                        <telerik:RadComboBoxItem Text="No" Value="0" />
                                    </Items>
                                </telerik:RadComboBox>
                            </div>
                        </div>

                         <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Wed Seq <span class="required"></span></label>
                            <div class="col-lg-12">
                                
                                <telerik:RadNumericTextBox ID="rdwedseq" NumberFormat-DecimalDigits="0" runat="server" CssClass="form-control" width="100%" Enabled="true"></telerik:RadNumericTextBox>
                            </div>
                        </div>
                            </div>

                        <div class="col-lg-2" style=" border-color:#dcdcdc38 ; border-style:groove; border-width:1px">
                        <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Thursday <span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadComboBox ID="rdThursday" Width="100%" EmptyMessage="Select" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Yes" Value="1" />
                                        <telerik:RadComboBoxItem Text="No" Value="0" />
                                    </Items>
                                </telerik:RadComboBox>
                            </div>
                        </div>

                         <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Thu Seq<span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadNumericTextBox ID="rdthuseq" NumberFormat-DecimalDigits="0" runat="server" CssClass="form-control" width="100%" Enabled="true"></telerik:RadNumericTextBox>
                            </div>
                        </div>

                            </div>
                        <div class="col-lg-2" style=" border-color:#dcdcdc38 ; border-style:groove; border-width:1px">
                        <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Friday <span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadComboBox ID="rdFriday" Width="100%" EmptyMessage="Select" runat="server">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="Yes" Value="1" />
                                        <telerik:RadComboBoxItem Text="No" Value="0" />
                                    </Items>
                                </telerik:RadComboBox>
                            </div>
                        </div>

                         <div class="col-lg-12 form-group" style="padding-bottom: 15px;">
                            <label class="control-label col-lg-12">Fri Seq<span class="required"></span></label>
                            <div class="col-lg-12">
                                <telerik:RadNumericTextBox ID="rdfriseq" NumberFormat-DecimalDigits="0" runat="server" CssClass="form-control" width="100%" Enabled="true"></telerik:RadNumericTextBox>
                            </div>
                        </div>
                            </div>
                    </div>


                           <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">

                               <telerik:RadAjaxPanel ID="pnl" runat="server">
                                     <div class="col-lg-12">
                            
                                <asp:LinkButton ID="btnCancel" Width="100px" runat="server"
                                    Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
                                    CausesValidation="False"  OnClick="btnCancel_Click" />
                                <asp:LinkButton ID="lnkSave" Width="100px"
                               runat="server" ValidationGroup="form" OnClick="lnkSave_Click" UseSubmitBehavior="false" 
                                    Text='<i class="icon-ok"></i>Proceed' CssClass="btn btn-sm fw-bold btn-primary"  CausesValidation="true"/>
                                </div>
                               </div>
                               </telerik:RadAjaxPanel>
                           
                      
                    </div>
                </div>
                </div>
              </div>
        </div>


     <div class="modal fade" id="kt_modal_1_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure you want to save ?</h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                        <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="btnSave_Click">
                                                    Save
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/icons/loader.giff" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                     <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_3);">Cancel</button>
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
                    <span>Route has been updated.</span>
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
                    <span>Something went wrong, please try again later.</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">OK</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
