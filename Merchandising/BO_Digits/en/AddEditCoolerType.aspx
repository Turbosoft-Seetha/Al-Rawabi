﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditCoolerType.aspx.cs" Inherits="Merchandising.BO_Digits.en.AddEditCoolerType" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script>
        function Confim() {
            $('#kt_modal_1_3').modal('show');
        }
        function successModal(a) {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#success').text(a);
        }
        function failedModal() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_5').modal('show');
         }
         function failModal() {
             $('#kt_modal_1_3').modal('hide');
             $('#kt_modal').modal('show');
         }

         function existModal() {
             $('#kt_modal_1_6').modal('show');
         }
         function OnClientValidationFailed(sender, args) {
             var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
             if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                 if (sender.get_allowedFileExtensions().indexOf(fileExtention) == -1) {
                     alert("File extension is wrong, Please choose mentioned file format !!");
                 }
                 else {
                     //alert(sender.get_allowedFileExtensions().indexOf(fileExtention));
                     alert("File too big to upload, Kindly choose the file with approriate size !!");
                 }
             }
             else {
                 alert("File extension is wrong, Please choose mentioned file format !!");
             }
         }

         function toProperCase(s) {
             return s.toLowerCase().replace(/^(.)|\s(.)/g,
                 function ($1) { return $1.toUpperCase(); });
         }
         function OnClientFileUploadRemoved1(sender, args) {
             $telerik.$("#img1").attr('src', "http://ctt.trains.com/sitefiles/images/no-preview-available.png");
         }

         function OnClientFileSelected1(sender, args) {
             var file = args.get_file();
             var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);

             if (file && fileExtention != 'pdf') {
                 // https://stackoverflow.com/a/4459419
                 var reader = new FileReader();
                 reader.onload = function (e) {

                     $telerik.$("#img1").attr('src', e.target.result);
                 }

                 reader.readAsDataURL(file);
             } else {
                 $telerik.$("#img1").attr('src', '../assets/media/svg/files/Folder-cloud.svg');
             }
         }

     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
       <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="btnCancel" Width="100px" runat="server"
                                    Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
                                    CausesValidation="False"  OnClick="btnCancel_Click" />
                                <asp:LinkButton ID="lnkSave" Width="100px"
                               runat="server" ValidationGroup="form" OnClick="lnkSave_Click" UseSubmitBehavior="false" 
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

     <script>
         function OnClientFileUploadRemoved1(sender, args) {
             $telerik.$("#img1").attr('src', "http://ctt.trains.com/sitefiles/images/no-preview-available.png");
         }

         function OnClientFileSelected1(sender, args) {
             var file = args.get_file();
             var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);

             if (file && fileExtention != 'pdf') {
                 // https://stackoverflow.com/a/4459419
                 var reader = new FileReader();
                 reader.onload = function (e) {

                     $telerik.$("#img1").attr('src', e.target.result);
                 }

                 reader.readAsDataURL(file);
             } else {
                 $telerik.$("#img1").attr('src', '../assets/media/svg/files/Folder-cloud.svg');
             }
         }

     </script>
    <script>
        // https://www.telerik.com/support/kb/aspnet-ajax/upload-(async)/details/access-selected-file-in-the-arguments-of-onclientfileselected-event-of-asyncupload
        Telerik.Web.UI.RadAsyncUpload.prototype._onFileSelected = function (row, fileInput, fileName, shouldAddNewInput, file) {
            var args = {
                row: row,
                fileInputField: fileInput,
                file: file
            };
            args.rowIndex = $telerik.$(row).index();
            args.fileName = fileName;
            this._selectedFilesCount++;
            shouldAddNewInput = shouldAddNewInput &&
                (this.get_maxFileCount() == 0 || this._selectedFilesCount < this.get_maxFileCount());
            this._marshalUpload(row, fileName, shouldAddNewInput);
            var labels = $telerik.$("label", row);
            if (labels.length > 0)
                labels.remove();
            $telerik.$.raiseControlEvent(this, "fileSelected", args);
        }
    </script>

    <div class="card-body" style="background-color:white; padding:20px;">
     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                
                    <!--begin::Forkt-->

                    <div class="kt-portlet__body">
                        <div class="col-lg-12 row">

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
                                <label class="control-label col-lg-12">Name <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtName" runat="server" CssClass="form-control" Width="100%" RenderMode="Lightweight"></telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="form"
                                        ControlToValidate="txtName" ErrorMessage="Please Enter Name" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                           

                            <div class="col-lg-4 form-group" style="padding-bottom: 15px;">
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




                             <div class="col-lg-4">
                                    <label class="control-label col-lg-12">Planogram<span class="required"> </span></label>
                                    <asp:HiddenField ID="txt1" runat="server" Value="Overall claim picture" />
                                    <label style="color: #464646; font-size: smaller; margin-left:11px;">Only .jpeg / jpg files are allowed with maximum size 6MB</label>
                                    <br />
                                    <div class="col-lg-12 row" style="margin-left:5px;">
                                        <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" MaxFileInputsCount="1"
                                            ID="upd1" AllowedFileExtensions=".jpeg,.jpg,.JPEG,.JPG" MultipleFileSelection="Disabled" MaxFileSize="6242880"
                                            UploadedFilesRendering="BelowFileInput" HideFileInput="true" Width="100px" Skin="Silk" OnClientValidationFailed="OnClientValidationFailed"
                                            OnClientFileUploadRemoved="OnClientFileUploadRemoved1" OnClientFileSelected="OnClientFileSelected1" 
                                            Style="padding: 10px; text-align: center; padding-bottom: 10px;" >
                                            <Localization Select="Browse Image" />
                                            <FileFilters>
                                                <telerik:FileFilter Description="" Extensions=".jpeg,.jpg,.JPEG,.JPG" />
                                            </FileFilters>
                                        </telerik:RadAsyncUpload>
                                        <div class="col-lg-12 mt-2">
                                            <asp:HiddenField ID="hlval1" runat="server" />
                                            <asp:HyperLink ID="hpl1" runat="server" Target="_blank">
                                                <asp:Image ID="img1" runat="server" Style="margin-top: 10px" ImageUrl="../assets/media/icons/File-cloud.svg" Height="70px" />
                                            </asp:HyperLink>
                                        </div>
                                        <%--<i class="fas fa-upload " style="color: black; height: 10px; padding-top: 15px; margin-left: 30px; margin-top: 1px"></i>--%>
                                        <%--</asp:LinkButton>--%>
                                    </div>

                                    <%--<img src="http://ctt.trains.com/sitefiles/images/no-preview-available.png" id="img1" height="100" width="100" style="margin-top: 10px" alt="Preview image here" />--%>
                                </div>

                        </div>

                        <!--end::Form-->
                    </div>
                    <!--end::Portlet-->

                </div>
            </div>
        </div>
    </div>
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
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="LinkButton1_Click">
                                                    Save
                        </asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
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
                     <span id="success"></span>
                  
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

    
     <div class="modal fade" id="kt_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span>File missing..please upload file</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal);">Ok</button>
                </div>
            </div>
        </div>
    </div>


    <!--begin::ExistModal-->
    <div class="modal fade" id="kt_modal_1_6" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span>Category code already exist. Please try again with new code.</span>
                </div>
                <div class="modal-footer">
                   <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_6);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::ExistModal-->

    <style>
        .RadUpload_Silk .ruButton {
            padding-bottom: 0px !important;
            color: black !important;
            width: 122px !important;
            background: transparent !important;
            background-color: transparent !important;
            margin-left: 0px !important;
            padding-top:0px;
        }


        .RadUpload .ruFileWrap.ruStyled {
            display: grid;
            width: 126px !important;
        }

      
        /*.RadUpload .ruUploadProgress {
            display: contents;
        }
        .RadUpload .radIcon {
            visibility: hidden;
        }*/

        /*div.RadUpload .ruRemove
            {
            
                background-image: url('assets/media/icons/svg/Files/Deleted-file.svg') !important;
                background-position: -2px 0px;
                width: 50px;
                height: 14px;
            }*/

        #preview-image {
            max-height: 300px;
            max-width: 300px;
        }
    </style>
    <!--end::FailureModal-->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>