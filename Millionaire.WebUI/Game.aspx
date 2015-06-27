<%@ Page Title="" Language="C#" Theme="DefaultTheme" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="Millionaire.WebUI.Game" %>

<%@ Register Src="~/MoneyList.ascx" TagPrefix="uc1" TagName="MoneyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GameBodyContentPlaceHolder" runat="server">
    <div id="MainView" runat="server" class="container viewContainer">
        <div class="row">

            <div class="container col-lg-12">
                <div class="col-lg-3">
                    <div class="helper_panel container col-lg-8">
                        <div>
                            <asp:ImageButton ImageUrl="~/Images/friend.png" ID="CallFriend" OnClick="Call_Friend_Click" runat="server" Text="Двінок" />
                            <asp:ImageButton ImageUrl="~/Images/people.png" ID="PeopleHelp" OnClick="People_Help_Click" runat="server" Text="Зал" />
                            <asp:ImageButton ImageUrl="~/Images/5050.png" ID="FiftyFifty" OnClick="Fifty_Fifty_Click" runat="server" Text="50/50" />
                            <asp:ImageButton ImageUrl="~/Images/money.png" ID="GetMoney" OnClick="Get_Money_Click" runat="server" Text="Гроші" />
                        </div>
                    </div>
                </div>

                <asp:Image ID="MainLogoImage" runat="server" ImageUrl="~/Images/title.png" SkinID="MainImage" />

                <asp:Panel Visible="false" ID="FriendHelpPanel" runat="server" SkinID="FriendHelp" CssClass="container">
                    <asp:Label runat="server">Ваша пошта:</asp:Label>

                    <asp:TextBox ID="MyMailTextBox" SkinID="UserNameTextSkin" TextMode="Email" runat="server" ></asp:TextBox>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ErrorMessage="Має бути вигляду: name@gmail.com"  ControlToValidate="MyMailTextBox"
                        ValidationExpression="^[a-zA-Z]+@gmail\.com$"
                        ForeColor="Red" Display="Dynamic" />

                    <asp:TextBox ID="MyMailPassword" SkinID="UserNameTextSkin" TextMode="Password" runat="server" ></asp:TextBox>

                    <div class="row"></div>
                    <asp:Label runat="server">Пошта друга:</asp:Label>

                    <asp:TextBox ID="FriendMailTextBox" SkinID="UserNameTextSkin" TextMode="Email" runat="server" ></asp:TextBox>

                    <asp:RegularExpressionValidator ID="revUserName" runat="server"
                        ErrorMessage="Має бути вигляду: name@email.com"  ControlToValidate="FriendMailTextBox"
                        ValidationExpression="^[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]+$"
                        ForeColor="Red" Display="Dynamic" />

                    <div class="row"> 
                        <hr />

                    </div>

                    <asp:Button SkinID="FullSizeButtonSkin" OnClick="Send_Mail_Click" Text="Надіслати другові" runat="server"/>

                </asp:Panel>

                <div class="money_status col-lg-2 col-lg-offset-1">

                    <uc1:MoneyList runat="server" ID="MoneyList" />

                    <div class="question_panel panel col-lg-12">
                        <asp:Label ID="Attemps" SkinID="AttempsSkin" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="row"></div>

                <div class="row">
                    <div class="question_panel panel col-lg-12">
                        <asp:Label ID="Question" SkinID="QuestionSkin" runat="server"></asp:Label>
                    </div>
                    <asp:Button ID="A" OnClick="Click" runat="server" Text="A" />
                    <asp:Button ID="B" OnClick="Click" runat="server" Text="B" />
                    <asp:Button ID="C" OnClick="Click" runat="server" Text="C" />
                    <asp:Button ID="D" OnClick="Click" runat="server" Text="D" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
