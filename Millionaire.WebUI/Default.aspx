<%@ Page Title="" Language="C#" Theme="DefaultTheme" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Millionaire.WebUI.Welcome" %>

<asp:Content ID="Content2" ContentPlaceHolderID="GameBodyContentPlaceHolder" runat="server">

        <div id="MainView" runat="server" class="container viewContainer">
            <div class="row">
                <div class="container col-lg-offset-3 col-lg-6">
                    <div class="username_panel ">
                <asp:TextBox ID="UserNameTextBox" SkinID="UserNameTextSkin" runat="server" >Anonym</asp:TextBox>

                 <asp:RequiredFieldValidator ID="rfvUserName" runat="server"
                    ErrorMessage="Required Field" ControlToValidate="UserNameTextBox"
                    ForeColor="Red" Display="Dynamic" />

                <asp:RegularExpressionValidator ID="revUserName" runat="server"
                    ErrorMessage="Length should not exceed 10"  ControlToValidate="UserNameTextBox"
                    ValidationExpression="^[а-яА-ЯіІїЇa-zA-Z]{1,10}$"
                    ForeColor="Red" Display="Dynamic" />

                <div class="row"></div>

                <asp:Button SkinID="FullSizeButtonSkin" OnClick="Start_Game_Click" runat="server" Text="Виграти мільйон!"/>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>
