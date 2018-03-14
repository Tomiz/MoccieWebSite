<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentHome {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <article class="FrontText">
            <asp:Repeater ID="Repeater_FrontPageInfo" runat="server" DataSourceID="SqlDataSourceMoccie">
                <ItemTemplate>
                    <h2><%#Eval("Overskrift") %></h2>
                    <p><%#Eval ("Text") %></p>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceIndexText" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [Overskrift], [Text] FROM [IndexText]"></asp:SqlDataSource>
        </article>

        <script>
            $(document).ready(function () {
                $('.slider').bxSlider();
            });
        </script>
        <article class="slider">
            <img src="Pictures/Slider/pic1.jpeg" />
            <img src="Pictures/Slider/pic2.jpeg" />
            <img src="Pictures/Slider/pic3.jpeg" />
            <%--<div>I am another slide.</div>--%>
        </article>

        <article class="About">
            <asp:Repeater ID="Repeater_AboutSite" runat="server" DataSourceID="SqlDataSourceAboutSite">
                <ItemTemplate>
                    <h2><%#Eval("") %> </h2>
                    <p>
                        <%#Eval("") %>
                    </p>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceAboutSite"></asp:SqlDataSource>
            <h2>About </h2>
            <p>
                Lorem Ipsum er ganske enkelt fyldtekst fra print- 
                og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden
                1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for 
                at trykke en bog til sammenligning af forskellige skrifttyper. 
                Lorem Ipsum har ikke alene overlevet fem århundreder, 
                men har også vundet indpas i elektronisk typografi uden væsentlige ændringer. 
                Sætningen blev gjordt kendt i 1960'erne med lanceringen af Letraset-ark, 
            </p>
                <p>som indeholdt afsnit med </p>
                <p>Lorem Ipsum, og senere </p>
                <p>med layoutprogrammer</p>
                <p>som Aldus PageMaker, </p>
                <p>som også indeholdt en</p>
                <p>udgave af Lorem Ipsum.g</p>
            

            <%--<div class="PicBox">--%>
                <img src="Pictures/profilPic.png" width="150" height="150" class="profilePic" />
            <%--</div>--%>
        </article>
    </section>


</asp:Content>

