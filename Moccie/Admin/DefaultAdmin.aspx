<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="DefaultAdmin.aspx.cs" Inherits="Admin_DefaultAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <article class="">
            <asp:TextBox ID="TextBox_FrontOverskrift" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox_FrontText" runat="server"></asp:TextBox>
      <br /><asp:Button ID="Button_FrontPage" runat="server" Text="Gem" OnClick="Button_FrontPage_Click" />
        </article>

        <article class="Aboutt">
            <asp:TextBox ID="TextBox_AboutOverskrift" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox_AboutText" runat="server"></asp:TextBox>
      <br /><asp:Button ID="Button_About" runat="server" Text="Gem" OnClick="Button_About_Click" />
        </article>

        <article class="Footer">
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
      <br /><asp:Button ID="Button_Footer" runat="server" Text="Gem" OnClick="Button_Footer_Click" />
        </article>
    </section>
</asp:Content>

