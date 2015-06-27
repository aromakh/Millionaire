<%@ Page Title="" Theme="DefaultTheme" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="Millionaire.WebUI.Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GameBodyContentPlaceHolder" runat="server">
    <div id="MoneyView" runat="server" class="container viewContainer">
        <div class="row">
            <div class="container">
                            
                <div style="text-align:center">
                    <asp:Label ID="ResultLabel" SkinID="ResultSkin" runat="server">Ваш результат</asp:Label>
                </div>

                <div id="MainView" runat="server" class="container">
                    <div class="row">

                        <div class="container col-lg-offset-3 col-lg-6">
                            <div class="row">
                                <asp:Table ID="ResultTable" SkinID="ResultTable" runat="server">

                                </asp:Table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <asp:Button ID="Button1" OnClick="Try_Again_Click" SkinID="FullSizeButtonSkin" runat="server" Text="Спробувати ще раз" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
