<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Moccie-panel.aspx.cs" Inherits="Moccie_panel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <article class="FrontText" style="margin-top:30px;">
            <span style="float:left; margin-left:440px;">Brugernavn:</span> <span style="float:right; margin-right:420px;"><asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox></span>
            <br /><br />
            <span style="float:left; margin-left:440px;">Password:</span> <span style="float:right; margin-right:420px;"><asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox></span>
            <br /><br />
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
        </article>
    </section>
</asp:Content>

