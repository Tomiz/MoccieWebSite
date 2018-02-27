<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentHome {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <article class="FrontText">
            <h2>Moccie</h2>
            <p>text her</p>
        </article>

        <script>
            $(document).ready(function () {
                $('.slider').bxSlider();
            });
        </script>
        <article class="slider">
            <img src="Pictures/Slider/pic1.jpeg"/>
            <img src="Pictures/Slider/pic2.jpeg"/>
            <img src="Pictures/Slider/pic3.jpeg"/>
            <%--<div>I am another slide.</div>--%>
        </article>

        <article class="About">
            <h2>About </h2>
            <p>text der fylderl lalalalahla</p>
            <p>text der fylderl lalalalala</p>
            <p>text der fylderl lalalalala</p>
            <p>text der fylderl lalalalala</p>
            <p>text der fylderl lalalalala</p>
            <p>text der fylderl lalalalala</p>
            <p>text der fylderl lalalalala</p>
            <p>text der fylderl lalalalala</p>
            <p>text der fylderl lalalalala</p>
            <p>text der fylderl lalalalala</p>
            <div class="profilePic">
                <img src="Pictures/profilPic.png" width="150" height="150" />
            </div>
        </article>
    </section>


</asp:Content>

