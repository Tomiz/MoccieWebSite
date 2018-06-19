<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="BeskederAdmin.aspx.cs" Inherits="Admin_ContactAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentBesk {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="tegnogbilled">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>

                <div class="accordion" ><%#Eval("Fornavn") %> | <%#Eval("AArsag") %> | <%#Eval("Dato") %></div>
            <%--<asp:Button class="accordion" runat="server" Text='<%#Eval("Fornavn") %> ' OnClientClick="return false;" />--%>
                <div class="panel2" style="background-color:#4fa0b1;">
                    <label><%#Eval("Fornavn") %> <%#Eval("Efternavn") %> | Email: <%#Eval("Email") %></label>
                    <label class="floatRight"><%#Eval("Dato") %></label>
                    <br /><br />
                    <%--<label>Besked</label>--%>
                    <hr />
                    <label><%#Eval("Begrundelse") %></label>

                    

                </div>

            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:tomis_dk_dbConnectionString %>' SelectCommand="SELECT Beskeder.*, Dato AS Date FROM Beskeder ORDER BY Date DESC"></asp:SqlDataSource>
    </div>

    <div class="footerClear" style="margin-top: 477px;"></div>

    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
    </script>
</asp:Content>

