using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Millionaire.GameEngine;

namespace Millionaire.WebUI
{
    public partial class MoneyList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            GameCore game = (GameCore)Session[SessionKeys.GAME];
            var amouts = game.MoneyBoard.MoneyList;

            for (int i = amouts.Length - 1; i >= 0; i--)
            {
                TableCell amountCell = new TableCell();
                TableRow amountRow = new TableRow();

                if (game.MoneyBoard.Active == i)
                {
                    amountRow.SkinID = "ActiveRow";
                }

                amountCell.Text = (i + 1).ToString() + " . " + amouts[i].ToString();
                amountRow.Cells.Add(amountCell);

                MoneyTable.Rows.Add(amountRow);
            }
        }
    }
}