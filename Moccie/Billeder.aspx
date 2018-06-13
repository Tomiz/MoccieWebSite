<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Billeder.aspx.cs" Inherits="Billeder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentBilled {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiViewBilled" runat="server" ActiveViewIndex="0">

        <!-- Produkt Gruppe -->
        <asp:View ID="ViewGrupperGrupper" runat="server" EnableViewState="true">
            <section>
                <article class="FrontText mainrep">

                    <asp:Repeater ID="Repeater_PicPageInfo" runat="server" DataSourceID="SqlDataSourceIndexText">
                        <ItemTemplate>
                            <h2><%#Eval("Overskrift") %></h2>
                            <p><%#Eval ("Text") %></p>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource runat="server" ID="SqlDataSourceIndexText" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [InfoText] WHERE ([Lokation] = @Lokation)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="PicPage" Name="Lokation" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                </article>
                <article id="ProduktGruppe">
                    <asp:Repeater ID="RepeaterBilled" runat="server" DataSourceID="SqlDataSourceGruppeKategori">
                        <ItemTemplate>
                            <div class="mainrep">
                                <div id="Grupper">
                                    <asp:LinkButton ID="LinkButtonGrupper" runat="server" OnCommand="LinkButtonGrupper_Command" CommandArgument='<%#Eval("Id") %>' CssClass="ALink">
                                    <img src="Pictures/KategoriGruppe/<%#Eval("Billed") %>" width="300px" height="150px" />
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceGruppeKategori" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </article>
            </section>
        </asp:View>

        <!-- Produkt kategorier -->
        <asp:View ID="ViewTegnGruppeProd" runat="server">
            <div class="menurep">
                <div id="GruppeMenu">
                    <a href="Billeder.aspx?view=0">Tilbage</a>
                    <div class="menuitemrep">
                        <asp:Repeater ID="RepeaterGruppeMenuBilleder" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <a href="Billeder.aspx?view=1&KategoriId=<%#Eval ("Id") %>"><%#Eval ("Navn") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT Distinct * FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="2" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>

            <section>
                <article class="FrontText">
                    <asp:Repeater ID="Repeater_kategoriOverskrivt" runat="server" DataSourceID="SqlDataSourceKategoriNavn">
                        <ItemTemplate>
                            <div class="headrep2">
                                <h2><%#Eval ("Navn") %></h2>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceKategoriNavn" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [ProduktGruppe] WHERE ([Id] = @Id)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="KategoriId" DefaultValue="0" Name="Id" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </article>

                <article id="Produktalign" class="footerfix">
                    <asp:Repeater ID="RepeaterProdukter" runat="server" DataSourceID="SqlDataSourceProdukter">
                        <ItemTemplate>
                            <div class="Produkter mainrep2">
                                <a href="Billeder.aspx?view=2&KategoriId=<%#Eval("GruppeId") %>&ProduktId=<%#Eval("ProduktId") %>&KundeId=<%#Eval("Fk_Kunde") %>">
                                    <div class="container">
                                        <p><%#Eval("Navn") %></p>
                                    </div>
                                    <img src="Pictures/Produkter/<%#Eval("Billed") %>" width="400px" height="200px" />
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceProdukter" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT Produkter.Navn, Produkter.Id AS ProduktId, ProduktGruppe.Id AS GruppeId, Produkter.Fk_Kunde, Billeder.Billed, Billeder.Fk_ProduktBilled FROM Produkter INNER JOIN ProduktGruppe ON Produkter.Fk_ProduktGruppe = ProduktGruppe.Id INNER JOIN Billeder ON Produkter.Id = Billeder.Fk_ProduktBilled WHERE (Produkter.Fk_ProduktKategori = @ProduktKategori) AND (ProduktGruppe.Id = @GruppeId)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="ProduktKategori"></asp:Parameter>
                            <asp:QueryStringParameter QueryStringField="KategoriId" DefaultValue="0" Name="GruppeId"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </article>
            </section>
        </asp:View>

        <!-- Produkt Enkelte produkt -->
        <asp:View ID="ViewEnkeltProdukt" runat="server">
            <div id="ProduktCenter">
                <div id="ProduktMenu">
                    <asp:Repeater ID="RepeaterProduktMenuTilbage" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <a href="Billeder.aspx?view=1&KategoriId=<%#Eval("Fk_ProduktGruppe") %>">Tilbage</a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT top(1) [Fk_ProduktGruppe] FROM [Produkter] WHERE ([Fk_ProduktGruppe] = @Fk_ProduktGruppe2)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="KategoriId" DefaultValue="0" Name="Fk_ProduktGruppe2" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Repeater ID="RepeaterProduktMenu" runat="server" DataSourceID="SqlDataSourceProduktMenu">
                        <ItemTemplate>
                            <a href='Billeder.aspx?view=2&KategoriId=<%#Eval("Fk_ProduktGruppe") %>&ProduktId=<%#Eval("Id") %>&KundeId=<%#Eval("Fk_Kunde") %>'><%#Eval("Navn") %></a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceProduktMenu" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT DISTINCT Fk_ProduktKategori, Fk_ProduktGruppe, Id, Navn, Fk_Kunde FROM Produkter WHERE (Fk_ProduktGruppe = @Fk_ProduktGruppe) AND (Fk_Kunde = @KundeId)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="KategoriId" DefaultValue="0" Name="Fk_ProduktGruppe" Type="Int32"></asp:QueryStringParameter>
                            <asp:QueryStringParameter QueryStringField="KundeId" DefaultValue="0" Name="KundeId"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <asp:Repeater ID="RepeaterEnkeltProdukt" runat="server" DataSourceID="SqlDataSourceEnkeltProdukt">
                    <ItemTemplate>
                        <article id="ProduktCenterImage" class="mainrep">
                            <h2><%#Eval("Navn") %></h2>
                            <img src="Pictures/Produkter/<%#Eval("Billed") %>" id="produktImage" class="Top10">
                        </article>

                        <div id="ContentInfo" class="rightrep">
                            <h2><%#Eval("ProduktHeader") %></h2>
                            <hr />
                            <p><%# Eval ("ProduktInfo") %></p>
                            <div id="KundeLink">
                                <hr />
                                Link: <a href='http://www.<%#Eval("KundeLink") %>'><%#Eval("KundeLink") %></a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceEnkeltProdukt" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT Produkter.Navn, Produkter.ProduktHeader, Produkter.ProduktInfo, Kunde.KundeLink, Produkter.Id, Billeder.Billed, Billeder.Fk_ProduktBilled FROM Produkter INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id INNER JOIN Billeder ON Produkter.Id = Billeder.Fk_ProduktBilled WHERE (Produkter.Id = @Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="ProduktId" DefaultValue="0" Name="Id"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:View>
    </asp:MultiView>

</asp:Content>

