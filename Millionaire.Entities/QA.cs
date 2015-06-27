using System;
using System.Collections.Generic;

namespace Millionaire.Entities
{
    [Serializable]
    public class QA
    {
        #region Properties
        public string Question { get; private set; }
        public string Answer { get; private set; }
        public List<string> WrongAnswers { get; private set; } 
        #endregion

        #region Constructors
        public QA(string question, string answer, List<string> wrongAnswers)
        {
            Question = question;
            Answer = answer;
            WrongAnswers = wrongAnswers;
        } 
        #endregion

        #region Methods
        public override string ToString()
        {
            return Question;
        } 
        #endregion
    }
}