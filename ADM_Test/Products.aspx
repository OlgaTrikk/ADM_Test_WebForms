<%@ Page Title="Product List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ADM_Test.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>

            <asp:ListView ID="productList" runat="server" 
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
                                            <img src="/Catalog/Images/<%#:Item.Image%>"
                                                width="100" height="75" style="border: solid;" /></a>
                                    </td>
                                    <td class="padding15">
                                        <span>
                                            <%#:Item.Title%>
                                        </span>
                                        <br />
                                        <span>
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
                                                Availability: <%#:Item.Availability%>
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
