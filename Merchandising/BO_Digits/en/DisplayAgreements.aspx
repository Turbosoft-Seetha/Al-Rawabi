<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="DisplayAgreements.aspx.cs" Inherits="Merchandising.BO_Digits.en.DisplayAgreements" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
    <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../assets/media/icons/excel.png" Height="50" ToolTip="Download" OnClick="imgExcel_Click" AlternateText="Xlsx" />


                            <asp:ImageButton ID="btnPDF" runat="server" ImageUrl="../assets/media/svg/files/pdf.svg" Height="50" Width="30" ToolTip="Print"
                                OnClick="btnPDF_Click" AlternateText="pdf" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="card-body p-8" style="background-color:white;"> 
     <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
      <div class=" col-lg-12 row" style="display: -webkit-box; padding-bottom: 10px">
             <div class="col-lg-3" >
                                        <label class="control-label col-lg-12">Region</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddlRegion" runat="server" EmptyMessage="Select Region" Width="100%" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                         <div class="col-lg-3" >
                                        <label class="control-label col-lg-12">Depot</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddldepot" runat="server" EmptyMessage="Select Depot" Width="100%" OnSelectedIndexChanged="ddldepot_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                                      <div class="col-lg-3" >
                                        <label class="control-label col-lg-12">Area</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddldpoArea" runat="server" EmptyMessage="Select Area" Width="100%" OnSelectedIndexChanged="ddldpoArea_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>
                                      <div class="col-lg-3" >
                                        <label class="control-label col-lg-12">Subarea</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox  Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" RenderMode="Lightweight"
                                                ID="ddldpoSubArea" runat="server" EmptyMessage="Select Subarea" Width="100%" OnSelectedIndexChanged="ddldpoSubArea_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>

                                        </div>
                                    </div>



           <div class="col-lg-3"  style="padding-top:10px;">
                                        <label class="control-label col-lg-12">Route</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CloseDropDownOnBlur="true" RenderMode="Lightweight"
                                                ID="rdRoute" runat="server"
                                                EmptyMessage="Select Route" Width="100%" OnSelectedIndexChanged="rdRoute_SelectedIndexChanged" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-3"  style="padding-top:10px;">
                                        <label class="control-label col-lg-12">Customer</label>
                                        <div class="col-lg-12">
                                            <telerik:RadComboBox Skin="Material" Filter="Contains" CloseDropDownOnBlur="true" RenderMode="Lightweight"
                                                ID="rdCustomer" runat="server"
                                                EmptyMessage="Select Customer" Width="100%">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>


                                    <div class="col-lg-2"  style="padding-top:10px;">
                                        <label class="control-label col-lg-12">From Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="rdfromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server">
                                            </telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdfromDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-2"  style="padding-top:10px;">
                                        <label class="control-label col-lg-12">To Date</label>
                                        <div class="col-lg-12">
                                            <telerik:RadDatePicker RenderMode="Lightweight" ID="rdendDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server">
                                            </telerik:RadDatePicker>
                                            <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdendDate" ControlToCompare="rdfromDate" ErrorMessage="End date must be greater"
                                                Display="Dynamic" ForeColor="Red" Operator="GreaterThan"></asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdendDate"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                   
                                    <div class="col-lg-2 mt-6"  style="padding-top:10px;">
                                        <asp:LinkButton ID="Filter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" CausesValidation="true" OnClick="Filter_Click">
                                                    Apply Filter
                                        </asp:LinkButton>
                                    </div>


                                </div>

     <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="50" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="dag_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridBoundColumn DataField="rot_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText=" Route Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rot_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText=" Route" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rot_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText=" Customer Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="170px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText=" Customer" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="usr_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="User" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="usr_Name">
                                            </telerik:GridBoundColumn>

                                              <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="dag_Number" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Agreement Number" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_Number">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="agt_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Agreement " FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="agt_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="act_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="act_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="act_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="act_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="asc_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="SubCategory Code" FilterControlWidth="40%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="asc_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="asc_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="SubCategory" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="asc_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="brd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                            </telerik:GridBoundColumn>



                                            <telerik:GridBoundColumn DataField="apt_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Pay Terms Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="apt_Code">
                                            </telerik:GridBoundColumn>



                                            <telerik:GridBoundColumn DataField="apt_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Pay Terms" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="apt_Name">
                                            </telerik:GridBoundColumn>


                                            <telerik:GridBoundColumn DataField="ago_Name" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Offer" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ago_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="dag_StartDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Start Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_StartDate">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="dag_EndDate" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="End Date" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_EndDate">
                                            </telerik:GridBoundColumn>


                                            <telerik:GridBoundColumn DataField="dag_MonthlyAmount" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Monthly Amount" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_MonthlyAmount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="dag_TotalAmount" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Total Amount" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_TotalAmount">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Image" UniqueName="Images" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                                <ItemTemplate>

                                                    <asp:HyperLink ID="dagImg" runat="server" NavigateUrl=' <%#  Eval("dag_Image") %>' Target="_blank">
                                                        <asp:Image ID="dagImage" runat="server" ImageUrl=' <%#  Eval("dag_Image") %>' Height="20px" Width="20px"/>
                                                    </asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="100px" HeaderText="Attachment" UniqueName="Attachment" HeaderStyle-Font-Bold="true" AllowFiltering="false">
                                                <ItemTemplate>

                                                    <asp:HyperLink ID="dagAttach" runat="server" NavigateUrl=' <%#  Eval("dag_Attachment") %>' Target="_blank">
                                                        <asp:Image ID="dagAttchment" runat="server" ImageUrl='../assets/media/svg/files/File.svg' Height="20px" Width="20px" />
                                                    </asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>


                                            <telerik:GridBoundColumn DataField="dag_Remarks" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Remarks" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="dag_Remarks">
                                            </telerik:GridBoundColumn>

                                            <%-- <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Status">
                                            </telerik:GridBoundColumn>--%>

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
