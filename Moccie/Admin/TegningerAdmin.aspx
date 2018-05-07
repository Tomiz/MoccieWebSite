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
        <asp:Button class="accordion" runat="server" Text="Tilføj nyt element" OnClientClick="return false;" />

        <div class="panel">
            <asp:DropDownList ID="DropDownListGrupper" runat="server" DataSourceID="SqlDataSourceGrupper" DataTextField="Navn" DataValueField="Navn"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceGrupper" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [Navn] FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="TextBoxHeaderText" runat="server" Text=""></asp:TextBox>
            Upload billede<asp:FileUpload ID="FileUploadProduktBilled" runat="server" />
            <asp:TextBox ID="TextBoxHeaderInfoText" runat="server" Text=""></asp:TextBox>
            <asp:TextBox ID="TextBoxInfoText" runat="server" Text=""></asp:TextBox>
            <asp:DropDownList ID="DropDownListKunde" runat="server" DataSourceID="SqlDataSourceKunde" DataTextField="KundeNavn" DataValueField="KundeNavn">
                <asp:ListItem Text="Opret kunde først" Value="0" />
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceKunde" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [KundeNavn] FROM [Kunde]"></asp:SqlDataSource>
            <asp:Button ID="ButtonGemProdukt" runat="server" Text="Tilføj nyt Elemet" />
            <!--OnClick="ButtonGemProdukt_Click"-->
        </div>

        <asp:Button class="accordion" runat="server" Text="Redigere nuværende produkter" OnClientClick="return false;" />
        <div class="panel">
            <div>
                <asp:Label ID="Prodkat" runat="server" Text="Kategori"></asp:Label>
                <asp:Label ID="ProdNav" runat="server" Text="Navn"></asp:Label>
                <asp:Label ID="ProdEj" runat="server" Text="Ejer"></asp:Label>
                <asp:Button ID="RedigerProd" runat="server" Text="Rediger" />
                <asp:Button ID="SletProd" runat="server" Text="Slet" />
            </div>
        </div>

        <asp:Button class="accordion" runat="server" Text="Tilføj/Slet kategorier" OnClientClick="return false;" />
        <div class="panel">
            <asp:TextBox ID="NyKate" runat="server" Text="Tilføj ny Kategori"></asp:TextBox>
            <asp:Button ID="GemKate" runat="server" Text="Tilføj ny Kategori" /><br />
            <br />
            <asp:Label ID="ShowKate" runat="server" Text="Kategorier..."></asp:Label>
            <asp:Button ID="Redigerekate" runat="server" Text="Redigere" />
            <asp:Button ID="SletKate" runat="server" Text="Slet" />
        </div>

        <asp:Button class="accordion" runat="server" Text="Kunde" OnClientClick="return false;" />
        <div class="panel">
            <asp:TextBox ID="Kundenavn" runat="server" Text="Kundenavn"></asp:TextBox>
            <asp:TextBox ID="KundeLink" runat="server" Text="Kundelink"></asp:TextBox>
            <asp:DropDownList ID="DropDownListplatform" runat="server" DataSourceID="SqlDataSourcePlaftform" DataTextField="Navn" DataValueField="Id"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourcePlaftform" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [Platform]"></asp:SqlDataSource>
            <asp:TextBox ID="Followers" runat="server" Text="Antal followers/subsriber"></asp:TextBox>
            <asp:Button ID="ButtonGemKunde" runat="server" Text="Tilføj ny Kunde" OnClick="ButtonGemKunde_Click" /><br />
            <br />

            <asp:Repeater ID="RepeaterKunder" runat="server" DataSourceID="SqlDataSourceKunder">
                <ItemTemplate>
                    <asp:Label ID="kunder" runat="server" Text='<%#Eval("KundeNavn") %>'></asp:Label>
                    <asp:Button ID="ButtonRedikunde" runat="server" Text="Redigere" />
                    <asp:Button ID="ButtonSletkunde" runat="server" Text="Slet" />
                    <br />
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceKunder" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [KundeNavn] FROM [Kunde]"></asp:SqlDataSource>
        </div>

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

