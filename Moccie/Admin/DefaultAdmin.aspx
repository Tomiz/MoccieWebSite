<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="DefaultAdmin.aspx.cs" Inherits="Admin_DefaultAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="AdminSection">
        <div class="AdminArticle">
            <article class="Overskrift">
                <h2>Overskrift og tekst på forsiden</h2>
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSourceoverskrifttext">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox_FrontOverskrift" runat="server" Text='<%#Eval("Overskrift") %>'></asp:TextBox>
                        <asp:TextBox ID="TextBox_FrontText" runat="server" Text='<%#Eval("Text") %>'></asp:TextBox>
                        <br />
                        <asp:Button ID="Button_FrontPage" runat="server" Text="Gem" OnClick="Button_FrontPage_Click" />
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceoverskrifttext" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [Overskrift], [Text] FROM [InfoText] WHERE ([Lokation] = @Lokation)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="FrontPage" Name="Lokation" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>

            </article>

            <article class="Infomation">
                <h2>Information omkring enten dig selv eller hjemmesiden</h2>
                <asp:TextBox ID="TextBox_AboutOverskrift" runat="server"></asp:TextBox>
                <asp:TextBox ID="TextBox_AboutText" runat="server"></asp:TextBox>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceGetFrontPageImageName">
                    <ItemTemplate>
                        <p>
                            <%#Eval("Image") %>
                        </p>
                    </ItemTemplate>

                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceGetFrontPageImageName" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT * FROM [IndexText]"></asp:SqlDataSource>
                <br />
                <asp:Button ID="Button_About" runat="server" Text="Gem" OnClick="Button_About_Click" />
            </article>

            <article class="Footer">
                <h2>Footer information( husk "|" mellem info)</h2>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="Button_Footer" runat="server" Text="Gem" OnClick="Button_Footer_Click" />
            </article>
        </div>
    </section>
</asp:Content>

