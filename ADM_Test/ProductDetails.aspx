<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ADM_Test.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="productDetail" runat="server" ItemType="ADM_Test.Models.Product" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h2><%#:Page.Title %></h2>
            </div>
            <div class="lightgrey padding15">
                <div>
                    <h2><%#:Item.Title %></h2>
                </div>
                <br />
                <table>
                    <tr>
                        <td>
                            <img src="/Catalog/Images/<%#:Item.Image %>" style="border:solid lightgrey; height:300px" alt="<%#:Item.Title %>"/>
                        </td>
                        <td>&nbsp;</td>  
                        <td style="vertical-align: top; text-align:left;">
                            <div class="lightgrey padding15">
                                <b>Description:</b><br /><%#:Item.Description %>
                                <br/>
                                <div class="lightgrey padding15">
                                <span><b>Price:</b>&nbsp;<%#: String.Format("{0:c}", Item.Price) %></span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table> 
                <div class="lightgrey padding15">
                    <span><b>Specifications:</b></span>
                        <ul>
                        <asp:Repeater ID="Specs" DataSource="<%# Item.Specs %>" runat="server">
                            <ItemTemplate>
                                <li> <%# Container.DataItem?.ToString() ?? string.Empty%></li>
                            </ItemTemplate>
                        </asp:Repeater>
                     </ul>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
