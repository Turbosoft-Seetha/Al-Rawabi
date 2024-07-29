<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Merchandising.Master" AutoEventWireup="true" CodeBehind="Security.aspx.cs" Inherits="Merchandising.Admin.Security" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%--<%@ Register src="../UserControls/ProgressBar.ascx" tagname="ProgressBar" tagprefix="uc2" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <span class="kt-subheader__separator kt-hidden"></span>
                            <div class="kt-subheader__breadcrumbs">
                                <a href="Security.aspx" class="kt-subheader__breadcrumbs">
                                    <i class="flaticon2-shelter"></i> Security </a>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Security
                            </h3>
                        </div>

                    </div>
                    <div class="kt-portlet__body">

                        <asp:UpdatePanel ID="pnlNavigation" runat="server" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td valign="top">
                                            <telerik:RadTreeView ID="treeSecurity" runat="server" OnNodeClick="treeSecurity_NodeClick"
                                                BorderStyle="Solid" BorderWidth="1px" EnableDragAndDrop="True" Font-Size="Medium"
                                                EnableDragAndDropBetweenNodes="false" Height="380px" Width="500px"
                                                OnNodeDrop="radSiteMap_NodeDrop">
                                            </telerik:RadTreeView>
                                        </td>
                                        <td valign="top">
                                            <asp:CheckBoxList ID="chkRoles" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="chkRoles_SelectedIndexChanged" AutoPostBack="True" />
                                        </td>

                                    </tr>

                                </table>

                                <div class="form-actions">
                                    <asp:LinkButton ID="btnSave" runat="server" Text='<i class="icon-ok"></i>Save'
                                        Visible="false" CssClass="btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air m-btn--pill " OnClick="btnSave_Click" />
                                </div>
                                <%--<uc2:ProgressBar ID="ProgressBar1" runat="server" />--%>
                            </ContentTemplate>

                        </asp:UpdatePanel>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <style>
        #MainContent_chkRoles label {
            display: inline !important;
            padding-left: 5px;
        }
    </style>
</asp:Content>


