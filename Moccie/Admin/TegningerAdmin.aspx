<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="TegningerAdmin.aspx.cs" Inherits="Admin_TegningerAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentTegn {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="tegnogbilled">
        <asp:Button class="accordion" runat="server" Text="Tilføj nyt Produkt" OnClientClick="return false;" />

        <!-- Tilføj nyt Produkt -->
        <div class="panel">
            <p>Vælg Kategori</p>
            <asp:DropDownList ID="DropDownListGrupper" runat="server" DataSourceID="SqlDataSourceGrupper" DataTextField="Navn" DataValueField="Id"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceGrupper" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [Navn], [Id] FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <p>Navn på Billedet</p>
            <asp:TextBox ID="TextBoxHeaderText" runat="server" Text="" placeholder="Produkt Navn"></asp:TextBox>

            <p>Upload billed</p>
            Upload billede<asp:FileUpload ID="FileUploadProduktBilled" runat="server" /><br />
            <br />
            <p>Title på info Box</p>
            <asp:TextBox ID="TextBoxHeaderInfoText" runat="server" Text="" Placeholder="Produkt Info Title"></asp:TextBox>
            <p>Info i infoboks</p>
            <asp:TextBox ID="TextBoxInfoText" runat="server" Text="" Placeholder="Produkt Info text"></asp:TextBox>
            <p>Valg af kunde</p>
            <asp:DropDownList ID="DropDownListKunde" runat="server" DataSourceID="SqlDataSourceKunde" DataTextField="KundeNavn" DataValueField="Id">
                <asp:ListItem Text="Opret kunde først" Value="0" />
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceKunde" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [KundeNavn], [Id] FROM [Kunde]"></asp:SqlDataSource>
            <asp:Button ID="ButtonGemProdukt" runat="server" Text="Tilføj nyt Elemet" OnClick="ButtonGemProdukt_Click"/>
            <!--OnClick="ButtonGemProdukt_Click"-->
        </div>

        <!-- Redigere Produkt -->
        <asp:Button class="accordion" runat="server" Text="Redigere nuværende produkter" OnClientClick="return false;" />
        <div class="panel">
            <div>
                <asp:Repeater ID="RepeaterRedigerProdukter" runat="server" DataSourceID="SqlDataSourceRedProdukt"  OnItemCommand="RepeaterRedigerProdukter_ItemCommand">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListProduktKategorier" runat="server" DataTextField="Navn" DataValueField="ProduktGruppeId" DataSourceID="SqlDataSourceProduktkategoriDropdown" SelectedValue='<%# Eval("GruppeId") %>' Width="100px"></asp:DropDownList>
                        <asp:TextBox ID="TextBoxProduktNavn" runat="server" Text='<%#Eval("Navn") %>' Width="275"></asp:TextBox>
                        <asp:DropDownList ID="DropDownListProduktEjer" runat="server" DataSourceID="SqlDataSourceProduktKunder" DataTextField="KundeNavn" DataValueField="Id" Width="100px" SelectedValue='<%# Eval("KundeId") %>'></asp:DropDownList>
                        <asp:TextBox ID="TextBoxProduktheader" runat="server" Text='<%#Eval("ProduktHeader") %>' Width="275"></asp:TextBox>
                        <asp:TextBox ID="TextBoxProduktInfo" runat="server" Text='<%#Eval("ProduktInfo") %>' TextMode="MultiLine" Height="100"></asp:TextBox>

                        <asp:Button ID="RedigerProd" runat="server" Text="Rediger" CommandArgument='<%#Eval("ProduktId") %>' CommandName="RedigerProdukt"/>
                        <asp:Button ID="SletProd" runat="server" Text="Slet" CommandArgument='<%#Eval("ProduktId") %>' CommandName="SletProdukt" />
                        <hr />
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource runat="server" ID="SqlDataSourceRedProdukt" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT DISTINCT Produkter.ProduktHeader, Produkter.Navn, Produkter.ProduktInfo, ProduktGruppe.Navn AS ProduktKategori, Produkter.Id AS ProduktId, Kunde.Id AS KundeId, Kunde.KundeNavn, ProduktGruppe.Id AS GruppeId FROM Produkter INNER JOIN ProduktGruppe ON Produkter.Fk_ProduktGruppe = ProduktGruppe.Id INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceProduktkategoriDropdown" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT DISTINCT Id AS ProduktGruppeId, Navn FROM ProduktGruppe"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceProduktKunder" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [KundeNavn], [Id] FROM [Kunde]"></asp:SqlDataSource>

            </div>
        </div>

        <!-- Tilføj/Slet kategorier -->
        <asp:Button class="accordion" runat="server" Text="Tilføj/Slet kategorier" OnClientClick="return false;" />
        <div class="panel">
            <asp:TextBox ID="NyKate" runat="server" Text="" Placeholder="Tilføj Ny Kategori"></asp:TextBox><br />
            <asp:FileUpload ID="FileUploadkategori" runat="server" CssClass="clearBoth width100" />
            <asp:Button ID="GemKate" runat="server" Text="Tilføj ny Kategori" CssClass="clearBoth Top10" /><br />
            <br />
            <asp:Repeater ID="Repeaterkategorier" runat="server" DataSourceID="SqlDataSourceKategorier">
                <ItemTemplate>
                    <asp:TextBox ID="TextBoxShowKate" runat="server" Text='<%#Eval("Navn") %>' Width="200"></asp:TextBox>
                    <asp:Button ID="Redigerekate" runat="server" Text="Redigere" />
                    <asp:Button ID="SletKate" runat="server" Text="Slet" />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceKategorier" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [Navn] FROM [ProduktGruppe]"></asp:SqlDataSource>

        </div>

        <!-- Kunder -->
        <asp:Button class="accordion" runat="server" Text="Kunde" OnClientClick="return false;" />
        <div class="panel">
            <asp:TextBox ID="Kundenavn" runat="server" Text="" placeholder="Kunde Navn"></asp:TextBox>
            <asp:TextBox ID="KundeLink" runat="server" Text="" placeholder="Kunde Link"></asp:TextBox>
            <asp:DropDownList ID="DropDownListplatform" runat="server" DataSourceID="SqlDataSourcePlaftform" DataTextField="Navn" DataValueField="Id"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourcePlaftform" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [Platform]"></asp:SqlDataSource>
            <asp:TextBox ID="Followers" runat="server" Text="" placeHolder="Antal followers/subsriber"></asp:TextBox>
            <asp:Button ID="ButtonGemKunde" runat="server" Text="Tilføj ny Kunde" OnClick="ButtonGemKunde_Click" /><br />
            <br />

            <asp:Repeater ID="RepeaterKunder" runat="server" DataSourceID="SqlDataSourceKunder">
                <ItemTemplate>
                    <asp:TextBox ID="TextBoxShowKate" runat="server" Text='<%#Eval("KundeNavn") %>' Width="200"></asp:TextBox>
                    <asp:Button ID="ButtonRedikunde" runat="server" Text="Redigere" />
                    <asp:Button ID="ButtonSletkunde" runat="server" Text="Slet" />
                    <br />
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceKunder" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [KundeNavn] FROM [Kunde]"></asp:SqlDataSource>
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

