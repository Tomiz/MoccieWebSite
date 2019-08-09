<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_moccie.master" AutoEventWireup="true" CodeFile="Default_moccie.aspx.cs" Inherits="Default_moccie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <section style="width: 1200px; margin: auto;">
        
        <div class="FrontImg">
            
        </div>

        

        <article class="AboutText">
            <asp:Repeater ID="Repeater_AboutSite" runat="server" DataSourceID="SqlDataSourceAboutMoccie">
                <ItemTemplate>
                    <div class="AboutInfo">
                    <h2><%#Eval("Overskrift") %> </h2>
                    <p>
                        <%#Eval("Text") %>
                    </p>
                    </div>
                </ItemTemplate>
               </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceAboutMoccie" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Overskrift, Text FROM [IndexText]"></asp:SqlDataSource>
        </article>
    </section>


    <asp:MultiView ID="MultiViewTegn" runat="server" ActiveViewIndex="0">

        <!-- Produkt Gruppe -->
        <asp:View ID="ViewGrupperGrupper" runat="server" EnableViewState="true">
            <section>
               <article id="FrontGrupper">

                    <asp:Repeater ID="RepeaterTegn" runat="server" DataSourceID="SqlDataSourceGruppeKategori">
                        <ItemTemplate>
                            <div class="FrontGruppeImg">
                                <div id="DividedImg">
                                    <asp:LinkButton ID="LinkButtonGrupper" runat="server" OnCommand="LinkButtonGrupper_Command" CommandArgument='<%#Eval("Id") %>' CssClass="GroupLink">
                                    <img src="Pictures/KategoriGruppe/<%#Eval("Billed") %>" width="300px" height="150px" />
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceGruppeKategori" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Id, Fk_ProduktKategori, Navn, Billed, HiddenId FROM ProduktGruppe WHERE (Fk_ProduktKategori = @Fk_ProduktKategori) ORDER BY Navn">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="Fk_ProduktKategori" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                </article>
            </section>

            <%--<div class="footerClear" style="margin-bottom: 99px;"></div>--%>
        </asp:View>
    </asp:MultiView>
</asp:Content>

