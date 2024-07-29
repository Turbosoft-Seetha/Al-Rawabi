<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="CustomerOperationsAssignment.aspx.cs" Inherits="Merchandising.BO_Digits.en.CustomerOperationsAssignment" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

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
                     <h3 class="kt-portlet__head-title">
                            <asp:Literal ID="ltrlOperatiion" runat="server"></asp:Literal> Operation Assignment
                            </h3>
                     <div class="col-lg-12 row">
                        <div class="col-lg-6" >

                    <div class="kt-portlet">

                                  <div class="col-lg-12 row" style="padding-top: 20px; padding-bottom: 20px;">
                                <div class="col-lg-12">
                            <h3 class="kt-portlet__head-title">Unassigned Customers
                            </h3>
                        </div>
                        
                    </div>

                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body">
                            <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

                            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                ID="grvRpt" GridLines="None"
                                ShowFooter="True" AllowSorting="True"
                                OnNeedDataSource="grvRpt_NeedDataSource"
                                OnItemCommand="grvRpt_ItemCommand"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="50" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="cus_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Add" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                        <ItemTemplate>
                                                            <asp:ImageButton CommandName="Add" ID="RadImageButton1" Visible="true" AlternateText="Add" runat="server"
                                                                ImageUrl="../assets/media/icons/File-plus.svg"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                    </Columns>
                                </MasterTableView>
                                <GroupingSettings CaseSensitive="false" />
                                <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                    <Resizing AllowColumnResize="true"></Resizing>
                                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-6" >
                            <!--begin::Portlet-->
                            <div class="kt-portlet">
                                <div class="col-lg-12 row" style="padding-top: 20px; padding-bottom: 20px;">
                                <div class="col-lg-12">
                            <h3 class="kt-portlet__head-title">Assigned Customers
                            </h3>
                        </div>
                        
                    </div>

                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>

                            
                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                ID="RadGrid1" GridLines="None"
                                ShowFooter="True" AllowSorting="True"
                                OnNeedDataSource="RadGrid1_NeedDataSource"
                                OnItemCommand="RadGrid1_ItemCommand"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="50" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="rcs_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Remove" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                        <ItemTemplate>
                                                            <asp:ImageButton CommandName="Remove" ID="RadImageButton2" Visible="true" AlternateText="Remove" runat="server"
                                                                ImageUrl="../assets/media/icons/File-minus.svg"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                    </Columns>
                                </MasterTableView>
                                <GroupingSettings CaseSensitive="false" />
                                <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                    <Resizing AllowColumnResize="true"></Resizing>
                                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>
                        </div>
                    </div>

                </div>
            </div>
                         </div>
                    </div>
                </div>
        </div>
    </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
