<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tegninger.aspx.cs" Inherits="Tegninger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentTegn {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiViewTegn" runat="server">

        <!-- Produkt Gruppe -->
        <asp:View ID="ViewGrupperGrupper" runat="server" EnableViewState="true">
            <section>
                <article class="FrontText">
                    <h2>Info om grupperne</h2>
                    <p>Da det er at jeg har flere forskellige former for tegninger har jeg valgt at lave specifikke grupper for hvert emne, så det er nemmere at over skue </p>
                </article>
                <article id="ProduktGruppe">
                    <asp:Repeater ID="RepeaterTegn" runat="server" DataSourceID="SqlDataSourceGruppeKategori">
                        <ItemTemplate>
                            <div id="Grupper">
                                <asp:LinkButton ID="LinkButtonGrupper" runat="server" OnCommand="LinkButtonGrupper_Command" CssClass="ALink">
                                    <img src="Pictures/KategoriGruppe/<%#Eval("Billed") %>" width="300px" height="150px" />
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceGruppeKategori" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [ProduktGruppe]">
                    </asp:SqlDataSource>
                </article>
            </section>
        </asp:View>

        <!-- Produkt kategorier -->
        <asp:View ID="ViewTegnGruppeProd" runat="server" EnableViewState="false">

            <div id="GruppeMenu">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <%--<asp:LinkButton ID="LinkButtonGruppeMenu" runat="server" OnCommand="LinkButtonGruppeMenu_Command"><%#Eval ("Navn") %></asp:LinkButton>--%>
                        <a href="tegninger.aspx?KategoriNavn=<%#Eval ("Navn") %>"><%#Eval ("Navn") %></a>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <%--<div id="GruppeMenu">
                <asp:Repeater ID="Repeater_ProduktMenu" runat="server" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                        <a href="<%#Eval ("Fk_ProduktKategori") %>"><%#Eval ("Navn") %></a>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [Fk_ProduktKategori], [Navn] FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>--%>

            <article class="FrontText">
                <asp:Repeater ID="Repeater_kategoriOverskrivt" runat="server" DataSourceID="SqlDataSourceKategoriNavn">
                    <ItemTemplate>
                        <h2><%#Eval ("Navn") %></h2>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceKategoriNavn" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [ProduktGruppe] WHERE ([Navn] = @Navn)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="Navn" Name="Navn" Type="String"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </article>

            <article id="Produktalign" class="footerfix">
                <asp:Repeater ID="RepeaterProdukter" runat="server" DataSourceID="SqlDataSourceProdukter">
                    <ItemTemplate>
                        <div class="Produkter">
                            <asp:LinkButton ID="LinkButtonEnkeltProdukt" runat="server" OnCommand="LinkButtonEnkeltProdukt_Command" CssClass="ALink">
                        <div class="container">
                            <p><%#Eval("Navn") %></p>
                        </div>
                        <img src="Pictures/Produkter/<%#Eval("Billed") %>" width="400px" height="200px" />
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceProdukter" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT Billeder.Billed, Produkter.Navn FROM Billeder INNER JOIN Produkter ON Billeder.Id = Produkter.Fk_ProduktKategori"></asp:SqlDataSource>

                <%--<div class="Produkter">
                    <asp:LinkButton ID="LinkButtonEnkeltProdukt" runat="server" OnCommand="LinkButtonEnkeltProdukt_Command" CssClass="ALink">
                    <div class="container">
                        <p>Beach</p>
                    </div>
                    <img src="Pictures/Slider/pic1.jpeg" width="400px" height="200px" />
                    </asp:LinkButton>
                </div>
                <div class="Produkter">
                    <div class="container">
                        <p>Beach</p>
                    </div>
                    <img src="Pictures/Slider/pic1.jpeg" width="400px" height="200px" />
                </div>
                <div class="Produkter">
                    <div class="container">
                        <p>Beach</p>
                    </div>
                    <img src="Pictures/Slider/pic1.jpeg" width="400px" height="200px" />
                </div>
                <div class="Produkter">
                    <div class="container">
                        <p>Beach</p>
                    </div>
                    <img src="Pictures/Slider/pic1.jpeg" width="400px" height="200px" />
                </div>--%>
            </article>

        </asp:View>

        <!-- Produkt Enkelte produkt -->
        <asp:View ID="ViewEnkeltProdukt" runat="server" EnableViewState="false">
            <div id="ProduktCenter">
                <div id="ProduktMenu">
                    <a href="#">Link 1</a>
                    <a href="#">Link 2</a>
                    <a href="#">Link 3</a>
                    <a href="#">Link 4</a>
                </div>
                <article id="ProduktCenterImage">
                    <img src="Pictures/die.jpg">
                </article>

                <div id="ContentInfo">
                    <h2>hrj</h2>
                    <hr />
                    <p><%# Eval ("ProduktInfo") %></p>
                    <div id="KundeLink">
                        <h2>Link</h2>
                        <hr />
                        <%#Eval ("Fk_Kunde") %>Link<%#Eval ("KundeLink") %>
                    </div>
                </div>
            </div>

        </asp:View>
    </asp:MultiView>

    <div class="footerClear" style="margin-bottom:210px;"></div>
</asp:Content>


