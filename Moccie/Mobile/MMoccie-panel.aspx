<%@ Page Title="" Language="C#" MasterPageFile="~/Mobile/MMasterPage.master" AutoEventWireup="true" CodeFile="MMoccie-panel.aspx.cs" Inherits="Moccie_panel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="footerfix">
        <article class="FrontText">
            <div style="width: 200px; margin: 20px auto 0 auto;">
                <label class="floatLeft">Username:</label>
                <asp:TextBox ID="TextBoxUsername" runat="server" Width="200px" placeholder="..."></asp:TextBox>
                <label class="floatLeft">Password:</label>
                <asp:TextBox ID="TextBoxPassword" runat="server" Width="200px"></asp:TextBox>
                <br />
                <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" CssClass="floatLeft" />
            </div>

            <div class="ErrorBox" style="margin-top:100px;">
                <asp:Label ID="LabelMsg" runat="server" Text="" CssClass="ErrorMsg"></asp:Label>
            </div>
        </article>
    </section>

    <div class="footerClear" style="margin-bottom:310px;"></div>
</asp:Content>

