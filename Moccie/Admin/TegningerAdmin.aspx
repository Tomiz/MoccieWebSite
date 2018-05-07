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
            Upload billede<asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:TextBox ID="TextBoxHeaderInfoText" runat="server" Text=""></asp:TextBox>
            <asp:TextBox ID="TextBoxInfoText" runat="server" Text=""></asp:TextBox>
            <asp:TextBox ID="TextBox4" runat="server" Text="Link to owner"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Tilføj nyt Elemet" />
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

