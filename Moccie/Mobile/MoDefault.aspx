<%@ Page Title="" Language="C#" MasterPageFile="~/Mobile/MMasterPage.master" AutoEventWireup="true" CodeFile="MoDefault.aspx.cs" Inherits="Mobile_MDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section style="width: 100%;">
        <%--<article class="FrontText" style="height:110px;">--%>
        <article class="FrontText" style="height:170px;">
            
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceIndexText">
                <ItemTemplate>
                    <h2>Under Construction</h2>
                    <p>Hey ... My mobilesite is currently under construction, but don't hesitate see my site on your pc.</p>
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
                            <li><img class="mySlides ImageSlide" src="../Pictures/Produkter/<%#Eval("Billed") %>"></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceSlider" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT TOP (3) Produkter.Id, Produkter.Navn, Billeder.Billed, Billeder.Fk_ProduktBilled, Produkter.Dato FROM Produkter INNER JOIN Billeder ON Produkter.Id = Billeder.Fk_ProduktBilled ORDER BY Produkter.Dato DESC, Produkter.Id DESC"></asp:SqlDataSource>

                <asp:Button ID="ButtonPrev" runat="server" Text="&#10094;" CssClass="w3-button w3-black w3-display-left" OnClientClick="return plusDivs(-1);" UseSubmitBehavior="False" />
                <asp:Button ID="ButtonNext" runat="server" Text="&#10095;" CssClass="w3-button w3-black w3-display-right" OnClientClick="return plusDivs(1);" UseSubmitBehavior="False" />
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

        <%--<article class="About">
            <asp:Repeater ID="Repeater_AboutSite" runat="server" DataSourceID="SqlDataSourceAboutMoccie">
                <ItemTemplate>
                    <h2><%#Eval("Overskrift") %> </h2>
                    <p>
                        <%#Eval("Text") %>
                    </p>
                    <img src="../Pictures/Profil/<%#Eval("Image") %>" width="150" height="150" class="profilePic" />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceAboutMoccie" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [IndexText]"></asp:SqlDataSource>
        </article>--%>
    </section>

</asp:Content>

