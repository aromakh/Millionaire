﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace AspWebFormsLearning
{
    [Serializable]
    public class MoneyList
    {
        #region Fields
        [NonSerialized]
        private HtmlGenericControl[] _moneyAmount;
        private string _activeStyle = " border:5px ridge purple;background:#221f57;";
        private string _inactiveStyle = "background:transparent;";
        private string _defaultStyle = "color:#b9aeff;"; 
        #endregion

        #region Properties
        public int Active { get; private set; } 
        #endregion

        #region Constructors
        public MoneyList(HtmlGenericControl listElement)
        {
            _moneyAmount = new HtmlGenericControl[15];

            listElement.Controls.Clear();

            SetItem(ref _moneyAmount[0], 1, 1000000);
            SetItem(ref _moneyAmount[1], 2, 500000);
            SetItem(ref _moneyAmount[2], 3, 250000);
            SetItem(ref _moneyAmount[3], 4, 125000);
            SetItem(ref _moneyAmount[4], 5, 64000);
            SetItem(ref _moneyAmount[5], 6, 32000);
            SetItem(ref _moneyAmount[6], 7, 16000);
            SetItem(ref _moneyAmount[7], 8, 8000);
            SetItem(ref _moneyAmount[8], 9, 4000);
            SetItem(ref _moneyAmount[9], 10, 2000);
            SetItem(ref _moneyAmount[10], 11, 1000);
            SetItem(ref _moneyAmount[11], 12, 500);
            SetItem(ref _moneyAmount[12], 13, 300);
            SetItem(ref _moneyAmount[13], 14, 200);
            SetItem(ref _moneyAmount[14], 15, 100);

            for (int i = 0; i < 15; i++)
            {
                _moneyAmount[i].Attributes["style"] += _defaultStyle;
                listElement.Controls.Add(_moneyAmount[i]);
            }

            ResetAllStyle();
            Active = 0;
            SetActiveStyle();
        }

        public string GetCurrentAmount()
        {
            if ((15 - Active) < 15)
            {
                return _moneyAmount[15 - Active].InnerText;
            }
            else
            {
                return (0).ToString();
            }
        }

        public MoneyList(HtmlGenericControl listElement, int active)
            :this(listElement)
        {
            ResetActiveStyle();
            Active = active;
            SetActiveStyle();
        } 
        #endregion

        #region Methods
        public void Fire()
        {
            ResetActiveStyle();

            Active = (Active < 5) ? 0 : Active ;
            Active = (5 < Active) && (Active < 10) ? 5 : Active;
            Active = (10 < Active) && (Active < 15) ? 10 : Active;
  
            SetActiveStyle();
        }

        public void MoneyUp()
        {
            if ((Active + 1) >= 15)
            {
                throw new InvalidOperationException("Money out of range");
            }

            ResetActiveStyle();
            Active++;
            SetActiveStyle();
        }

        private void SetActiveStyle()
        {
            _moneyAmount[14 - Active].Attributes["style"] = _defaultStyle + _activeStyle;
        }

        private void ResetActiveStyle()
        {
            _moneyAmount[14 - Active].Attributes["style"] = _defaultStyle + _inactiveStyle;
        }

        private void ResetAllStyle()
        {
            for (int i = 0; i < 15; i++)
            {
                _moneyAmount[i].Attributes["style"] = _defaultStyle + _inactiveStyle;

            }
        } 

        private void SetItem(ref HtmlGenericControl control, int value, int amount)
        {
            control = new HtmlGenericControl("li");
            control.Attributes["value"] = value.ToString();
            control.InnerText = amount.ToString();
        }
        #endregion
    }
}