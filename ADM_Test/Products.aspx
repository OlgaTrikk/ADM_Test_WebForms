<%@ Page Title="Product List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ADM_Test.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/availability.js"></script>
    <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>

            <div class="padding15">
                <label>Sort by:</label>
                <asp:DropDownList ID="SortList" runat="server" style="margin-left:20px;">
                  <asp:ListItem Selected="true"></asp:ListItem>
                  <asp:ListItem Value="Price">Price</asp:ListItem>
                  <asp:ListItem Value="Sorting.Popular">Popularity</asp:ListItem>     
                </asp:DropDownList>

                 <asp:Button id="AscSortButton"
                    style="margin-left:20px;"
                    Text="ASC"        
                    runat="server"
                    OnClick="AscSortButton_Click" />  
                 <span>/</span>
                 <asp:Button id="DescSortButton"
                    Text="DESC"
                    runat="server" 
                    OnClick="DescSortButton_Click"/>  
            </div>

            <asp:ListView ID="ProductList" runat="server" 
                DataKeyNames="Id" 
                ItemType="ADM_Test.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <div class="lightgrey listElement">
                            <table>
                                <tr>
                                    <td>
                                        <a href="ProductDetails.aspx?id=<%#:Item.Id%>">
                                            <img src="/Catalog/Images/<%#:Item.Image%>"width="75" height="75"/>
                                        </a>
                                    </td>
                                    <td class="padding15">
                                        <span>
                                            <%#:Item.Title%>
                                        </span>
                                        <br />
                                        <span id="<%#:Item.Id%>_description">
                                            <%#:Item.Description%>
                                        </span>
                                        <br />
                                        <a href="ProductDetails.aspx?id=<%#:Item.Id%>" class="btn btn-default" style="margin-top: 15px;">More Details</a>
                                        <br />
                                    </td>
                                    <td>
                                        <div class="lightgrey padding15">
                                            <span>
                                                Price: <%#:String.Format("{0:c}", Item.Price)%>
                                            </span>
                                            <br />
                                            <span>
                                                Availability: <span id="<%#:Item.Id%>_availability"></span>
                                            </span>
                                            <br />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>
