<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kontakt.aspx.cs" Inherits="Kontakt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #CurrentKont {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <article class="FrontText">
            <h2>Kontakt</h2>
            <p>Da det skal være muliget at enten kontakte mig eller bestille hos mig er der oprettet en seberat side for dette</p>
        </article>

        <article id="KontaktForm">
            <form action="/action_page.php">
                <label for="Firstn">Fornavn</label>
                <input type="text" id="Firstn" name="firstname" placeholder="Dit Fornavn..">

                <label for="Lastn">Efternavn</label>
                <input type="text" id="Lastn" name="lastname" placeholder="Dit Efternavn..">

                <label for="Email">Email</label>
                <input type="text" id="mail" name="Email" placeholder="Din Mail..">

                <label for="Email2">Godkend Email</label>
                <input type="text" id="mail2" name="Email2" placeholder="Godkend din Mail..">

                <label for="Grund">Årsag</label>
                <select id="Grund" name="Grund">
                    <option value="Ide">Forespørgsel</option>
                    <option value="Order">Bestilling</option>
                    <option value="question">Spørgsmål</option>
                </select>

                <label for="subject">Begrundelse</label>
                <textarea id="subject" name="subject" placeholder="Skriv lidt.." style="height: 200px"></textarea>

                <input type="submit" value="Send">
            </form>
        </article>
    </section>
</asp:Content>

