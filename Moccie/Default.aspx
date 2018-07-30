<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentHome {
            background-color: #555;
        }
        /*.mySlides {display:none;}*/
    </style>
    <link href="Style/SliderCss.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section style="width: 1200px; margin: auto;">
        <article class="FrontText" style="height:110px;">
            <asp:Repeater ID="Repeater_FrontPageInfo" runat="server" DataSourceID="SqlDataSourceIndexText">
                <ItemTemplate>
                    <h2><%#Eval("Overskrift") %></h2>
                    <p><%#Eval ("Text") %></p>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceIndexText" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [InfoText] WHERE ([Lokation] = @Lokation)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="FrontPage" Name="Lokation" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </article>

        <article class="w3-content w3-display-container">
            <div id="ImageSlider">
                <ul style="padding-top: 66.6667%; height: 0px;">
                    <asp:Repeater ID="Repeater_slider" runat="server" DataSourceID="SqlDataSourceSlider">
                        <ItemTemplate>
                            <li><img class="mySlides ImageSlide" src="Pictures/Produkter/<%#Eval("Billed") %>"></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceSlider" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT TOP (3) Produkter.Id, Produkter.Navn, Billeder.Billed, Billeder.Fk_ProduktBilled, Produkter.Dato FROM Produkter INNER JOIN Billeder ON Produkter.Id = Billeder.Fk_ProduktBilled ORDER BY Produkter.Dato DESC, Produkter.Id DESC"></asp:SqlDataSource>

                <asp:Button ID="ButtonPrev" runat="server" Text="❮" CssClass="w3-button w3-black w3-display-left" OnClientClick="return plusDivs(-1);" UseSubmitBehavior="False" />
                <asp:Button ID="ButtonNext" runat="server" Text="❯" CssClass="w3-button w3-black w3-display-right" OnClientClick="return plusDivs(1);" UseSubmitBehavior="False" />
            </div>
        </article>

        <script>
            var slideIndex = 1;
            showDivs(slideIndex);

            function plusDivs(n) {
                showDivs(slideIndex += n);
            }

            function showDivs(n) {
                var i;
                var x = document.getElementsByClassName("mySlides");
                if (n > x.length) { slideIndex = 1 }
                if (n < 1) { slideIndex = x.length }
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                x[slideIndex - 1].style.display = "block";
            }

        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
               x[i].style.display = "none";  
            }
            myIndex++;
            if (myIndex > x.length) {myIndex = 1}    
            x[myIndex-1].style.display = "block";  
            setTimeout(carousel, 5000); // Change image every 2 seconds
        }

        </script>

        <%--<article class="slider_box">
            <div id="ninja-slider">
                <div class="inner">
                    <ul>
                        <asp:Repeater ID="Repeater_slider" runat="server" DataSourceID="SqlDataSourceSlider">
                            <ItemTemplate>
                                <li><a class="ns-img" href="Pictures/Produkter/<%#Eval("Billed") %>"></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceSlider" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT TOP (3) Produkter.Id, Produkter.Navn, Billeder.Billed, Billeder.Fk_ProduktBilled, Produkter.Dato FROM Produkter INNER JOIN Billeder ON Produkter.Id = Billeder.Fk_ProduktBilled ORDER BY Produkter.Dato DESC, Produkter.Id DESC"></asp:SqlDataSource>
                    </ul>
                </div>
            </div>
        </article>--%>

        <article class="About">
            <asp:Repeater ID="Repeater_AboutSite" runat="server" DataSourceID="SqlDataSourceAboutMoccie">
                <ItemTemplate>
                    <h2><%#Eval("Overskrift") %> </h2>
                    <p>
                        <%#Eval("Text") %>
                    </p>

                    <img src="Pictures/Profil/<%#Eval("Image") %>" width="150" height="150" class="profilePic" />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceAboutMoccie" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [IndexText]"></asp:SqlDataSource>
        </article>
    </section>

</asp:Content>

