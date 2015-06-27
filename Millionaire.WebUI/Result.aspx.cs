using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Xml.Serialization;

using Millionaire.GameEngine;

namespace Millionaire.WebUI
{
    public class player
    {
        [XmlAttribute]
        public string name;
        [XmlAttribute]
        public DateTime time;
    }

    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionKeys.GAME != null)
                {
                    var game = (GameCore)Session[SessionKeys.GAME];

                    if (game != null)
                    {
                        if (game.IsWin)
                        {
                            ResultLabel.Text = "Вітаємо. Ви виграли";
                            StoreResult();
                        }
                        else
                        {
                            ResultLabel.Text = "Наші співчуття. Ви виграли лише " 
                                + game.MoneyBoard.GetAmount().ToString() + " гривень.";
                        }
                    }
                }
            }

            PrintResultsTable();
        }

        private void PrintResultsTable()
        {
            Dictionary<string, DateTime> dict;

            XmlSerializer serializer = new XmlSerializer(typeof(player[]),
                new XmlRootAttribute() { ElementName = "player" });

            using (Stream stream = new FileStream(Server.MapPath("~/App_Data/Results.xml"),
                FileMode.Open))
            {
                try
                {
                    dict = ((player[])serializer.Deserialize(stream))
                        .ToDictionary(i => i.name, i => i.time);
                }
                catch
                {
                    dict = new Dictionary<string, DateTime>();
                }
            }

            int iterator = 0;
            foreach (var player in dict.Keys.Reverse<string>())
            {
                TableCell amountCell = new TableCell();
                TableRow amountRow = new TableRow();

                amountCell.Text = player + " -------- \t" + dict[player].ToString();
                amountRow.Cells.Add(amountCell);
                ResultTable.Rows.Add(amountRow);

                iterator++;

                if (iterator >= 10)
                {
                    return;
                }
            }
        }

        private void StoreResult()
        {
            Dictionary<string, DateTime> dict;

            XmlSerializer serializer = new XmlSerializer(typeof(player[]),
                new XmlRootAttribute() { ElementName = "player" });

            using (Stream stream = new FileStream(Server.MapPath("~/App_Data/Results.xml"),
                FileMode.Open))
            {
                try
                {
                    dict = ((player[])serializer.Deserialize(stream))
                        .ToDictionary(i => i.name, i => i.time);
                }
                catch
                {
                    dict = new Dictionary<string, DateTime>();
                }

                AddResults(dict);

                stream.Close();

                SaveResults(dict, serializer);
            }
        }

        private void AddResults(Dictionary<string, DateTime> dict)
        {
            if ((string)Session[SessionKeys.USER_NAME] != null)
            {
                if (dict.ContainsKey((string)Session[SessionKeys.USER_NAME]))
                {
                    dict.Remove((string)Session[SessionKeys.USER_NAME]);
                }

                dict.Add((string)Session[SessionKeys.USER_NAME], DateTime.Now);
            }
        }

        private void SaveResults(Dictionary<string, DateTime> dict, XmlSerializer serializer)
        {
            using (Stream cleanStream = new FileStream(Server.MapPath("~/App_Data/Results.xml"),
            FileMode.Create))
            {
                serializer.Serialize(cleanStream,
                    dict.Select(kv => new player() { name = kv.Key, time = kv.Value }).ToArray());
            }
        }

        protected void Try_Again_Click(object sender, EventArgs e)
        {
            if (SessionKeys.GAME != null)
            {
                Session.Remove(SessionKeys.GAME);
            }

            Response.Redirect("~/Game.aspx");
        }
    }
}