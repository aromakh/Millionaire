<%@ Page Title="Home Page" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AspWebFormsLearning._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="MainView" runat="server" class="container" style="border:20px ridge #221f57;background-color: #221f57; background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnPgoJPGRlZnM+CgkJPHBhdHRlcm4gaWQ9J3RpbGUnIHBhdHRlcm5Vbml0cz0ndXNlclNwYWNlT25Vc2UnIHdpZHRoPScxMycgaGVpZ2h0PScxMycgdmlld0JveD0nMCAwIDUwIDUwJz4KCQkJPGxpbmUgeDE9JzEnIHkxPScwJyB4Mj0nNTEnIHkyPSc1MCcgc3Ryb2tlPScjMTkyMDNkJyBzdHJva2Utd2lkdGg9JzguMycvPgoJCQk8bGluZSB4MT0nNDknIHkxPScwJyB4Mj0nLTEnIHkyPSc1MCcgc3Ryb2tlPScjMTkyMDNkJyBzdHJva2Utd2lkdGg9JzguMycvPgoJCQk8bGluZSB4MT0nNTAnIHkxPScwJyB4Mj0nMCcgeTI9JzUwJyBzdHJva2U9JyMzMTM3NjMnIHN0cm9rZS13aWR0aD0nOC4zJy8+CgkJCTxsaW5lIHgxPScwJyB5MT0nMCcgeDI9JzUwJyB5Mj0nNTAnIHN0cm9rZT0nIzMxMzc2Mycgc3Ryb2tlLXdpZHRoPSc4LjMnLz4KCQk8L3BhdHRlcm4+CgkJPHJhZGlhbEdyYWRpZW50IGlkPSdsJyBjeD0nNTAlJyBjeT0nMjAwJScgZnk9JzAnIHI9JzIwMSUnPgoJCQk8c3RvcCBvZmZzZXQ9JzAlJyBzdHlsZT0nc3RvcC1jb2xvcjojZmZmOyBzdG9wLW9wYWNpdHk6LjE7JyAvPgoJCQk8c3RvcCBvZmZzZXQ9JzEwJScgc3R5bGU9J3N0b3AtY29sb3I6IzAwMDsgc3RvcC1vcGFjaXR5OjAuMTsnIC8+CgkJCTxzdG9wIG9mZnNldD0nMzAlJyBzdHlsZT0nc3RvcC1jb2xvcjojMDAwOyBzdG9wLW9wYWNpdHk6MC4zOycgLz4KCQkJPHN0b3Agb2Zmc2V0PSc5MCUnIHN0eWxlPSdzdG9wLWNvbG9yOiMwMDA7IHN0b3Atb3BhY2l0eTowLjU1OycgLz4KCQkJPHN0b3Agb2Zmc2V0PScxMDAlJyBzdHlsZT0nc3RvcC1jb2xvcjojMDAwOyBzdG9wLW9wYWNpdHk6LjYnIC8+CgkJPC9yYWRpYWxHcmFkaWVudD4KCTwvZGVmcz4KCTxyZWN0IGZpbGw9JyMyMjFmNTcnIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnLz4KCTxyZWN0IGZpbGw9J3VybCgjdGlsZSknIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnLz4KCTxyZWN0IHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnIGZpbGw9J3VybCgjbCknLz4KPC9zdmc+');">
        <div class="row">

            <div class="container col-lg-12" >
                <div  class="col-lg-3">
                    <div class="container col-lg-8" style="margin-top:75px;border:20px ridge #221f57">
                        <div style="padding:10px 0;">
                    <asp:ImageButton style="padding-top:" ImageUrl="~/Images/friend.png" BorderStyle="None" ID="CallFriend" runat="server" OnClick="Call_Friend_Click" Text="Двінок" class="helpers btn-primary col-lg-12" />
                    <asp:ImageButton ImageUrl="~/Images/people.png" BorderStyle="None" ID="PeopleHelp" runat="server" OnClick="People_Help_Click" Text="Зал" class="helpers btn-primary col-lg-12" />
                    <asp:ImageButton ImageUrl="~/Images/5050.png" BorderStyle="None" ID="FiftyFifty" runat="server" OnClick="Fifty_Fifty_Click" Text="50/50" class="helpers btn-primary col-lg-12" />
                    <asp:ImageButton style="padding-bottom:" ImageUrl="~/Images/money.png" BorderStyle="None" ID="GetMoney" runat="server" OnClick="Get_Money_Click" Text="Гроші" class="helpers btn-primary col-lg-12" />
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

    <div id="LoseView" visible="false"  runat="server" class="container" style="border:20px ridge #221f57;background-color: #221f57; background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnPgoJPGRlZnM+CgkJPHBhdHRlcm4gaWQ9J3RpbGUnIHBhdHRlcm5Vbml0cz0ndXNlclNwYWNlT25Vc2UnIHdpZHRoPScxMycgaGVpZ2h0PScxMycgdmlld0JveD0nMCAwIDUwIDUwJz4KCQkJPGxpbmUgeDE9JzEnIHkxPScwJyB4Mj0nNTEnIHkyPSc1MCcgc3Ryb2tlPScjMTkyMDNkJyBzdHJva2Utd2lkdGg9JzguMycvPgoJCQk8bGluZSB4MT0nNDknIHkxPScwJyB4Mj0nLTEnIHkyPSc1MCcgc3Ryb2tlPScjMTkyMDNkJyBzdHJva2Utd2lkdGg9JzguMycvPgoJCQk8bGluZSB4MT0nNTAnIHkxPScwJyB4Mj0nMCcgeTI9JzUwJyBzdHJva2U9JyMzMTM3NjMnIHN0cm9rZS13aWR0aD0nOC4zJy8+CgkJCTxsaW5lIHgxPScwJyB5MT0nMCcgeDI9JzUwJyB5Mj0nNTAnIHN0cm9rZT0nIzMxMzc2Mycgc3Ryb2tlLXdpZHRoPSc4LjMnLz4KCQk8L3BhdHRlcm4+CgkJPHJhZGlhbEdyYWRpZW50IGlkPSdsJyBjeD0nNTAlJyBjeT0nMjAwJScgZnk9JzAnIHI9JzIwMSUnPgoJCQk8c3RvcCBvZmZzZXQ9JzAlJyBzdHlsZT0nc3RvcC1jb2xvcjojZmZmOyBzdG9wLW9wYWNpdHk6LjE7JyAvPgoJCQk8c3RvcCBvZmZzZXQ9JzEwJScgc3R5bGU9J3N0b3AtY29sb3I6IzAwMDsgc3RvcC1vcGFjaXR5OjAuMTsnIC8+CgkJCTxzdG9wIG9mZnNldD0nMzAlJyBzdHlsZT0nc3RvcC1jb2xvcjojMDAwOyBzdG9wLW9wYWNpdHk6MC4zOycgLz4KCQkJPHN0b3Agb2Zmc2V0PSc5MCUnIHN0eWxlPSdzdG9wLWNvbG9yOiMwMDA7IHN0b3Atb3BhY2l0eTowLjU1OycgLz4KCQkJPHN0b3Agb2Zmc2V0PScxMDAlJyBzdHlsZT0nc3RvcC1jb2xvcjojMDAwOyBzdG9wLW9wYWNpdHk6LjYnIC8+CgkJPC9yYWRpYWxHcmFkaWVudD4KCTwvZGVmcz4KCTxyZWN0IGZpbGw9JyMyMjFmNTcnIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnLz4KCTxyZWN0IGZpbGw9J3VybCgjdGlsZSknIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnLz4KCTxyZWN0IHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnIGZpbGw9J3VybCgjbCknLz4KPC9zdmc+');">
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

    <div id="MoneyView" visible="false" runat="server" class="container" style="border:20px ridge #221f57;background-color: #221f57; background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnPgoJPGRlZnM+CgkJPHBhdHRlcm4gaWQ9J3RpbGUnIHBhdHRlcm5Vbml0cz0ndXNlclNwYWNlT25Vc2UnIHdpZHRoPScxMycgaGVpZ2h0PScxMycgdmlld0JveD0nMCAwIDUwIDUwJz4KCQkJPGxpbmUgeDE9JzEnIHkxPScwJyB4Mj0nNTEnIHkyPSc1MCcgc3Ryb2tlPScjMTkyMDNkJyBzdHJva2Utd2lkdGg9JzguMycvPgoJCQk8bGluZSB4MT0nNDknIHkxPScwJyB4Mj0nLTEnIHkyPSc1MCcgc3Ryb2tlPScjMTkyMDNkJyBzdHJva2Utd2lkdGg9JzguMycvPgoJCQk8bGluZSB4MT0nNTAnIHkxPScwJyB4Mj0nMCcgeTI9JzUwJyBzdHJva2U9JyMzMTM3NjMnIHN0cm9rZS13aWR0aD0nOC4zJy8+CgkJCTxsaW5lIHgxPScwJyB5MT0nMCcgeDI9JzUwJyB5Mj0nNTAnIHN0cm9rZT0nIzMxMzc2Mycgc3Ryb2tlLXdpZHRoPSc4LjMnLz4KCQk8L3BhdHRlcm4+CgkJPHJhZGlhbEdyYWRpZW50IGlkPSdsJyBjeD0nNTAlJyBjeT0nMjAwJScgZnk9JzAnIHI9JzIwMSUnPgoJCQk8c3RvcCBvZmZzZXQ9JzAlJyBzdHlsZT0nc3RvcC1jb2xvcjojZmZmOyBzdG9wLW9wYWNpdHk6LjE7JyAvPgoJCQk8c3RvcCBvZmZzZXQ9JzEwJScgc3R5bGU9J3N0b3AtY29sb3I6IzAwMDsgc3RvcC1vcGFjaXR5OjAuMTsnIC8+CgkJCTxzdG9wIG9mZnNldD0nMzAlJyBzdHlsZT0nc3RvcC1jb2xvcjojMDAwOyBzdG9wLW9wYWNpdHk6MC4zOycgLz4KCQkJPHN0b3Agb2Zmc2V0PSc5MCUnIHN0eWxlPSdzdG9wLWNvbG9yOiMwMDA7IHN0b3Atb3BhY2l0eTowLjU1OycgLz4KCQkJPHN0b3Agb2Zmc2V0PScxMDAlJyBzdHlsZT0nc3RvcC1jb2xvcjojMDAwOyBzdG9wLW9wYWNpdHk6LjYnIC8+CgkJPC9yYWRpYWxHcmFkaWVudD4KCTwvZGVmcz4KCTxyZWN0IGZpbGw9JyMyMjFmNTcnIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnLz4KCTxyZWN0IGZpbGw9J3VybCgjdGlsZSknIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnLz4KCTxyZWN0IHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnIGZpbGw9J3VybCgjbCknLz4KPC9zdmc+');">
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

    <div id="WinView" visible="false"  runat="server" class="container" style="border:20px ridge #221f57;background-color: #221f57; background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnPgoJPGRlZnM+CgkJPHBhdHRlcm4gaWQ9J3RpbGUnIHBhdHRlcm5Vbml0cz0ndXNlclNwYWNlT25Vc2UnIHdpZHRoPScxMycgaGVpZ2h0PScxMycgdmlld0JveD0nMCAwIDUwIDUwJz4KCQkJPGxpbmUgeDE9JzEnIHkxPScwJyB4Mj0nNTEnIHkyPSc1MCcgc3Ryb2tlPScjMTkyMDNkJyBzdHJva2Utd2lkdGg9JzguMycvPgoJCQk8bGluZSB4MT0nNDknIHkxPScwJyB4Mj0nLTEnIHkyPSc1MCcgc3Ryb2tlPScjMTkyMDNkJyBzdHJva2Utd2lkdGg9JzguMycvPgoJCQk8bGluZSB4MT0nNTAnIHkxPScwJyB4Mj0nMCcgeTI9JzUwJyBzdHJva2U9JyMzMTM3NjMnIHN0cm9rZS13aWR0aD0nOC4zJy8+CgkJCTxsaW5lIHgxPScwJyB5MT0nMCcgeDI9JzUwJyB5Mj0nNTAnIHN0cm9rZT0nIzMxMzc2Mycgc3Ryb2tlLXdpZHRoPSc4LjMnLz4KCQk8L3BhdHRlcm4+CgkJPHJhZGlhbEdyYWRpZW50IGlkPSdsJyBjeD0nNTAlJyBjeT0nMjAwJScgZnk9JzAnIHI9JzIwMSUnPgoJCQk8c3RvcCBvZmZzZXQ9JzAlJyBzdHlsZT0nc3RvcC1jb2xvcjojZmZmOyBzdG9wLW9wYWNpdHk6LjE7JyAvPgoJCQk8c3RvcCBvZmZzZXQ9JzEwJScgc3R5bGU9J3N0b3AtY29sb3I6IzAwMDsgc3RvcC1vcGFjaXR5OjAuMTsnIC8+CgkJCTxzdG9wIG9mZnNldD0nMzAlJyBzdHlsZT0nc3RvcC1jb2xvcjojMDAwOyBzdG9wLW9wYWNpdHk6MC4zOycgLz4KCQkJPHN0b3Agb2Zmc2V0PSc5MCUnIHN0eWxlPSdzdG9wLWNvbG9yOiMwMDA7IHN0b3Atb3BhY2l0eTowLjU1OycgLz4KCQkJPHN0b3Agb2Zmc2V0PScxMDAlJyBzdHlsZT0nc3RvcC1jb2xvcjojMDAwOyBzdG9wLW9wYWNpdHk6LjYnIC8+CgkJPC9yYWRpYWxHcmFkaWVudD4KCTwvZGVmcz4KCTxyZWN0IGZpbGw9JyMyMjFmNTcnIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnLz4KCTxyZWN0IGZpbGw9J3VybCgjdGlsZSknIHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnLz4KCTxyZWN0IHdpZHRoPScxMDAlJyBoZWlnaHQ9JzEwMCUnIGZpbGw9J3VybCgjbCknLz4KPC9zdmc+');">
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
