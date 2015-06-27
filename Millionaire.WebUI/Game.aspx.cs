using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using System.Net.Mail;

using Millionaire.GameEngine;

namespace Millionaire.WebUI
{
    public partial class Game : System.Web.UI.Page
    {

        private GameCore _game;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[SessionKeys.GAME] == null)
            {
                _game = new GameCore(Server.MapPath("~/App_Data/Tasks.xml"));
                _game.LoadFromXml();
                _game.UpdateCurrentTask();
                Session[SessionKeys.GAME] = _game;
            }
            else
            {
                _game = (GameCore)Session[SessionKeys.GAME];
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            LoadData();
        }

        private void LoadData()
        {
            A.Text = _game.AnswerVariants[0];
            B.Text = _game.AnswerVariants[1];
            C.Text = _game.AnswerVariants[2];
            D.Text = _game.AnswerVariants[3];

            FiftyFifty.Visible = !_game.FiftyFiftyUsed;
            CallFriend.Visible = !_game.FriendHelpUsed;
            PeopleHelp.Visible = !_game.PeopleHelpUsed;

            Question.Text = _game.GetCurrentTask().Question;
            Attemps.Text = "Спроби:" + _game.Attempts.ToString();
        }

        protected void Click(object sender, EventArgs e)
        {
            CheckAnswer(((Button)sender).Text);
        }

        protected void People_Help_Click(object sender, EventArgs e)
        {
            var question = _game.GetCurrentTask().Question;

            ClientScript.RegisterStartupScript(this.GetType(), "window.open", "window.open('https://www.google.com.ua/search?q=" + question + "')", true);
            _game.PeopleHelp();
        }


        protected void Send_Mail_Click(object sender, EventArgs e)
        {
            if (Page.IsValid 
                && MyMailTextBox.Text != string.Empty 
                && FriendMailTextBox.Text != string.Empty)
            {
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

                smtpClient.Credentials = new System.Net.NetworkCredential(MyMailTextBox.Text, MyMailPassword.Text);
                smtpClient.EnableSsl = true;

                MailMessage mail = new MailMessage();

                mail.Subject = "Допоможи виграми мільйон!";
                mail.Body = "Привіт. Я намагаюсь виграти мільйон гривень. Допоможи підказкою до наступного запитання:"
                    + _game.GetCurrentTask().Question + "\n"
                    + "Можливі варіанти відповіді:" + "\n"
                    + A.Text + "\n"
                    + B.Text + "\n"
                    + C.Text + "\n"
                    + D.Text + "\n";
                mail.From = new MailAddress(MyMailTextBox.Text);
                mail.To.Add(new MailAddress(FriendMailTextBox.Text));

                smtpClient.Send(mail);

                FriendHelpPanel.Visible = false;
                MainLogoImage.Visible = true;
            }
            else if (Page.IsValid)
            {
                FriendHelpPanel.Visible = false;
                MainLogoImage.Visible = true;
            }
        }

        protected void Call_Friend_Click(object sender, EventArgs e)
        {
            MainLogoImage.Visible = false;
            FriendHelpPanel.Visible = true;
            _game.FriendHelp();
        }

        protected void Fifty_Fifty_Click(object sender, EventArgs e)
        {
            var text = _game.FiftyFifty();
            var controls = new Button[] { A, B, C, D };

            foreach (var button in controls)
            {
                if ((button.Text != text[0]) && (button.Text != text[1]))
                {
                    button.Visible = false;
                }
            }
        }

        protected void Get_Money_Click(object sender, EventArgs e)
        {
            ToResult();
        }

        private void CheckAnswer(String answer)
        {
            if (_game.CheckAnswer(answer))
            {
                if (_game.IsWin)
                {
                    ToResult();
                    return;
                }
                _game.NextTask();
                _game.MoneyBoard.MoneyUp();
            }
            else
            {
                _game.MoneyBoard.Fire();
                if (!_game.SpendAttempt())
                {
                    ToResult();
                }
            }
        }

        private void ToResult()
        {          
            Response.Redirect("~/Result.aspx");
        }
    }
}