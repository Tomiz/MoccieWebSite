<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Priser.aspx.cs" Inherits="Priser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="GruppeMenu">
        <asp:Repeater ID="Repeater_ProduktMenu" runat="server" DataSourceID="SqlDataSource3">
            <ItemTemplate>
                <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="<%#Eval ("Id") %>"><%#Eval ("Navn") %></asp:LinkButton>--%>
                <a href="priser.aspx?Id=<%#Eval ("Id") %>"><%#Eval ("KategoriNavn") %></a>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT KategoriNavn, Id FROM PrisKategori"></asp:SqlDataSource>
    </div>


    <asp:Repeater ID="Repeater_kategoriOverskrivt" runat="server" DataSourceID="SqlDataSourcekategoriOverskrift">
        <ItemTemplate>
            <h2><%#Eval ("KategoriNavn") %></h2>
        </ItemTemplate>
    </asp:Repeater>

    <asp:SqlDataSource runat="server" ID="SqlDataSourcekategoriOverskrift" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT [KategoriNavn] FROM [PrisKategori] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="Id" Name="Id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>


    <%--<asp:GridView ID="DataGridview" runat="server" Width="99%" AutoGenerateColumns="false" DataSourceID="SqlDataSourcePriser">  
        <Columns>  
            <asp:TemplateField>  
                <HeaderTemplate>  
                    <th colspan="5"> Employee</th>             
                    <tr class ="header1">  
                     <th style="width:0px"></th>  
                    <th colspan="3" >Employee description </th>  
                    <th colspan="2">Employer Salary</th>  
                    </tr>  
                    <tr class="header2">  
                       <th></th>  
                        <th>Serial No.</th>  
                        <th>Employee Name</th>  
                        <th> Employee Adress</th>  
                        <th >Employee designation </th>   
                        <th>Salary</th>  
                    </tr>  
                </HeaderTemplate>  
                <ItemTemplate>  
                    <td style="width:40px"><%#Eval("Navn") %></td>  
                    <td><%#Eval("DetajlerNavn") %></td>  
                   <td>2</td>  
                  <td>3</td>  
                  <td>4</td>  
                
                </ItemTemplate>  
                  
            </asp:TemplateField>  
        </Columns>  
  
        </asp:GridView>  --%>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourcePriser">
        <ItemTemplate>
            <h2><%#Eval("Navn") %></h2>
            <%--<p><%#Eval("DetajlerNavn") %></p>--%>
        </ItemTemplate>
    </asp:Repeater>

  <%--  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSourcePriser">
        <Columns>
            <asp:BoundField DataField="Navn" HeaderText="Navn" SortExpression="Navn"></asp:BoundField>
        </Columns>
    </asp:GridView>--%>
    <asp:SqlDataSource runat="server" ID="SqlDataSourcePriser" ConnectionString='<%$ ConnectionStrings:MoccieDBConnectionString %>' SelectCommand="SELECT DISTINCT Navn FROM Detajler">
    </asp:SqlDataSource>
</asp:Content>

