<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="DefaultAdmin.aspx.cs" Inherits="Admin_DefaultAdmin" validateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentHome {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="AdminSection">
        <div class="AdminArticle">
            <article class="Overskrift">
                <h2>Overskrift og tekst på forsiden</h2>
                <asp:Repeater ID="RepeaterAdminDefaultTextboxText" runat="server" DataSourceID="SqlDataSourceoverskrifttext">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox_FrontOverskrift" runat="server" Text='<%#Eval("Overskrift") %>'></asp:TextBox>
                        <asp:TextBox ID="TextBox_FrontText" runat="server" Text='<%#Eval("Text") %>'></asp:TextBox>

                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceoverskrifttext" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT [Overskrift], [Text] FROM [InfoText] WHERE ([Lokation] = @Lokation)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="FrontPage" Name="Lokation" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Button ID="Button_FrontPage" runat="server" Text="Gem" OnClick="Button_FrontPage_Click" />
            </article>

            <article class="Infomation">
                <asp:Repeater ID="RepeaterAdminAboutText" runat="server" DataSourceID="SqlDataSourceGetFrontPageImageName">
                    <ItemTemplate>
                        <h2>Information omkring enten dig selv eller hjemmesiden</h2>
                        <asp:TextBox ID="TextBox_AboutOverskrift" runat="server" Text='<%#Eval("Overskrift") %>'></asp:TextBox>
                        <asp:TextBox ID="TextBox_AboutText" runat="server" TextMode="MultiLine" Rows="3" Text='<%#Eval("Text") %>'></asp:TextBox>

                        <script type="text/javascript">
                            CKEDITOR.replace("ContentPlaceHolder1_RepeaterAdminAboutText_TextBox_AboutText_0");
                        </script>

                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceGetFrontPageImageName" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [IndexText]"></asp:SqlDataSource>
                <br />
                <asp:Button ID="Button_About" runat="server" Text="Gem" OnClick="Button_About_Click" />
                <br />

                <asp:Repeater ID="RepeaterAdminAboutPicture" runat="server" DataSourceID="SqlDataSourceProfilePic">
                    <ItemTemplate>
                        <asp:FileUpload ID="FileUploadProilePic" runat="server" CssClass="clearBoth Top25" />
                        <p>
                            <%#Eval("Image") %>
                        </p>
                        <img src="../Pictures/Profil/<%#Eval("Image") %>" width="75" class="">
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceProfilePic" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [IndexText]"></asp:SqlDataSource>
                <br />
                <asp:Button ID="ButtonProfilePic" runat="server" Text="Gem" CssClass="Top10" OnClick="ButtonProfilePic_Click" />
            </article>

            <article class="Footer">
                <h2>Footer information( husk "|" mellem info)</h2>
                <asp:Repeater ID="RepeaterFooter" runat="server" DataSourceID="SqlDataSourceFooter">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBoxFootertext" runat="server" Text='<%#Eval("Text") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceFooter" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [InfoText] WHERE ([Lokation] = @Lokation)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Footer" Name="Lokation" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Button ID="Button_Footer" runat="server" Text="Gem" OnClick="Button_Footer_Click" />
            </article>
        </div>
    </section>
</asp:Content>

