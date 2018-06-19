<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="KontaktAdmin.aspx.cs" Inherits="Admin_KontaktAdmin"  ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentKont {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="tegnogbilled">
        <div class="ErrorBox" style="margin-left: 80px;">
            <asp:Label ID="Label_besked" runat="server" Text="" CssClass="ErrorMsg"></asp:Label>
        </div>

        <asp:Button class="accordion" runat="server" Text="Ændre Overskrift" OnClientClick="return false;" />

        <!-- Ændre Overskrift -->
        <div class="panel">


            <article class="Overskrift">
                <h2>Overskrift og tekst på forsiden</h2>
                <asp:Repeater ID="RepeaterAdminKontaktTextboxText" runat="server" DataSourceID="SqlDataSourceoverskrifttext">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox_KontOverskrift" runat="server" Text='<%#Eval("Overskrift") %>'></asp:TextBox>
                        <asp:TextBox ID="TextBox_KontText" runat="server" Text='<%#Eval("Text") %>'></asp:TextBox>

                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceoverskrifttext" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Overskrift, Text FROM InfoText WHERE (Lokation = @Lokation)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ContainPage" Name="Lokation" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Button ID="Button_PicPage" runat="server" Text="Gem" OnClick="Button_PicPage_Click" />
            </article>

            <!--OnClick="Ændre Overskrift_Click"-->
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

