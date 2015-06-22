<%@ Page Title="Головна" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Millionaire._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="MainView" runat="server" class="container viewContainer">
        <div class="row">

            <div class="container col-lg-12" >
                <div  class="col-lg-3">
                    <div class="container col-lg-8" style="margin-top:75px;border:20px ridge #221f57">
                        <div style="padding:10px 0;">
                    <asp:ImageButton ImageUrl="~/Images/friend.png" BorderStyle="None" ID="CallFriend" runat="server" OnClick="Call_Friend_Click" Text="Двінок" class="helpers btn-primary col-lg-12" />
                    <asp:ImageButton ImageUrl="~/Images/people.png" BorderStyle="None" ID="PeopleHelp" runat="server" OnClick="People_Help_Click" Text="Зал" class="helpers btn-primary col-lg-12" />
                    <asp:ImageButton ImageUrl="~/Images/5050.png" BorderStyle="None" ID="FiftyFifty" runat="server" OnClick="Fifty_Fifty_Click" Text="50/50" class="helpers btn-primary col-lg-12" />
                    <asp:ImageButton ImageUrl="~/Images/money.png" BorderStyle="None" ID="GetMoney" runat="server" OnClick="Get_Money_Click" Text="Гроші" class="helpers btn-primary col-lg-12" />
                    </div>
                        </div>
                </div>

                <img style="padding:20px" src="Images/Title.png" class="col-lg-6 col-lg"/>

                <div class="money_status col-lg-2 col-lg-offset-1">
                    <ol id="money" runat="server" style="margin-top:30px; border:20px ridge #221f57; background:black"></ol>

                    <div style="margin:0 auto; padding-top:15px; text-align:center; color: white; height: 100px; border:20px ridge #221f57" class="panel col-lg-12">
                        <asp:Label ID="Attemps" runat="server" CssClass="StrongText" ForeColor="White" Font-Size="Large" Font-Bold="true" Text="Спроби: 3"></asp:Label>
                    </div>
                </div>

                <div class="row"></div>

                <div class="row">
                    <div style="margin:0 auto; padding-top:15px; text-align:center; color:#00ffff; height: 100px; border:20px ridge #221f57" class="panel col-lg-12">
                        <asp:Label ID="Question" runat="server" CssClass="StrongText" Font-Size="X-Large" Font-Bold="true" Text="Запитання"></asp:Label>
                    </div>
                    <asp:Button ID="A" ForeColor="#00ffff" runat="server" OnClick="Click" Text="A" class="btn btn-primary btn-lg col-lg-6" />
                    <asp:Button ID="B" ForeColor="#00ffff" runat="server" OnClick="Click" Text="B" class="btn btn-primary btn-lg col-lg-6" />
                    <asp:Button ID="C" ForeColor="#00ffff" runat="server" OnClick="Click" Text="C" class="btn btn-primary btn-lg col-lg-6" />
                    <asp:Button ID="D" ForeColor="#00ffff" runat="server" OnClick="Click" Text="D" class="btn btn-primary btn-lg col-lg-6" />
                </div>
            </div>
        </div>
    </div>

    <div id="LoseView" visible="false"  runat="server" class="container viewContainer">
        <div class="row">

            <div class="container">
                <img src="Images/TitleLose.png" style="display:block; margin:0 auto"/>
                <div class="row">

                    <div style="margin:0 auto; padding-top:30px; text-align:center; color: white; height: 100px" class="panel col-lg-12">
                        <asp:Label runat="server" CssClass="StrongText" Font-Size="X-Large" Font-Bold="true" Text="Ви програли. Дякуємо за гру."></asp:Label>
                    </div>
                    
                    <asp:Button ID="Button1" runat="server" OnClick="TryAgainClick" Text="Спробувати ще раз" class="btn btn-primary btn-lg col-lg-12" />
                </div>
            </div>
        </div>
    </div>

    <div id="MoneyView" visible="false" runat="server" class="container viewContainer">
        <div class="row">

            <div class="container">
                <img src="Images/Title.png" style="display:block; margin:0 auto"/>
                <div class="row">

                    <div style="margin:0 auto; padding-top:30px; text-align:center; color: white; height: 100px" class="panel col-lg-12">
                        <asp:Label ID="MoneyAmount" runat="server" CssClass="StrongText" Font-Size="X-Large" Font-Bold="true" Text="Вітаємо з виграною сумою:"></asp:Label>
                    </div>
                    
                    <asp:Button ID="Button2" runat="server" OnClick="TryAgainClick" Text="Спробувати ще раз" class="btn btn-primary btn-lg col-lg-12" />
                </div>
            </div>
        </div>
    </div>

    <div id="WinView" visible="false"  runat="server" class="container viewContainer">
        <div class="row">
            <div class="container">
                <img src="Images/Title.png" style="display:block; margin:0 auto"/>
                <div class="row">
                    <div style="margin:0 auto; padding-top:30px; text-align:center; color: white; height: 100px" class="panel col-lg-12">
                        <asp:Label runat="server" CssClass="StrongText" Font-Size="X-Large" Font-Bold="true" Text="Наші вітання!!! Ви виграли мільйон!!!"></asp:Label>
                    </div>
                    
                    <asp:Button ID="Button3" runat="server" OnClick="TryAgainClick" Text="Спробувати ще раз" class="btn btn-primary btn-lg col-lg-12" />
                </div>
            </div>
        </div>
    </div>

   
</asp:Content>
