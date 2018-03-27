<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tegninger.aspx.cs" Inherits="Tegninger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentTegn {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="ViewGrupper1" runat="server" EnableViewState="true">
            <section>
                <article class="FrontText">
                    <h2>Info om grupperne</h2>
                    <p>Da det er at jeg har flere forskellige former for tegninger har jeg valgt at lave specifikke grupper for hvert emne, så det er nemmere at over skue </p>
                </article>

                <article id="ProduktGruppe">
                    <div id="Grupper">
                        <asp:LinkButton ID="LinkButtonGrupper" runat="server" OnCommand="LinkButtonGrupper_Command" CssClass="ALink"> <%--CommandArgument'<%#Eval("Id") %>'--%>
                            <img src="Pictures/Slider/pic1.jpeg" width="300px" height="150px" />
                        </asp:LinkButton>
                    </div>

                    <div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="300px" height="150px" />
                    </div>

                    <div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="300px" height="150px" />
                    </div>

                    <div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="300px" height="150px" />
                    </div>

                </article>
            </section>
        </asp:View>
        <asp:View ID="ViewTegnGruppeProd" runat="server" EnableViewState="false">

            <div id="GruppeMenu">
                <asp:Repeater ID="Repeater_ProduktMenu" runat="server" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                        <a href="<%#Eval ("Fk_ProduktKategori") %>"><%#Eval ("Navn") %></a>
                    </ItemTemplate>
                </asp:Repeater>
                <%--<a href="#">Link 1</a>
                <a href="#">Link 2</a>
                <a href="#">Link 3</a>
                <a href="#">Link 4</a>--%>
                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [Fk_ProduktKategori], [Navn] FROM [ProduktGruppe] WHERE ([Fk_ProduktKategori] = @Fk_ProduktKategori)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <article id="Produktalign">
                <div class="Produkter">
                    <asp:LinkButton ID="LinkButtonEnkeltProdukt" runat="server" OnCommand="LinkButtonEnkeltProdukt_Command" CssClass="ALink">
                    <div class="container">
                        <p>Beach</p>
                    </div>
                    <img src="Pictures/Slider/pic1.jpeg" width="400px" height="200px" />
                    </asp:LinkButton>
                </div>
                <div class="Produkter">
                    <div class="container">
                        <p>Beach</p>
                    </div>
                    <img src="Pictures/Slider/pic1.jpeg" width="400px" height="200px" />
                </div>
                <div class="Produkter">
                    <div class="container">
                        <p>Beach</p>
                    </div>
                    <img src="Pictures/Slider/pic1.jpeg" width="400px" height="200px" />
                </div>
                <div class="Produkter">
                    <div class="container">
                        <p>Beach</p>
                    </div>
                    <img src="Pictures/Slider/pic1.jpeg" width="400px" height="200px" />
                </div>

            </article>

        </asp:View>
        <asp:View ID="ViewEnkeltProdukt" runat="server" EnableViewState="false">
            <div id="ProduktCenter">
                <div id="ProduktMenu">
                    <a href="#">Link 1</a>
                    <a href="#">Link 2</a>
                    <a href="#">Link 3</a>
                    <a href="#">Link 4</a>
                </div>
                <article id="ProduktCenterImage">
                    <img src="Pictures/die.jpg">
                </article>

                <div id="ContentInfo">
                    <h2>hrj</h2>
                    <hr />
                </div>
            </div>

        </asp:View>
    </asp:MultiView>
</asp:Content>


