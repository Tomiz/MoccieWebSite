<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kontakt.aspx.cs" Inherits="Kontakt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentKont {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section style="width:1200px; margin:auto;">
        <article class="FrontText">
            <h2>Kontakt</h2>
            <p>Da du skal have muligheden for at enten kontakte mig eller bestille hos mig er det muligt at skrive til mig via min kontakt side.</p>
            <br />
        </article>


        <article id="TekstForm">


            <p>Mit navn er</p>
            <h2>Monique Løfqvist</h2>
            <br />
            <p>Min mail</p>
            <h2>Moccie@moo.dk</h2>
            <br />
            <%--            <p></p>
            <h2></h2>
            <br />--%>
            <p>Du kan se mig live på</p>
            <h2><asp:HyperLink ID="Hyper1" runat="server" NavigateUrl="http://www.Twitch.tv/Moccie">Twitch.tv/Moccie</</asp:HyperLink></h2>
            <br />
            <p>Eller følge hvad der sker på</p>
            <h2><asp:HyperLink ID="Hyper2" runat="server" NavigateUrl="http://www.Twitter.com/M0ccie">Twitter.com/M0ccie</asp:HyperLink></h2>
            <br />
            <p>Du kan også se mine tegninger på min Facebook side</p>
            <h2><asp:HyperLink ID="Hyper3" runat="server" NavigateUrl="https://www.facebook.com/MoccieMoo/">Facebook.com/M0ccieMoo</asp:HyperLink></h2>
            <br />
            <br />
            <img src="Pictures/gMVFPfsX_400x400.jpg" style="border-radius: 50%" />


        </article>

        <article id="KontaktForm">
            <label for="Firstn">Fornavn</label>
            <asp:TextBox ID="TextBoxFornavn" runat="server" placeholder="Dit Fornavn.."></asp:TextBox>

            <label for="Lastn">Efternavn</label>
            <asp:TextBox ID="TextBoxEfternavn" runat="server" placeholder="Dit Efternavn.."></asp:TextBox>

            <label for="Email">Email</label>
            <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="Din Mail.."></asp:TextBox>

            <label for="Email2">Godkend Email</label>
            <asp:TextBox ID="TextBoxEmail2" runat="server" placeholder="Godkend din Mail.."></asp:TextBox>

            <label for="Grund">Årsag</label>
            <asp:DropDownList ID="DropDownListGrund" runat="server">
                <asp:ListItem>Forespørgsel</asp:ListItem>
                <asp:ListItem>Bestilling</asp:ListItem>
                <asp:ListItem>Spørgsmål</asp:ListItem>
            </asp:DropDownList>

            <label for="subject">Begrundelse</label>
            <asp:TextBox ID="TextBoxSubject" runat="server" TextMode="MultiLine" Height="200px" placeholder="Skriv lidt.."></asp:TextBox>

            <asp:Button ID="ButtonSendMail" runat="server" Text="Send" OnClick="ButtonSendMail_Click"/>
            <div class="ErrorBox" style="margin-top:0px; margin-bottom:0px;">
                <asp:Label ID="LabelMsg" runat="server" Text="" CssClass="ErrorMsg"></asp:Label>
            </div>
        </article>
    </section>

    <div class="footerClear" style="margin-bottom: 50px;"></div>
</asp:Content>

