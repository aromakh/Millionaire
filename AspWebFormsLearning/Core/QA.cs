using System;
using System.Collections.Generic;

namespace Millionaire
{
    [Serializable]
    public class QA
    {
        public string Question { get; private set; }
        public string Answer { get; private set; }
        public List<string> WrongAnswers { get; private set; }

        public QA(string question, string answer, List<string> wrongAnswers)
        {
            Question = question;
            Answer = answer;
            WrongAnswers = wrongAnswers;
        }

        public override string ToString()
        {
            return Question;
        }
    }
}