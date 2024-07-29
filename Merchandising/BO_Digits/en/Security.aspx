<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="Security.aspx.cs" Inherits="Merchandising.BO_Digits.en.Security" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="background-color:white; padding:20px;">
     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                   

                    <div class="kt-portlet__body">

                        <asp:UpdatePanel ID="pnlNavigation" runat="server" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td style="vertical-align:top;">
                                            <telerik:RadTreeView ID="treeSecurity" RenderMode="Lightweight" runat="server" OnNodeClick="treeSecurity_NodeClick"
                                                BorderStyle="Solid" BorderWidth="1px" EnableDragAndDrop="false" Font-Size="Medium"
                                                EnableDragAndDropBetweenNodes="false"  Width="500px">
                                            </telerik:RadTreeView>
                                        </td>
                                        <td style="vertical-align:top;">

                                            <telerik:RadAjaxPanel ID="pnlChec" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                 <asp:CheckBoxList ID="chkRoles" runat="server" CssClass="border form-control" style="border-color:#000204 !important" OnSelectedIndexChanged="chkRoles_SelectedIndexChanged" AutoPostBack="True" />
                                            </telerik:RadAjaxPanel>

                                        
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
    </div>

    <style>
        #MainContent_chkRoles label {
            display: inline !important;
            padding-left: 5px;
        }
    </style>
</asp:Content>
