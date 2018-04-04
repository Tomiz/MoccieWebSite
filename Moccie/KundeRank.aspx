<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="KundeRank.aspx.cs" Inherits="KundeRank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentRank {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="footerfix">
        <article class="FrontText">
            <h2>Info omkring Ranking på min hjemmeside
            </h2>
            <p>Rank listen er en ny ide, lavet af mine programmøre. For at giver jer et overblink over hvem der har handlet med mig førhend. Jerg har valgt at have to grupper, en til at se hvem jeg har lavet flest ting for, og den anden til at vise det kendste jeg har lavet noget for.</p>
        </article>
        <div id="RanklisteTopP">
            <div class="RankHeader">
                <h1>Top number of item bought</h1>
            </div>
            <div class="Ranker">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>

                        <h2><%#Eval("KundeNavn") %> <%#Eval("Fk_Kunde") %></h2>

                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT COUNT(Produkter.Fk_Kunde) AS Fk_Kunde, Kunde.KundeNavn FROM Produkter INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id AND Produkter.Fk_Kunde = Kunde.Id AND Produkter.Fk_Kunde = Kunde.Id GROUP BY Produkter.Fk_Kunde, Kunde.KundeNavn ORDER BY Fk_Kunde DESC"></asp:SqlDataSource>
            </div>
        </div>
        <div id="RanklisteTopV">
            <div class="RankHeader">
                <h1>Top number of viewers</h1>
            </div>
            <div class="Ranker">
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>

                        <h2><%#Eval("KundeNavn") %> <%#Eval("Fk_Kunde") %></h2>

                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT COUNT(Produkter.Fk_Kunde) AS Fk_Kunde, Kunde.KundeNavn FROM Produkter INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id AND Produkter.Fk_Kunde = Kunde.Id AND Produkter.Fk_Kunde = Kunde.Id GROUP BY Produkter.Fk_Kunde, Kunde.KundeNavn ORDER BY Fk_Kunde DESC"></asp:SqlDataSource>
            </div>
        </div>
    </section>
</asp:Content>

