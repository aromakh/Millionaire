<%@ Page Title="Контакти" Theme="DefaultTheme" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Millionaire.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Ви можете з'язатись з нами наступним чином:</h3>
    <address>
        Україна<br />
        Львів<br />
        <abbr title="Phone">P:</abbr>
        +380976211997
    </address>

    <address>
        <strong>Підтримка:</strong>   <a href="mailto:andriyromakh@gmail.com">andriyromakh@gmail.com</a><br />
    </address>
</asp:Content>
