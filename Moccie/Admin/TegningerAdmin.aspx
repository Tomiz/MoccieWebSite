﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="TegningerAdmin.aspx.cs" Inherits="Admin_TegningerAdmin" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentTegn {
            background-color: #555;
        }

        #According_Current {
            background-color: #ccc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="tegnogbilled">
        <h2>* Felter der er røde virker ikke!</h2>

        <div class="ErrorBox" style="margin-left: 80px;">
            <asp:Label ID="Label_besked" runat="server" Text="" CssClass="ErrorMsg"></asp:Label>
        </div>

        <asp:Button ID="According_Current" class="accordion" runat="server" Text="Ændre Overskrift" OnClientClick="return false;" />

        <!-- Ændre Overskrift -->
        <div class="panel">


            <article class="Overskrift">
                <h2>Overskrift og tekst på forsiden</h2>
                <asp:Repeater ID="RepeaterAdminDefaultTextboxText" runat="server" DataSourceID="SqlDataSourceoverskrifttext">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox_tegnOverskrift" runat="server" Text='<%#Eval("Overskrift") %>'></asp:TextBox>
                        <%--<asp:TextBox ID="TextBox_tegnText" runat="server" Text='<%#Eval("Text") %>'></asp:TextBox>--%>
                        <asp:TextBox ID="TextBox_tegnText" runat="server" TextMode="MultiLine" Rows="3" Text='<%#Eval("Text") %>'> </asp:TextBox>
                        <script type="text/javascript">
                            CKEDITOR.replace("ContentPlaceHolder1_TextBoxOverskriftInfo");
                        </script>

                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceoverskrifttext" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Overskrift, Text FROM InfoText WHERE (Lokation = @Lokation)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="TegnPage" Name="Lokation" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Button ID="Button_FrontPage" runat="server" Text="Gem" OnClick="Button_tegnPage_Click" />
            </article>

            <!--OnClick="ButtonGemProdukt_Click"-->
        </div>

        <asp:Button class="accordion" runat="server" Text="Tilføj nyt Produkt" OnClientClick="return false;" />

        <!-- Tilføj nyt Produkt -->
        <div class="panel">
            <%--<p>Vælg Kategori</p>--%>

            <span style="margin-left: 5px; margin-right: 100px;">Vælg Kategori. </span><span style="margin-right: 140px;">Dato.</span><span style="margin-right: 55px;"> Navn på Billedet.</span><br />

            <asp:DropDownList ID="DropDownListGrupper" runat="server" DataSourceID="SqlDataSourceGrupper" DataTextField="Navn" DataValueField="Id" Width="200px"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceGrupper" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT [Navn], [Id] FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32" ></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <%--<p>Dato</p>--%>
            <asp:TextBox ID="TextBoxDate" runat="server" TextMode="Date" CssClass="textbox" Width="165px"></asp:TextBox>

            <%--<p>Navn på Billedet</p>--%>
            <asp:TextBox ID="TextBoxHeaderText" runat="server" Text="" placeholder="Produkt Navn" Width="380px"></asp:TextBox>

            <p>Upload billed</p>
            Upload billede<asp:FileUpload ID="FileUploadProduktBilled" runat="server" /><br />
            <br />

             <span style="margin-left: 5px; margin-right: 400px;">Title på info Box. </span><span">Valg af kunde.</span>


            <%--<p>Title på info Box</p>--%>
            <asp:TextBox ID="TextBoxHeaderInfoText" runat="server" Text="" Placeholder="Produkt Info Title" Width="500px"></asp:TextBox>

            <%--<p>Valg af kunde</p>--%>
            <asp:DropDownList id="DropDownListKunde" runat="server" DataSourceID="SqlDataSourceKunde" DataTextField="KundeNavn" DataValueField="Id" Width="250px">
                <asp:ListItem Text="Opret kunde først" Value="0" />
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceKunde" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT [KundeNavn], [Id] FROM [Kunde] ORDER BY [KundeNavn]"></asp:SqlDataSource>
            


            <p>Info i infoboks</p>
            <asp:TextBox ID="TextBoxInfoText" runat="server" TextMode="MultiLine" Rows="3" Text="" Placeholder="Produkt Info text"></asp:TextBox>
            <script type="text/javascript">
                CKEDITOR.replace("ContentPlaceHolder1_TextBoxInfoText");
            </script>

            <br />
            <asp:Button ID="ButtonGemProdukt" runat="server" Text="Tilføj nyt Elemet" OnClick="ButtonGemProdukt_Click" />
            <!--OnClick="ButtonGemProdukt_Click"-->
        </div>

        <!-- Redigere Produkt -->
        <asp:Button class="accordion" runat="server" Text="Redigere nuværende produkter" OnClientClick="return false;" />
        <div class="panel">
            <div>
                <asp:Repeater ID="RepeaterRedigerProdukter" runat="server" DataSourceID="SqlDataSourceRedProdukt" OnItemCommand="RepeaterRedigerProdukter_ItemCommand">
                    <ItemTemplate>
                        <span style="margin-left: 5px; margin-right: 40px;">Kategori. </span><span style="margin-right: 165px;">Navn på billedet.</span><span style="margin-right: 55px;"> Kunde.</span> <span>Overskift på tekst.</span><br />
                        <asp:DropDownList ID="DropDownListProduktKategorier" runat="server" DataTextField="Navn" DataValueField="ProduktGruppeId" DataSourceID="SqlDataSourceProduktkategoriDropdown" SelectedValue='<%# Eval("GruppeId") %>' Width="100px"></asp:DropDownList>
                        <asp:TextBox ID="TextBoxProduktNavn" runat="server" Text='<%#Eval("Navn") %>' Width="275"></asp:TextBox>
                        <asp:DropDownList ID="DropDownListProduktEjer" runat="server" DataSourceID="SqlDataSourceProduktKunder" DataTextField="KundeNavn" DataValueField="Id" Width="100px" SelectedValue='<%# Eval("KundeId") %>'></asp:DropDownList>
                        <asp:TextBox ID="TextBoxProduktheader" runat="server" Text='<%#Eval("ProduktHeader") %>' Width="275"></asp:TextBox>
                        <span style="margin-left: 5px;">Information omkring billedet.</span><br />
                        <asp:TextBox ID="TextBoxProduktInfo" runat="server" Text='<%#Eval("ProduktInfo") %>' TextMode="MultiLine" Rows="3" Height="100" Width="80%"></asp:TextBox>
                        <script type="text/javascript">
                            CKEDITOR.replace("ContentPlaceHolder1_RepeaterRedigerProdukter_TextBoxProduktInfo_{0}"); // Need fixet
                        </script>

                        <img src="../Pictures/Produkter/<%#Eval("Billed") %>" width="125" class="floatRight produktpicTilføj" />
                        <br />
                        <asp:Button ID="RedigerProd" runat="server" Text="Gem" CommandArgument='<%#Eval("ProduktId") %>' CommandName="RedigerProdukt" />
                        <asp:Button ID="SletProd" runat="server" Text="Slet" CommandArgument='<%#Eval("ProduktId") %>' CommandName="SletProdukt" />

                        <asp:FileUpload ID="FileUploadRedigerProduktBilled" runat="server" />
                        <asp:Button ID="RedigerProdPic" runat="server" Text="Gem Billed" CommandArgument='<%#Eval("ProduktId") %>' CommandName="RedigerProduktBilled" />



                        <hr />
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource runat="server" ID="SqlDataSourceRedProdukt" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT DISTINCT Produkter.ProduktHeader, Produkter.Navn, Produkter.ProduktInfo, ProduktGruppe.Navn AS ProduktKategori, Produkter.Id AS ProduktId, Kunde.Id AS KundeId, Kunde.KundeNavn, ProduktGruppe.Id AS GruppeId, ProduktKategori.Id, Billeder.Id AS Expr1, Billeder.Billed, Billeder.Fk_ProduktBilled, Produkter.Dato FROM Produkter INNER JOIN ProduktGruppe ON Produkter.Fk_ProduktGruppe = ProduktGruppe.Id INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id INNER JOIN ProduktKategori ON Produkter.Fk_ProduktKategori = ProduktKategori.Id AND ProduktGruppe.Fk_ProduktKategori = ProduktKategori.Id INNER JOIN Billeder ON Produkter.Id = Billeder.Fk_ProduktBilled WHERE (ProduktKategori.Id = 1) ORDER BY Produkter.Dato DESC"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceProduktkategoriDropdown" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT DISTINCT Id AS ProduktGruppeId, Navn FROM ProduktGruppe ORDER BY Navn"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceProduktKunder" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT [KundeNavn], [Id] FROM [Kunde] ORDER BY [KundeNavn]"></asp:SqlDataSource>

            </div>
        </div>

        <!-- Tilføj/Slet kategorier -->
        <asp:Button class="accordion" runat="server" Text="Tilføj/Slet kategorier" OnClientClick="return false;" />
        <div class="panel">
            <span style="margin-left: 5px; margin-right: 250px;">Navn på Kategorien</span> <span>Hvilken Gruppe sklal den ligge under</span>
            <asp:TextBox ID="NyKate" runat="server" Text="" Placeholder="Tilføj Ny Kategori" Width="50%"></asp:TextBox>
            <asp:DropDownList ID="DropDownListProduktKategori" runat="server" DataSourceID="SqlDataSourceKategoriProdukt" DataTextField="Navn" DataValueField="Id" Width="45%"></asp:DropDownList>
            <br />
            Billed skal være 300x150
            <asp:FileUpload ID="FileUploadkategori" runat="server" CssClass="clearBoth width100"  />
            <asp:Button ID="GemKate" runat="server" Text="Tilføj ny Kategori" CssClass="clearBoth Top10" OnClick="GemKate_Click" /><br />
            <br />
            <hr />
            <asp:Repeater ID="Repeaterkategorier" runat="server" DataSourceID="SqlDataSourceKategorier" OnItemCommand="Repeaterkategorier_ItemCommand">
                <ItemTemplate>
                    <%--<asp:TextBox ID="TextBoxShowKate" runat="server" Text='<%#Eval("Navn") %>' Width="200"></asp:TextBox>--%>
                    <img src="../Pictures/KategoriGruppe/<%#Eval("Billed") %>" width="75">
                    <asp:FileUpload ID="FileUploadKategoriUpdate" runat="server" CssClass="clearBoth Top25" />
                    <asp:Button ID="SletKate" runat="server" Text="Slet" CommandArgument='<%#Eval("Id") %>' CommandName="SletKate"  CssClass="floatRight"/>
                    <asp:Button ID="Redigerekate" runat="server" Text="Gem" CommandArgument='<%#Eval("Id") %>' CommandName="RediKate"  CssClass="floatRight right2"/>
                    
                    <hr />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceKategoriProdukt" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [ProduktKategori]"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceKategorier" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Navn, Billed, Id FROM ProduktGruppe WHERE (Fk_ProduktKategori = @Fk_ProduktKategori) ORDER BY Navn">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

        <!-- Kunder -->
        <asp:Button class="accordion" runat="server" Text="Kunde" OnClientClick="return false;" />
        <div class="panel">
            <asp:TextBox ID="Kundenavn" runat="server" Text="" placeholder="Kunde Navn"></asp:TextBox>
            <asp:TextBox ID="KundeLink" runat="server" Text="" placeholder="Kunde Link"></asp:TextBox>
            <%--<asp:DropDownList ID="DropDownListplatform" runat="server" DataSourceID="SqlDataSourcePlaftform" DataTextField="Navn" DataValueField="Id"></asp:DropDownList>--%>
            <asp:SqlDataSource runat="server" ID="SqlDataSourcePlaftform" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [Platform]"></asp:SqlDataSource>
            <%--<asp:TextBox ID="Followers" runat="server" Text="" placeHolder="Antal followers/subsriber"></asp:TextBox>--%>
            <asp:Button ID="ButtonGemKunde" runat="server" Text="Tilføj ny Kunde" OnClick="ButtonGemKunde_Click" /><br />
            <br />
            <hr />
            <asp:Repeater ID="RepeaterKunder" runat="server" DataSourceID="SqlDataSourceKunder" OnItemCommand="RepeaterKunder_ItemCommand">
                <ItemTemplate>
                    <asp:TextBox ID="TextBoxShowKate" runat="server" Text='<%#Eval("KundeNavn") %>' Width="200"></asp:TextBox>
                    <asp:TextBox ID="TextBoxShowKundelink" runat="server" Text='<%#Eval("KundeLink") %>' Width="200"></asp:TextBox>
                    <asp:Button ID="ButtonRedikunde" runat="server" Text="Redigere" CommandArgument='<%#Eval("Id") %>' CommandName="RediKunde" />
                    <asp:Button ID="ButtonSletkunde" runat="server" Text="Slet" CommandArgument='<%#Eval("Id") %>' CommandName="SletKunde" />
                    <br />
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceKunder" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Id, KundeNavn, KundeLink, HiddenId FROM Kunde ORDER BY KundeNavn"></asp:SqlDataSource>
        </div>

        <!-- Priser -->
        <asp:Button class="accordion" runat="server" Text="Priser" OnClientClick="return false;" />
        <div class="panel">
        </div>



    </div>
    <div class="footerClear" style="margin-top: 477px;"></div>

    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
    </script>
</asp:Content>

