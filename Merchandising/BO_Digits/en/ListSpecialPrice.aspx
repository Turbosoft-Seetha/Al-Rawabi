<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListSpecialPrice.aspx.cs" Inherits="Merchandising.BO_Digits.en.ListSpecialPrice" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
    <asp:LinkButton ID="lnkSubCat" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Add" OnClick="lnkSubCat_Click"></asp:LinkButton>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body p-8" style="background-color: white;">
        <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                ID="grvRpt" GridLines="None"
                ShowFooter="True" AllowSorting="True"
                OnNeedDataSource="grvRpt_NeedDataSource"
                OnItemCommand="grvRpt_ItemCommand"
                AllowFilteringByColumn="true"
                ClientSettings-Resizing-ClipCellContentOnResize="true"
                EnableAjaxSkinRendering="true"
                AllowPaging="true" PageSize="50" CellSpacing="0">
                <ClientSettings>
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500"></Scrolling>
                </ClientSettings>
                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                    ShowFooter="false" DataKeyNames="prh_ID"
                    EnableHeaderContextMenu="true">
                    <Columns>

                        <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="30px" EditFormColumnIndex="0" UniqueName="EditColumn">
                        </telerik:GridButtonColumn>

                        <telerik:GridTemplateColumn HeaderStyle-Width="30px" AllowFiltering="false" HeaderText="Detail" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                    ImageUrl="../assets/media/icons/details.png"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>


                        <telerik:GridBoundColumn DataField="prh_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                            HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="100%"
                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                            HeaderStyle-Font-Bold="true" UniqueName="prh_Code">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="prh_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                            HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="100%"
                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                            HeaderStyle-Font-Bold="true" UniqueName="prh_Name">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="100px"
                            HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                            HeaderStyle-Font-Bold="true" UniqueName="Status">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                <PagerStyle AlwaysVisible="true" />
                <GroupingSettings CaseSensitive="false" />
                <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="True">
                    <Resizing AllowColumnResize="true"></Resizing>
                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                </ClientSettings>
            </telerik:RadGrid>

        </telerik:RadAjaxPanel>

        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
            BackColor="Transparent"
            ForeColor="Blue">
            <div class="col-lg-12 text-center mt-5">
                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
            </div>
        </telerik:RadAjaxLoadingPanel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
