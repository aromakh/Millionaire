using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Millionaire.Repository;
using Millionaire.Entities;

namespace Millionaire.GameEngine
{
    [Serializable]
    public class GameCore
    {


        public List<QA> _tasks = new List<QA>();

        public MoneyTable MoneyBoard;
        public ITaskRepository TaskRepositary { get; private set; }

        public bool PeopleHelpUsed { get; private set; }
        public bool FriendHelpUsed { get; private set; }
        public bool FiftyFiftyUsed { get; private set; }
        public bool IsWin { get; private set; }

        public int CurrentTask { get; private set; }
        public int Attempts { get; private set; }
        public string[] AnswerVariants { get; private set; }

        public GameCore(string questionFilePath)
        {
            PeopleHelpUsed = false;
            FriendHelpUsed = false;
            FiftyFiftyUsed = false;

            AnswerVariants = new string[4];
            Attempts = 3;

            MoneyBoard = new MoneyTable();

            TaskRepositary = new XmlTaskRepositary(questionFilePath);
        }

        public void LoadFromXml()
        {
            _tasks = TaskRepositary.GetQuestions().ToList<QA>();
        }

        public bool CheckAnswer(string answer)
        {
            if (_tasks[CurrentTask].Answer == answer)
            {
                if (MoneyBoard.Active == 14)
                {
                    IsWin = true;
                }
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool SpendAttempt()
        {
            if (--Attempts <= 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public void ShakeAnswers()
        {
            AnswerVariants = RandomSort<string>(AnswerVariants);
        }

        public void AddTask(QA task)
        {
            _tasks.Add(task);
        }

        public QA GetCurrentTask()
        {
            return _tasks[CurrentTask];
        }

        public void UpdateCurrentTask()
        {
            AnswerVariants[0] = GetCurrentTask().Answer;
            AnswerVariants[1] = GetCurrentTask().WrongAnswers[0];
            AnswerVariants[2] = GetCurrentTask().WrongAnswers[1];
            AnswerVariants[3] = GetCurrentTask().WrongAnswers[2];
        }

        public void NextTask()
        {
            if ((CurrentTask + 1) < _tasks.Count)
            {
                CurrentTask++;
            }
            else
            {
                CurrentTask = 0;
            }

            QA curentTask = GetCurrentTask();
            AnswerVariants[0] = curentTask.Answer;
            AnswerVariants[1] = curentTask.WrongAnswers[0];
            AnswerVariants[2] = curentTask.WrongAnswers[1];
            AnswerVariants[3] = curentTask.WrongAnswers[2];
            ShakeAnswers();
        }

        public void PeopleHelp()
        {
            PeopleHelpUsed = true;
        }

        public void FriendHelp()
        {
            FriendHelpUsed = true;
        }

        public string[] FiftyFifty()
        {
            FiftyFiftyUsed = true;

            var task = GetCurrentTask();
            string[] result = new string[2];

            result[0] = task.Answer;
            result[1] = task.WrongAnswers[(new Random()).Next(0,2)];

            return result; 
        }

        public T[] RandomSort<T>(T[] sortedArray)
        {
            T[] arr = new T[sortedArray.Length];

            List<int> mixedAnswers = new List<int>();
            Random rand = new Random();

            while (mixedAnswers.Count < sortedArray.Length)
            {
                int digit = rand.Next(0, sortedArray.Length);

                if (!mixedAnswers.Contains(digit))
                {
                    mixedAnswers.Add(digit);
                }
            }

            for (int i = 0; i < sortedArray.Length; i++)
            {
                arr[i] = sortedArray[mixedAnswers[i]];
            }

            return arr;
        }
    }
}