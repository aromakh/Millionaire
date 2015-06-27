using System;
using System.Collections.Generic;
using System.Linq;

using Millionaire.Entities;

namespace Millionaire.GameEngine
{
    [Serializable]
    public class MoneyTable
    {
        #region Fields
        //private string _activeStyle = " border:5px ridge purple;background:#221f57;";
        //private string _inactiveStyle = "background:transparent;";
        //private string _defaultStyle = "color:yellow;"; 
        #endregion

        #region Properties
        public int Active { get; private set; }
        public int[] MoneyList { get; private set; }

        #endregion

        #region Constructors

        public MoneyTable()
        {
            Active = 0;
            MoneyList = new int[15];

            MoneyList[0] = 100;
            MoneyList[1] = 200;
            MoneyList[2] = 300;
            MoneyList[3] = 500;
            MoneyList[4] = 1000;
            MoneyList[5] = 2000;
            MoneyList[6] = 4000;
            MoneyList[7] = 8000;
            MoneyList[8] = 16000;
            MoneyList[9] = 32000;
            MoneyList[10] = 64000;
            MoneyList[11] = 125000;
            MoneyList[12] = 250000;
            MoneyList[13] = 500000;
            MoneyList[14] = 1000000;

        }
        #endregion

        #region Methods

        public int GetAmount()
        {
            return Active == 0 ? 0 : MoneyList[Active - 1];
        }

        public void Fire()
        {
            Active = (Active < 5) ? 0 : Active ;
            Active = (5 < Active) && (Active < 10) ? 5 : Active;
            Active = (10 < Active) && (Active < 15) ? 10 : Active;
        }

        public void MoneyUp()
        {
            if ((Active + 1) >= 15)
            {
                throw new InvalidOperationException("Money out of range");
            }

            Active++;
        }

        #endregion
    }
}