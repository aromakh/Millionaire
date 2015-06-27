using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

using Millionaire.Entities;

namespace Millionaire.Repository
{
    [Serializable]
    public class XmlTaskRepositary: ITaskRepository
    {
        #region Fields

        private readonly string _filePath;

        #endregion

        #region Constructors

        public XmlTaskRepositary(string filePath)
        {
            _filePath = filePath;
        }

        #endregion

        #region IQuestionRepository

        public IEnumerable<QA> GetQuestions()
        {
            List<QA> tasksList = new List<QA>();
            XmlDocument tasksDocument = new XmlDocument();

            tasksDocument.Load(_filePath);

            foreach (XmlNode task in tasksDocument.DocumentElement)
            {
                List<string> wrongAnswers = new List<string>();
                string question = task[QuestionKeys.QUESTION].InnerText;
                string answer = task[QuestionKeys.ANSWER].InnerText;

                foreach (XmlNode wrong in task[QuestionKeys.WRONG_ANSWERS])
                {
                    wrongAnswers.Add(wrong.InnerText);
                }

                QA qa = new QA(question, answer, wrongAnswers);
                tasksList.Add(qa);
            }

            return tasksList;
        }

        #endregion
    }
}