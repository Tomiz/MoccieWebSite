<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="KundeRank.aspx.cs" Inherits="KundeRank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentRank {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <h2><%#Eval("KundeNavn") %> <%#Eval("Fk_Kunde") %></h2>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT COUNT(Produkter.Fk_Kunde) AS Fk_Kunde, Kunde.KundeNavn FROM Produkter INNER JOIN Kunde ON Produkter.Fk_Kunde = Kunde.Id AND Produkter.Fk_Kunde = Kunde.Id AND Produkter.Fk_Kunde = Kunde.Id GROUP BY Produkter.Fk_Kunde, Kunde.KundeNavn ORDER BY Fk_Kunde DESC"></asp:SqlDataSource>
</asp:Content>

