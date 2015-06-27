using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace Millionaire.WebUI
{
    public class Player
    {
        [XmlAttribute]
        public string name;
        [XmlAttribute]
        public DateTime time;
    }
}