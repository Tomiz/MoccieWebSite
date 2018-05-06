<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Moccie-panel.aspx.cs" Inherits="Moccie_panel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="footerfix">
        <article class="FrontText">
            <div style="width:200px; margin: 20px auto 0 auto;">
                <asp:Label ID="MessageBox" runat="server" Text="Label" Visible="False"></asp:Label>
                <label class="floatLeft">Username:</label>
                <asp:TextBox ID="TextBoxUsername" runat="server" Width="200px"></asp:TextBox>
                <label class="floatLeft">Password:</label>
                <asp:TextBox ID="TextBoxPassword" runat="server" Width="200px"></asp:TextBox>
                <br />
                <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" CssClass="floatLeft"/>
            </div>
        </article>
    </section>
</asp:Content>

