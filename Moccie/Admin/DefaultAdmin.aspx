<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="DefaultAdmin.aspx.cs" Inherits="Admin_DefaultAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <article class="FrontText">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
      <br /><asp:Button ID="Button2" runat="server" Text="Button" />
        </article>

        <article class="slider">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
      <br /><asp:Button ID="Button1" runat="server" Text="Button" />
        </article>

        <article class="Aboutt">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>  
      <br /><asp:Button ID="Button3" runat="server" Text="Button" />
        </article>

        <article class="Footer">
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
      <br /><asp:Button ID="Button4" runat="server" Text="Button" />
        </article>
    </section>
</asp:Content>

