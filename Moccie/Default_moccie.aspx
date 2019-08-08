<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_moccie.master" AutoEventWireup="true" CodeFile="Default_moccie.aspx.cs" Inherits="Default_moccie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <section style="width: 1200px; margin: auto;">
        
        <div class="FrontImg">
            
        </div>

        

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

