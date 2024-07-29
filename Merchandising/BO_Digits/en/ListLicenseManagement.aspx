<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListLicenseManagement.aspx.cs" Inherits="Merchandising.BO_Digits.en.ListLicenseManagement" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">

    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Add" OnClick="lnkAdd_Click"></asp:LinkButton>
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
    <div class="card-body p-8" style="background-color: white;">
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
            AllowPaging="true" PageSize="50" CellSpacing="0">
            <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500"></Scrolling>
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                ShowFooter="false" DataKeyNames="lim_ID"
                EnableHeaderContextMenu="true">
                <Columns>
                    <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="40px" EditFormColumnIndex="0" UniqueName="EditColumn">
                    </telerik:GridButtonColumn>

                    <telerik:GridBoundColumn DataField="lim_ProjectID" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Project ID" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="lim_ProjectID">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="lim_PreSharedKey" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="PreShared Key" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="lim_PreSharedKey">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="lim_LicenseKey" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="License Key" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="lim_LicenseKey">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="lim_StartDate" AllowFiltering="true" HeaderStyle-Width="100px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Start Date" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="lim_StartDate">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="lim_ExpiryDate" AllowFiltering="true" HeaderStyle-Width="100px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Expiry Date" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="lim_ExpiryDate">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="lim_NoOfLicenses" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="No Of Licenses" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="lim_NoOfLicenses">
                         </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="lim_BufferDays" AllowFiltering="true" HeaderStyle-Width="100px"
                            HeaderStyle-Font-Size="Smaller" HeaderText="Buffer Days" FilterControlWidth="100%"
                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                            HeaderStyle-Font-Bold="true" UniqueName="lim_BufferDays">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="lim_Version" AllowFiltering="true" HeaderStyle-Width="100px"
                            HeaderStyle-Font-Size="Smaller" HeaderText="Version" FilterControlWidth="100%"
                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                            HeaderStyle-Font-Bold="true" UniqueName="lim_Version">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="150px"
                            HeaderStyle-Font-Size="Smaller" HeaderText="Created On" FilterControlWidth="100%"
                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                            HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                        </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="lim_Status" AllowFiltering="true" HeaderStyle-Width="80px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="lim_Status">
                    </telerik:GridBoundColumn>


                </Columns>
            </MasterTableView>
            <PagerStyle AlwaysVisible="true" />
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                <Resizing AllowColumnResize="true"></Resizing>
                <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
            </ClientSettings>
        </telerik:RadGrid>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
