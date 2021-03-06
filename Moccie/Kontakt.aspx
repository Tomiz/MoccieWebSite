﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kontakt.aspx.cs" Inherits="Kontakt" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentKont {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section style="width: 1200px; margin: auto;">
        <article class="FrontText mainrep">

            <asp:Repeater ID="Repeater_KontaktPageInfo" runat="server" DataSourceID="SqlDataSourceIndexText">
                <ItemTemplate>
                    <h2><%#Eval("Overskrift") %></h2>
                    <p><%#Eval ("Text") %></p>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceIndexText" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT * FROM [InfoText] WHERE ([Lokation] = @Lokation)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="ContainPage" Name="Lokation" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <br />
        </article>


        <article id="TekstForm">
            <br />
                        <img src="Pictures/gMVFPfsX_400x400.jpg" style="border-radius: 50%; width:250px;"/>
            <div style="color:#4999aa;">                
            <%--<p>Mit navn er</p>--%>
            <h2>Monique Løfqvist</h2>
            <%--<p>Min mail</p>--%>
            <h2>Moccie@moo.dk</h2>
            <br />
            <%--            <p></p>
            <h2></h2>
            <br />--%>
            <%--<p>Du kan se mig live på</p>--%>
            <h2>
                <asp:HyperLink ID="Hyper1" runat="server" NavigateUrl="http://www.Twitch.tv/Moccie" style="color:#4999aa;">Twitch.tv/Moccie</</asp:HyperLink></h2>
            <br />
            <%--<p>Eller følge hvad der sker på</p>--%>
            <h2>
                <asp:HyperLink ID="Hyper2" runat="server" NavigateUrl="http://www.Twitter.com/M0ccie" style="color:#4999aa;">Twitter.com/M0ccie</asp:HyperLink></h2>
            <br />
            <%--<p>Du kan også se mine tegninger på min Facebook side</p>--%>
            <h2>
                <asp:HyperLink ID="Hyper3" runat="server" NavigateUrl="https://www.facebook.com/MoccieMoo/" style="color:#4999aa;">Facebook.com/M0ccieMoo</asp:HyperLink></h2>
            <br />
            </div>


        </article>

        <article id="KontaktForm">
            <label for="Firstn">First Name</label> <asp:TextBox ID="TextBoxName" runat="server" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextBoxFornavn" runat="server" placeholder="Your First Name.."></asp:TextBox>

            <label for="Lastn">Last Name</label>
            <asp:TextBox ID="TextBoxEfternavn" runat="server" placeholder="Your Last Name.."></asp:TextBox>

            <label for="Email">Email</label>
            <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="Your Mail.."></asp:TextBox>

            <%--<label for="Email2">Confirm Email</label>
            <asp:TextBox ID="TextBoxEmail2" runat="server" placeholder="Confim your Mail.."></asp:TextBox>--%>

            <label for="Grund">Reason</label>
            <asp:DropDownList ID="DropDownListGrund" runat="server">
                <%--<asp:ListItem>Forespørgsel</asp:ListItem>--%>
                <asp:ListItem>Order</asp:ListItem>
                <asp:ListItem>Questions</asp:ListItem>
            </asp:DropDownList>

            <label for="subject">Message</label>

            <asp:TextBox ID="TextBoxSubject" runat="server" TextMode="MultiLine" Rows="3" Text="" Placeholder="Tekts"></asp:TextBox>
            <script type="text/javascript">
                CKEDITOR.replace("ContentPlaceHolder1_TextBoxSubject");
            </script>

            <%--            <asp:TextBox ID="TextBoxSubject" runat="server" TextMode="MultiLine" Height="200px" placeholder="Skriv lidt.."></asp:TextBox>--%>

            <asp:Button ID="ButtonSendMail" runat="server" Text="Send" OnClick="ButtonSendMail_Click" />
            <div class="ErrorBox" style="margin-top: 0px; margin-bottom: 0px;">
                <asp:Label ID="LabelMsg" runat="server" Text="" CssClass="ErrorMsg"></asp:Label>
            </div>
        </article>
    </section>

    <div class="footerClear" style="margin-bottom: 50px;"></div>
</asp:Content>

