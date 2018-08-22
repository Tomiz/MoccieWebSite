<%@ Page Title="" Language="C#" MasterPageFile="~/Mobile/MMasterPage.master" AutoEventWireup="true" CodeFile="MTegninger.aspx.cs" Inherits="Tegninger" %>

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
                <article class="FrontText mainrep">

                    <asp:Repeater ID="Repeater_TegnPageInfo" runat="server" DataSourceID="SqlDataSourceIndexText">
                        <ItemTemplate>
                            <h2><%#Eval("Overskrift") %></h2>
                            <p><%#Eval ("Text") %></p>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource runat="server" ID="SqlDataSourceIndexText" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [InfoText] WHERE ([Lokation] = @Lokation)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="TegnPage" Name="Lokation" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </article>


                <article id="ProduktGruppe">

                    <asp:Repeater ID="RepeaterTegn" runat="server" DataSourceID="SqlDataSourceGruppeKategori">
                        <ItemTemplate>
                            <div class="mainrep">
                                <div id="Grupper">
                                    <asp:LinkButton ID="LinkButtonGrupper" runat="server" OnCommand="LinkButtonGrupper_Command" CommandArgument='<%#Eval("Id") %>' CssClass="ALink">
                                    <img src="../Pictures/KategoriGruppe/<%#Eval("Billed") %>" width="300px" height="150px" />
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceGruppeKategori" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                </article>
            </section>

            <%--<div class="footerClear" style="margin-bottom: 99px;"></div>--%>
        </asp:View>

        <!-- Produkt kategorier -->
        <asp:View ID="ViewTegnGruppeProd" runat="server">

            <%--<div class="menurep">
                <div id="GruppeMenu">
                    <a href="MTegninger.aspx?view=0">Tilbage</a>
                    <div class="menuitemrep">--%>

                        <div class="topnav" id="myTopnav">
                            <a href="MTegninger.aspx?view=0"´ style="font-size: 15px;">&#8678;</a>
                            <a href="javascript:void(0);" style="font-size: 15px;" class="icon" onclick="myFunction()">&#9776;</a>

                        
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <a class="UnderlineMenu" href="MTegninger.aspx?view=1&KategoriId=<%#Eval ("Id") %>"><%#Eval ("Navn") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Distinct * FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <script>
                            function myFunction() {
                                var x = document.getElementById("myTopnav");
                                if (x.className === "topnav") {
                                    x.className += " responsive";
                                } else {
                                    x.className = "topnav";
                                }
                            }
                        </script>
                 <%--</div>
            </div>
            </div>--%>

            <section>
                <article class="FrontText">

                    <asp:Repeater ID="Repeater_kategoriOverskrivt" runat="server" DataSourceID="SqlDataSourceKategoriNavn">
                        <ItemTemplate>
                            <div class="headrep2">
                                <h2><%#Eval ("Navn") %></h2>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource runat="server" ID="SqlDataSourceKategoriNavn" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [ProduktGruppe] WHERE ([Id] = @Id)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="KategoriId" DefaultValue="0" Name="Id" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </article>

                <article id="Produktalign" class="footerfix">
                    <asp:Repeater ID="RepeaterProdukter" runat="server" DataSourceID="SqlDataSourceProdukter">
                        <ItemTemplate>
                            <div class="Produkter mainrep2">
                                <%--<asp:LinkButton ID="LinkButtonEnkeltProdukt" runat="server" OnCommand="LinkButtonEnkeltProdukt_Command" CommandArgument='<%#Eval("GruppeId") %>' CommandName='<%#Eval("ProduktId") %>' CssClass="ALink">--%>
                                <a href="MTegninger.aspx?view=2&KategoriId=<%#Eval("GruppeId") %>&ProduktId=<%#Eval("ProduktId") %>&KundeId=<%#Eval("Fk_Kunde") %>">
                                    <div class="container">
                                        <p><%#Eval("Navn") %></p>
                                    </div>
                                    <div id="produktImageBox">
                                        <img src="../Pictures/Produkter/<%#Eval("Billed") %>" id="MiniProduktImage" class="ProduktImagePosition" />
                                    </div>
                                </a>
                                <%--</asp:LinkButton>--%>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceProdukter" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Produkter.Navn, Produkter.Id AS ProduktId, ProduktGruppe.Id AS GruppeId, Produkter.Fk_Kunde, Billeder.Fk_ProduktBilled, Billeder.Billed FROM Produkter INNER JOIN ProduktGruppe ON Produkter.Fk_ProduktGruppe = ProduktGruppe.Id INNER JOIN Billeder ON Produkter.Id = Billeder.Fk_ProduktBilled WHERE (Produkter.Fk_ProduktKategori = @ProduktKategori) AND (ProduktGruppe.Id = @GruppeId)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="ProduktKategori"></asp:Parameter>
                            <asp:QueryStringParameter QueryStringField="KategoriId" DefaultValue="0" Name="GruppeId"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </article>
            </section>
            <%--<div class="footerClear" style="margin-bottom: 50px;"></div>--%>
        </asp:View>

        <!-- Produkt Enkelte produkt -->
        <asp:View ID="ViewEnkeltProdukt" runat="server">
            <%--<div id="ProduktCenter">--%>
                <%--<div id="ProduktMenu">--%>

                    <div class="topnav2" id="myTopnav2">
                        
                    <asp:Repeater ID="RepeaterProduktMenuTilbage" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <a href="MTegninger.aspx?view=1&KategoriId=<%#Eval("Fk_ProduktGruppe") %>">&#8678;</a>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT top(1) [Fk_ProduktGruppe] FROM [Produkter] WHERE ([Fk_ProduktGruppe] = @Fk_ProduktGruppe2)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="KategoriId" DefaultValue="0" Name="Fk_ProduktGruppe2" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                        <a href="javascript:void(0);" style="font-size: 15px;" class="icon" onclick="myFunction2()">&#9776;</a>

                    <%--<div class="menuitemrep">--%>
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <a class="UnderlineMenu" href="MTegninger.aspx?view=1&KategoriId=<%#Eval ("Id") %>"><%#Eval ("Navn") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                        </div>
                        <script>
                            function myFunction2() {
                                var x = document.getElementById("myTopnav2");
                                if (x.className === "topnav2") {
                                    x.className += " responsive";
                                } else {
                                    x.className = "topnav2";
                                }
                            }
                        </script>


                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Distinct * FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
<%--                    </div>--%>
                <%--</div>--%>
            <%--</div>--%>

            <asp:Repeater ID="RepeaterEnkeltProdukt" runat="server" DataSourceID="SqlDataSourceEnkeltProdukt">
                <ItemTemplate>
                    <article id="ProduktCenterImage" class="mainrep">
                        <div style="height: 45px;">
                            <h2><%#Eval("Navn") %></h2>
                        </div>
                        <div id="ProduktBoxSize">
                            <img src="../Pictures/Produkter/<%#Eval("Billed") %>" alt="<%#Eval("Navn") %>" id="produktImage" class="Top10 ProduktImagePosition" style="bottom: inherit;">
                        </div>

                        <!-- The Modal -->
                        <div id="myModal" class="modal">
                            <span class="close">&times;</span>
                            <img class="modal-content" id="img01" />
                            <h1>
                                <div id="caption"></div>
                            </h1>
                        </div>

                        <script>
                            // Get the modal
                            var modal = document.getElementById('myModal');

                            // Get the image and insert it inside the modal - use its "alt" text as a caption
                            var img = document.getElementById('produktImage');
                            var modalImg = document.getElementById("img01");
                            var captionText = document.getElementById("caption");
                            img.onclick = function () {
                                modal.style.display = "block";
                                modalImg.src = this.src;
                                captionText.innerHTML = this.alt;
                            }

                            // Get the <span> element that closes the modal
                            var span = document.getElementsByClassName("close")[0];

                            // When the user clicks on <span> (x), close the modal
                            span.onclick = function () {
                                modal.style.display = "none";
                            }
                        </script>

                    </article>

                    <div id="ContentInfo" class="rightrep">
                        <h2><%#Eval("ProduktHeader") %></h2>
                        <hr />
                        <p><%# Eval ("ProduktInfo") %></p>
                        <div id="KundeLink">
                            <hr />
                            <p>Link: <a href='http://www.<%#Eval("KundeLink") %>'><%#Eval("KundeLink") %></a></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceEnkeltProdukt" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Produkter.Navn, Produkter.ProduktHeader, Produkter.ProduktInfo, Kunde.KundeLink, Produkter.Id, Billeder.Fk_ProduktBilled, Billeder.Billed FROM Produkter INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id INNER JOIN Billeder ON Produkter.Id = Billeder.Fk_ProduktBilled WHERE (Produkter.Id = @Id)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="ProduktId" DefaultValue="0" Name="Id"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <div id="ProduktMenuRight">
                <a style="width: 200%;">
                    <h2>Andre produkter fra samme kunde</h2>
                </a>
                <div class="produkterCenter">
                    <asp:Repeater ID="RepeaterProduktMenu" runat="server" DataSourceID="SqlDataSourceProduktMenu">
                        <ItemTemplate>
                            <a title="Dette er produkter lavet til <%#Eval("KundeNavn") %>" class="UnderlineMenu" href='MTegninger.aspx?view=2&KategoriId=<%#Eval("Fk_ProduktGruppe") %>&ProduktId=<%#Eval("Id") %>&KundeId=<%#Eval("Fk_Kunde") %>'><%#Eval("Navn") %></a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceProduktMenu" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT DISTINCT Produkter.Fk_ProduktKategori, Produkter.Fk_ProduktGruppe, Produkter.Id, Produkter.Navn, Produkter.Fk_Kunde, Kunde.KundeNavn FROM Produkter INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id WHERE (Produkter.Fk_ProduktGruppe = @Fk_ProduktGruppe) AND (Produkter.Fk_Kunde = @KundeId)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="KategoriId" DefaultValue="0" Name="Fk_ProduktGruppe" Type="Int32"></asp:QueryStringParameter>
                        <asp:QueryStringParameter QueryStringField="KundeId" DefaultValue="0" Name="KundeId"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>


        </asp:View>
    </asp:MultiView>


</asp:Content>


