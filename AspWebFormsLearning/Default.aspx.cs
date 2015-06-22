using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
namespace Millionaire
{
    public partial class _Default : Page
    {
        #region Fields

        private MoneyList _moneyList;
        private GameEngine _gameEngine; 

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            bool loaded = true;

            loaded &= LoadMoneyLisViewState();
            loaded &= LoadGameEngineViewState(); 

            if (!loaded) 
            {
                LoadFromXML();
            }

            A.BorderColor = System.Drawing.Color.Purple;
            B.BorderColor = System.Drawing.Color.Purple;
            C.BorderColor = System.Drawing.Color.Purple;
            D.BorderColor = System.Drawing.Color.Purple;

            A.Visible = true;
            B.Visible = true;
            C.Visible = true;
            D.Visible = true;
        }

        private void LoadData()
        {
            A.Text = _gameEngine.AnswerVariants[0];
            B.Text = _gameEngine.AnswerVariants[1];
            C.Text = _gameEngine.AnswerVariants[2];
            D.Text = _gameEngine.AnswerVariants[3];
 
            FiftyFifty.Visible = !_gameEngine.FiftyFiftyUsed;
            CallFriend.Visible = !_gameEngine.FriendHelpUsed;
            PeopleHelp.Visible = !_gameEngine.PeopleHelpUsed;

            Question.Text = _gameEngine.GetCurrentTask().Question;

            Attemps.Text = "Спроби:" + _gameEngine.Attempts.ToString();
        }

        private void LoadFromXML()
        {
            XmlDocument tasks = new XmlDocument();
            tasks.Load(Server.MapPath("~/QA/QA.xml"));

            foreach (XmlNode task in tasks.DocumentElement)
            {
                List<string> wrongAnswers = new List<string>();
                string question = task["question"].InnerText;
                string answer = task["answer"].InnerText;

                foreach (XmlNode wrong in task["wrongAnswers"])
                {
                    wrongAnswers.Add(wrong.InnerText);
                }

                QA qa = new QA(question, answer, wrongAnswers);
                _gameEngine.AddTask(qa);
            }
        }

        private bool LoadMoneyLisViewState()
        {
            if (ViewState["moneyListInViewState"] != null)
            {
                _moneyList = new MoneyList(money, (int)ViewState["moneyListInViewState"]);
                return true;
            }
            else
            {
                _moneyList = new MoneyList(money);
                return false;
            }
        }
        
        private bool LoadGameEngineViewState()
        {
            if (ViewState["gameEngineInViewState"] != null)
            {
                _gameEngine = (GameEngine)ViewState["gameEngineInViewState"];
                return true;
            }
            else
            {
                _gameEngine = new GameEngine();
                return false;
            }
        }

        void Page_PreRender(object sender, EventArgs e)
        {
            ViewState.Add("moneyListInViewState", _moneyList.Active);
            ViewState.Add("gameEngineInViewState", _gameEngine);
            LoadData();
        }

        protected void Fifty_Fifty_Click(object sender, EventArgs e)
        {
            var text = _gameEngine.FiftyFifty();
            var controls = new Button[]{ A,B,C,D };

            foreach(var button in controls)
            {
                if ((button.Text != text[0]) && (button.Text != text[1]))
                {
                    button.Visible = false;
                }
            }
        }

        protected void Call_Friend_Click(object sender, EventArgs e)
        {
            switch (_gameEngine.FriendHelp())
            {
                case 0:
                    A.BorderColor = System.Drawing.Color.White;
                    break;
                case 1:
                    B.BorderColor = System.Drawing.Color.White;
                    break;
                case 2:
                    C.BorderColor = System.Drawing.Color.White;
                    break;
                case 3:
                    D.BorderColor = System.Drawing.Color.White;
                    break;
            }
        }

        protected void People_Help_Click(object sender, EventArgs e)
        {
            System.Drawing.Color[] rating = _gameEngine.PeopleHelp();
            A.BorderColor = rating[0];
            B.BorderColor = rating[1];
            C.BorderColor = rating[2];
            D.BorderColor = rating[3];
        }

        protected void Get_Money_Click(object sender, EventArgs e)
        {
            MoneyAmount.Text = "Ви виграли суму: "+ _moneyList.GetCurrentAmount() + "!!!";
            SetView(MoneyView);
        }

        protected void TryAgainClick(object sender, EventArgs e)
        {
            _gameEngine = new GameEngine();
            _moneyList = new MoneyList(money);
            LoadFromXML();
            SetView(MainView);
        }

        protected void Click(object sender, EventArgs e)
        {
            CheckAnswer(((Button)sender).Text);
        }

        private void CheckAnswer(String answer)
        {
            if (_gameEngine.CheckAnswer(answer))
            {
                if (_moneyList.Active == 14)
                {
                    SetView(WinView);
                    return;
                }
                _gameEngine.NextTask();
                _moneyList.MoneyUp();
            }
            else
            {
                _moneyList.Fire();
                if (!_gameEngine.SpendAttemp())
                {
                    Lose();
                }
            }
        }

        private void Lose()
        {
            SetView(LoseView);
        }

        private void SetView(HtmlGenericControl visileControl)
        {
            LoseView.Visible = false;
            WinView.Visible = false;
            MoneyView.Visible = false;
            MainView.Visible = false;

            visileControl.Visible = true;
        }
    }
}