<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentHome {
            background-color: #555;
        }
    </style>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="footerfix">
        <article class="FrontText">
            <asp:Repeater ID="Repeater_FrontPageInfo" runat="server" DataSourceID="SqlDataSourceIndexText">
                <ItemTemplate>
                    <h2><%#Eval("Overskrift") %></h2>
                    <p><%#Eval ("Text") %></p>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceIndexText" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [InfoText] WHERE ([Lokation] = @Lokation)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="FrontPage" Name="Lokation" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </article>

        <script>
            $(document).ready(function () {
                $('.slider').bxSlider();
            });
        </script>
        <article class="slider">
            <asp:Repeater ID="Repeater_slider" runat="server" DataSourceID="SqlDataSourceSlider">
                <ItemTemplate>
                    <img src="Pictures/Produkter/<%#Eval("Billed") %>" />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceSlider" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT TOP (3) Produkter.Id, Produkter.Navn, Billeder.Billed, Billeder.Fk_ProduktBilled FROM Produkter INNER JOIN Billeder ON Produkter.Id = Billeder.Fk_ProduktBilled ORDER BY Produkter.Id DESC"></asp:SqlDataSource>
        </article>

        <article class="About">
            <asp:Repeater ID="Repeater_AboutSite" runat="server" DataSourceID="SqlDataSourceAboutMoccie">
                <ItemTemplate>
                    <h2><%#Eval("Overskrift") %> </h2>
                    <p>
                        <%#Eval("Text") %>
                    </p>

                    <img src="Pictures/Profil/<%#Eval("Image") %>" width="150" height="150" class="profilePic" />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceAboutMoccie" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [IndexText]"></asp:SqlDataSource>

            
        </article>
    </section>


</asp:Content>

