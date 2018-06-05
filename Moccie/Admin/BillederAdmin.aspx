<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="BillederAdmin.aspx.cs" Inherits="Admin_NewsAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentBilled {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="tegnogbilled">
        <div class="ErrorBox" style="margin-left: 80px;">
            <asp:Label ID="Label_besked" runat="server" Text="" CssClass="ErrorMsg"></asp:Label>
        </div>

        <asp:Button class="accordion" runat="server" Text="Tilføj nyt Produkt" OnClientClick="return false;" />

        <!-- Tilføj nyt Produkt -->
        <div class="panel">
            <p>Vælg Kategori</p>
            <asp:DropDownList ID="DropDownListGrupper" runat="server" DataSourceID="SqlDataSourceGrupper" DataTextField="Navn" DataValueField="Id"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceGrupper" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT Navn, Id FROM ProduktGruppe WHERE (Fk_ProduktKategori = @Fk_ProduktKategori)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <p>Dato</p>
            <asp:TextBox ID="TextBoxDate" runat="server" TextMode="Date" CssClass="textbox" Width="165px"></asp:TextBox>

            <p>Navn på Billedet</p>
            <asp:TextBox ID="TextBoxHeaderText" runat="server" Text="" placeholder="Produkt Navn"></asp:TextBox>

            <p>Upload billed</p>
            Upload billede<asp:FileUpload ID="FileUploadProduktBilled" runat="server" /><br />
            <br />
            <p>Title på info Box</p>
            <asp:TextBox ID="TextBoxHeaderInfoText" runat="server" Text="" Placeholder="Produkt Info Title"></asp:TextBox>
            <p>Info i infoboks</p>
            <asp:TextBox ID="TextBoxInfoText" runat="server" TextMode="MultiLine" Rows="3" Text="" Placeholder="Produkt Info text"></asp:TextBox>
            <script type="text/javascript">
                CKEDITOR.replace("ContentPlaceHolder1_TextBoxInfoText");
            </script>

            <br />
            <%--<p>Valg af kunde</p>
            <asp:DropDownList ID="DropDownListKunde" runat="server" DataSourceID="SqlDataSourceKunde" DataTextField="KundeNavn" DataValueField="Id">
                <asp:ListItem Text="Opret kunde først" Value="0" />
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceKunde" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [KundeNavn], [Id] FROM [Kunde] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="4" Name="Id" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>--%>

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
                        <%--<asp:DropDownList ID="DropDownListProduktEjer" runat="server" DataSourceID="SqlDataSourceProduktKunder" DataTextField="KundeNavn" DataValueField="Id" Width="100px" SelectedValue='<%# Eval("KundeId") %>'></asp:DropDownList>--%>
                        <asp:TextBox ID="TextBoxProduktheader" runat="server" Text='<%#Eval("ProduktHeader") %>' Width="275"></asp:TextBox>
                        <span style="margin-left: 5px;">Information omkring billedet.</span><br />
                        <asp:TextBox ID="TextBoxProduktInfo" runat="server" Text='<%#Eval("ProduktInfo") %>' TextMode="MultiLine" Height="100"></asp:TextBox>

                        <asp:Button ID="RedigerProd" runat="server" Text="Rediger" CommandArgument='<%#Eval("ProduktId") %>' CommandName="RedigerProdukt" />
                        <asp:Button ID="SletProd" runat="server" Text="Slet" CommandArgument='<%#Eval("ProduktId") %>' CommandName="SletProdukt" />
                        <hr />
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource runat="server" ID="SqlDataSourceRedProdukt" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT DISTINCT Produkter.ProduktHeader, Produkter.Navn, Produkter.ProduktInfo, ProduktGruppe.Navn AS ProduktKategori, Produkter.Id AS ProduktId, Kunde.Id AS KundeId, Kunde.KundeNavn, ProduktGruppe.Id AS GruppeId, ProduktKategori.Id FROM Produkter INNER JOIN ProduktGruppe ON Produkter.Fk_ProduktGruppe = ProduktGruppe.Id INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id INNER JOIN ProduktKategori ON Produkter.Fk_ProduktKategori = ProduktKategori.Id AND ProduktGruppe.Fk_ProduktKategori = ProduktKategori.Id WHERE (ProduktKategori.Id = 2)"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceProduktkategoriDropdown" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT DISTINCT Id AS ProduktGruppeId, Navn FROM ProduktGruppe"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceProduktKunder" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [KundeNavn], [Id] FROM [Kunde]"></asp:SqlDataSource>

            </div>
        </div>

        <!-- Tilføj/Slet kategorier -->
        <asp:Button class="accordion" runat="server" Text="Tilføj/Slet kategorier" OnClientClick="return false;" />
        <div class="panel">
            <asp:TextBox ID="NyKate" runat="server" Text="" Placeholder="Tilføj Ny Kategori" Width="50%"></asp:TextBox>
            <asp:DropDownList ID="DropDownListProduktKategori" runat="server" DataSourceID="SqlDataSourceKategoriProdukt" DataTextField="Navn" DataValueField="Id" Width="45%"></asp:DropDownList>
            <br />
            <asp:FileUpload ID="FileUploadkategori" runat="server" CssClass="clearBoth width100" />
            <asp:Button ID="GemKate" runat="server" Text="Tilføj ny Kategori" CssClass="clearBoth Top10" OnClick="GemKate_Click" /><br />
            <br />
            <asp:Repeater ID="Repeaterkategorier" runat="server" DataSourceID="SqlDataSourceKategorier" OnItemCommand="Repeaterkategorier_ItemCommand">
                <ItemTemplate>
                    <asp:TextBox ID="TextBoxShowKate" runat="server" Text='<%#Eval("Navn") %>' Width="200"></asp:TextBox>
                    <asp:FileUpload ID="FileUploadProilePic" runat="server" CssClass="clearBoth Top25" />
                    <img src="../Pictures/KategoriGruppe/<%#Eval("Billed") %>" width="75">
                    <asp:Button ID="Redigerekate" runat="server" Text="Redigere" />
                    <asp:Button ID="SletKate" runat="server" Text="Slet" CommandArgument='<%#Eval("Id") %>' CommandName="SletKate" />
                    <hr />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceKategoriProdukt" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [ProduktKategori]"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceKategorier" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [Navn], [Billed], [Id] FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

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

