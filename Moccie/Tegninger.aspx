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
                            <img src="Pictures/Slider/pic1.jpeg" width="250px" height="200px" />
                            <div class="container">
                                <p>Beach</p>
                            </div>
                        </asp:LinkButton>
                    </div>
                    <%--<div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="250px" height="200px" />
                        <div class="container">
                            <p>Beach</p>
                        </div>
                    </div>
                    <div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="250px" height="200px" />
                        <div class="container">
                            <p>Beach</p>
                        </div>
                    </div>
                    <div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="250px" height="200px" />
                        <div class="container">
                            <p>Beach</p>
                        </div>
                    </div>
                    <div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="250px" height="200px" />
                        <div class="container">
                            <p>Beach</p>
                        </div>
                    </div>
                    <div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="250px" height="200px" />
                        <div class="container">
                            <p>Beach</p>
                        </div>
                    </div>
                    <div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="250px" height="200px" />
                        <div class="container">
                            <p>Beach</p>
                        </div>
                    </div>
                    <div id="Grupper">
                        <img src="Pictures/Slider/pic1.jpeg" width="250px" height="200px" />
                        <div class="container">
                            <p>Beach</p>
                        </div>
                    </div>--%>
                </article>
            </section>
        </asp:View>
        <asp:View ID="ViewTegnGruppeProd" runat="server" EnableViewState="false">
            <div id="GruppeMenu">
                <a href="#">Link 1</a>
                <a href="#">Link 2</a>
                <a href="#">Link 3</a>
                <a href="#">Link 4</a>

            </div>
            <article id="ProduktGruppe">
                <div id="Grupper">
                    <img src="Pictures/Slider/pic1.jpeg" width="250px" height="200px" />
                    <div class="container">
                        <p>Beach</p>
                    </div>
            </article>

        </asp:View>
    </asp:MultiView>
</asp:Content>


