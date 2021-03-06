﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Mobile/MMasterPage.master" AutoEventWireup="true" CodeFile="MPriser.aspx.cs" Inherits="Priser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="GruppeMenu">
        <asp:Repeater ID="Repeater_ProduktMenu" runat="server" DataSourceID="SqlDataSource3">
            <ItemTemplate>
                <a href="priser.aspx?KategoriNavn=<%#Eval ("KategoriNavn") %>"><%#Eval ("KategoriNavn") %></a>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT KategoriNavn, Id FROM PrisKategori"></asp:SqlDataSource>
    </div>

    <section>
        <article class="FrontText">
            <asp:Repeater ID="Repeater_kategoriOverskrivt" runat="server" DataSourceID="SqlDataSourcekategoriOverskrift">
                <ItemTemplate>
                    <h2><%#Eval ("KategoriNavn") %></h2>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSourcekategoriOverskrift" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT KategoriNavn FROM PrisKategori WHERE (KategoriNavn = @KategoriNavn)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="KategoriNavn" Name="KategoriNavn" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <p>Da det er at jeg har flere forskellige former for tegninger har jeg valgt at lave specifikke grupper for hvert emne, så det er nemmere at over skue </p>

            <article id="Produktalign">
                <%--<asp:GridView ID="GridViewPriser" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSourcePriser" CssClass="DetajleGrid">
                    <Columns>
                        <asp:BoundField DataField="Navn" HeaderText="Styles" SortExpression="Navn" ItemStyle-Width="250px"></asp:BoundField>
                        <asp:TemplateField ShowHeader="False" HeaderText="Lidt Detajler" ItemStyle-Width="250px">
                            <ItemTemplate>
                                <asp:Button ID="ButtonLidtDetajler" runat="server" CausesValidation="false" Text='<%#Eval("LidtDetajler") %>' CssClass="DetajleGridButtons" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False" HeaderText="Mellem Detajler" ItemStyle-Width="250px">
                            <ItemTemplate>
                                <asp:Button ID="ButtonMellemDetajler" runat="server" CausesValidation="false" Text='<%#Eval("MellemDetajler") %>' CssClass="DetajleGridButtons" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False" HeaderText="Stor Detajler" ItemStyle-Width="250px">
                            <ItemTemplate>
                                <asp:Button ID="ButtonStorDetajler" runat="server" CausesValidation="false" Text='<%#Eval("StorDetajler") %>' CssClass="DetajleGridButtons" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>--%>
                <table id="PrisTableRow" class="DetajleGrid blueTable">

                    <thead>
                        <tr>
                            <th class="DetajleGridButtons">Pris Pakker:<br /><br />Styling</th>
                            <th class="DetajleGridButtons">Lille</th>
                            <th class="DetajleGridButtons">Mellem</th>
                            <th class="DetajleGridButtons">Stor</th>
                        </tr>
                    </thead>

                    <asp:Repeater ID="RepeaterDetajlePriser" runat="server" DataSourceID="SqlDataSourcePriser" OnItemCommand="RepeaterDetajlePriser_ItemCommand">
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <th class="DetajleGridButtons">
                                        <%--<asp:Literal ID="Literal1" runat="server" Text='<%#Eval("Navn") %>'></asp:Literal>--%>
                                        <%--<asp:HiddenField ID="HiddenField_OrderId" Value='<%#Eval("Id") %>' runat="server" />--%>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Navn") %>'></asp:Label>
                                    </th>

                                    <td class="DetajleGridButtons">
                                        <%--<asp:Button ID="ButtonLidtDetajler" runat="server" CausesValidation="false" Text='<%#Eval("LidtDetajler") %>' CssClass="DetajleGridButtons" OnCommand="ButtonLidtDetajler_Command" CommandName="DetajlerLidtClick" CommandArgument='<%#Eval("Id") %>'/>--%>
                                        <asp:Button ID="ButtonLidtDetajler" runat="server" CausesValidation="false" Text='<%#Eval("LidtDetajler") %>' CssClass="DetajleGridButtons" CommandName="DetajlerLidtClick" CommandArgument="lilleKnap" />
                                    </td>
                                    <td class="DetajleGridButtons">
                                        <%--<asp:Button ID="ButtonMellemDetajler" runat="server" CausesValidation="false" Text='<%#Eval("MellemDetajler") %>' CssClass="DetajleGridButtons" OnCommand="ButtonMellemDetajler_Command" CommandName="DetajlerMellemClick" CommandArgument='<%#Eval("Id") %>'/>--%>
                                        <asp:Button ID="ButtonMellemDetajler" runat="server" CausesValidation="false" Text='<%#Eval("MellemDetajler") %>' CssClass="DetajleGridButtons" CommandName="DetajlerMellemClick" CommandArgument="mellemKnap" />
                                    </td>
                                    <td class="DetajleGridButtons">
                                        <%--<asp:Button ID="ButtonStorDetajler" runat="server" CausesValidation="false" Text='<%#Eval("StorDetajler") %>' CssClass="DetajleGridButtons" OnCommand="ButtonStorDetajler_Command" CommandName="DetajlerStorClick" CommandArgument='<%#Eval("Id") %>'/>--%>
                                        <asp:Button ID="ButtonStorDetajler" runat="server" CausesValidation="false" Text='<%#Eval("StorDetajler") %>' CssClass="DetajleGridButtons" CommandName="DetajlerStorClick" CommandArgument="storKnap" />
                                    </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tfoot>
                        <tr>
                            <th class="DetajleGridButtons">Pris</th>
                            <th class="DetajleGridButtons">1€</th>
                            <th class="DetajleGridButtons">2€</th>
                            <th class="DetajleGridButtons">3€</th>
                        </tr>
                    </tfoot>
                    <tr>
                </table>
                <asp:Button ID="ButtonGem" runat="server" Text="Gem" CssClass="floatLeft" OnClick="ButtonGem_Click" />
                <asp:SqlDataSource runat="server" ID="SqlDataSourcePriser" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT DISTINCT Detajler.Navn, LidtDetajler.Navn AS LidtDetajler, MellemDetajler.Navn AS MellemDetajler, StorDetajler.Navn AS StorDetajler, LidtDetajler.Id, StorDetajler.Id AS Expr1, MellemDetajler.Id AS Expr2 FROM Detajler INNER JOIN LidtDetajler ON Detajler.Id = LidtDetajler.Fk_Detajler INNER JOIN MellemDetajler ON Detajler.Id = MellemDetajler.Fk_Detajler INNER JOIN StorDetajler ON Detajler.Id = StorDetajler.Fk_detajler"></asp:SqlDataSource>

                <asp:Repeater ID="RepeaterPrisOverslag" runat="server" DataSourceID="SqlDataSourcePris">
                    <ItemTemplate>
                        <p class="floatRight"><%#Eval("KategoriNavn") %> - <%#Eval("StandardPris") %>€</p>
                        <%--<asp:Label ID="LabelPris" runat="server" Text='<%#Eval("KategoriNavn")%>' CssClass="floatRight"></asp:Label> --%>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourcePris" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT [StandardPris], [KategoriNavn] FROM [PrisKategori] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="Id" Name="Id" Type="Int32"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>

            </article>
        </article>
    </section>
</asp:Content>

