using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

namespace Millionaire.WebUI
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Start_Game_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (SessionKeys.USER_NAME != null)
                {
                    Session[SessionKeys.USER_NAME] = UserNameTextBox.Text;

                    Response.Redirect("~/Game.aspx");
                }
            }
        }
    }
}