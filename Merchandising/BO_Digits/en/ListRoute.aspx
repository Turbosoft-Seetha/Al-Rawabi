<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListRoute.aspx.cs" Inherits="Merchandising.BO_Digits.en.ListRoute" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
      <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                                                    <asp:LinkButton ID="lnkCusReassign" runat="server" Text="Re-assignment" CssClass="btn btn-sm btn-light-primary me-2 border-1"  BackColor="white"  CausesValidation="false" OnClick="lnkCusReassign_Click">
                                                        </asp:LinkButton>

                                          <asp:LinkButton ID="lnkSettings" runat="server" Text="Settings" CssClass="btn btn-sm btn-light-primary me-2 border-1"  CausesValidation="false" OnClick="lnkSettings_Click">
</asp:LinkButton>
 <asp:LinkButton ID="lnkAddUser" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Add" OnClick="lnkAddUser_Click" ></asp:LinkButton>
             </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
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
                                AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="rot_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                        <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="20px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                        </telerik:GridButtonColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="20px" AllowFiltering="false" HeaderText="Customer" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Customer" ID="RadImageButton3" Visible="true" AlternateText="Customer" runat="server"
                                                    ImageUrl="../assets/media/svg/general/Customer.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderStyle-Width="20px" AllowFiltering="false" HeaderText="Journey Plan" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="CWS" ID="RadImageButtosn3" Visible="true" AlternateText="Customer Week Schedule" runat="server"
                                                    ImageUrl="../assets/media/svg/general/JourneyPlan.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                         <telerik:GridTemplateColumn HeaderStyle-Width="50px" AllowFiltering="false" HeaderText="Products" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="ProAssigned">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="ProAssigned" ID="ProAssigned" Visible="true" AlternateText="Assigned" runat="server"
                                                    ImageUrl="../assets/media/svg/general/Products.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="30px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Route Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Route" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                        </telerik:GridBoundColumn>


                                        <telerik:GridBoundColumn DataField="rot_ArabicName" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Arabic Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rot_ArabicName">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="usr_Code" AllowFiltering="true" HeaderStyle-Width="20px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="User Code" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="usr_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="User" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="rot_Type" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Route Type" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="rot_Type">
                                        </telerik:GridBoundColumn>

                                        <%--<telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="Device" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Device" ID="RadImageButton1" Visible="true" AlternateText="Device" runat="server"
                                                    ImageUrl="assets/media/icons/svg/Devices/Android.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>--%>

                                        <%--<telerik:GridTemplateColumn HeaderStyle-Width="60px" AllowFiltering="false" HeaderText="User" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="User" ID="RadImageButton2" Visible="true" AlternateText="User" runat="server"
                                                    ImageUrl="assets/media/icons/svg/General/User.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>--%>
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
