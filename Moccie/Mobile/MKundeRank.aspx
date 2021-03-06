﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Mobile/MMasterPage.master" AutoEventWireup="true" CodeFile="MKundeRank.aspx.cs" Inherits="KundeRank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentRank {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <article class="FrontText">
            <h2>Info omkring Ranking på min hjemmeside
            </h2>
            <p>Rank listen er en ny ide.</p>
        </article>

        <div class="Ranker">

            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourcerank" RepeatColumns="2" RepeatDirection="Horizontal" CellPadding="10" >
                <ItemTemplate>
                    <p>* <%#Eval("KundeNavn") %></p>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourcerank" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT [KundeNavn], [HiddenId] FROM [Kunde] ORDER BY [HiddenId]"></asp:SqlDataSource>
        </div>
        <%--<div id="RanklisteTopP">
            <div class="RankHeader">
                <h1>Top number of item bought</h1>
            </div>
            <div class="Ranker">
                <table>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <tr>
                                <th><%#Eval("KundeNavn") %></th>
                                <th><%#Eval("Fk_Kunde") %></th>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <style>
                    table {
                        font-family: arial, sans-serif;
                        border-collapse: collapse;
                        width: 100%;
                    }

                    td, th {
                        border: 1px solid #dddddd;
                        text-align: left;
                        padding: 8px;
                        text-align: center;
                        height:57px;
                    }

                    tr:nth-child(even) {
                        background-color: #dddddd;
                    }
                </style>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT COUNT(Produkter.Fk_Kunde) AS Fk_Kunde, Kunde.KundeNavn FROM Produkter INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id AND Produkter.Fk_Kunde = Kunde.Id AND Produkter.Fk_Kunde = Kunde.Id GROUP BY Produkter.Fk_Kunde, Kunde.KundeNavn ORDER BY Fk_Kunde DESC"></asp:SqlDataSource>
            </div>
        </div>
        <div id="RanklisteTopV">
            <div class="RankHeader">
                <h1>Top number of viewers</h1>
            </div>
            <div class="Ranker">
                <table>
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <tr>
                                <th><%#Eval("KundeNavn") %></th>
                                <th><%#Eval("Follow") %></th>
                                <th><img src="/Pictures/platform/<%#Eval("Picture") %>" width="40" /></th>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Platform.Img AS Picture, Kunde.KundeNavn, Kunde.AntalFollowers AS Follow FROM Kunde INNER JOIN Platform ON Kunde.Fk_Platform = Platform.Id GROUP BY Kunde.KundeNavn, Kunde.AntalFollowers, Platform.Img ORDER BY Follow DESC"></asp:SqlDataSource>
            </div>
        </div>--%>
    </section>
</asp:Content>

