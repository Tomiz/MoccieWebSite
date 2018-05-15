<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tegninger.aspx.cs" Inherits="Tegninger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentTegn {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiViewTegn" runat="server" ActiveViewIndex="0">

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
                                <asp:LinkButton ID="LinkButtonGrupper" runat="server" OnCommand="LinkButtonGrupper_Command" CommandArgument='<%#Eval("Id") %>' CssClass="ALink">
                                    <img src="Pictures/KategoriGruppe/<%#Eval("Billed") %>" width="300px" height="150px" />
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceGruppeKategori" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </article>
            </section>
        </asp:View>

        <!-- Produkt kategorier -->
        <asp:View ID="ViewTegnGruppeProd" runat="server">

            <div id="GruppeMenu">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <a href="Tegninger.aspx?view=1&KategoriId=<%#Eval ("Id") %>"><%#Eval ("Navn") %></a>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <section>
                <article class="FrontText">
                    <asp:Repeater ID="Repeater_kategoriOverskrivt" runat="server" DataSourceID="SqlDataSourceKategoriNavn">
                        <ItemTemplate>
                            <h2><%#Eval ("Navn") %></h2>
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
                            <div class="Produkter">
                                <asp:LinkButton ID="LinkButtonEnkeltProdukt" runat="server" OnCommand="LinkButtonEnkeltProdukt_Command" CommandArgument='<%#Eval("GruppeId") %>' CommandName='<%#Eval("ProduktId") %>' CssClass="ALink">
                                <div class="container">
                                    <p><%#Eval("Navn") %></p>
                                </div>
                                <img src="Pictures/Produkter/<%#Eval("Billed") %>" width="400px" height="200px" />
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceProdukter" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT Billeder.Billed, Produkter.Navn, Produkter.Id AS ProduktId, ProduktGruppe.Id AS GruppeId FROM Billeder INNER JOIN Produkter ON Billeder.Id = Produkter.Fk_ProduktKategori INNER JOIN ProduktGruppe ON Produkter.Fk_ProduktGruppe = ProduktGruppe.Id WHERE (Produkter.Fk_ProduktKategori = @ProduktKategori) AND (ProduktGruppe.Id = @GruppeId)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="ProduktKategori"></asp:Parameter>
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
                    <asp:Repeater ID="RepeaterProduktMenu" runat="server" DataSourceID="SqlDataSourceProduktMenu">
                        <ItemTemplate>
                            <a href='Tegninger.aspx?view=2&KategoriId=<%#Eval("Fk_ProduktGruppe") %>&ProduktId=<%#Eval("Id") %>'><%#Eval("Navn") %></a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceProduktMenu" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT distinct [Fk_ProduktKategori], [Fk_ProduktGruppe], [Id], [Navn] FROM [Produkter] WHERE ([Fk_ProduktGruppe] = @Fk_ProduktGruppe)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="KategoriId" DefaultValue="0" Name="Fk_ProduktGruppe" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <asp:Repeater ID="RepeaterEnkeltProdukt" runat="server" DataSourceID="SqlDataSourceEnkeltProdukt">
                    <ItemTemplate>
                        <article id="ProduktCenterImage">
                            <h2><%#Eval("Navn") %></h2>
                            <img src="Pictures/Produkter/<%#Eval("Billed") %>" width="850px" class="Top10">
                        </article>

                        <div id="ContentInfo">
                            <h2><%#Eval("ProduktHeader") %></h2>
                            <hr />
                            <p><%# Eval ("ProduktInfo") %></p>
                            <div id="KundeLink">
                                <h2>Link</h2>
                                <hr />
                                Link: <a href='<%#Eval("KundeLink") %>'><%#Eval("KundeLink") %></a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceEnkeltProdukt" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT Billeder.Billed, Produkter.Navn, Produkter.ProduktHeader, Produkter.ProduktInfo, Kunde.KundeLink, Produkter.Id FROM Billeder INNER JOIN Produkter ON Billeder.Id = Produkter.Fk_ProduktKategori INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id WHERE (Produkter.Id = @Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="ProduktId" DefaultValue="0" Name="Id"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:View>
    </asp:MultiView>

    <div class="footerClear" style="margin-bottom: 385px;"></div>
</asp:Content>


