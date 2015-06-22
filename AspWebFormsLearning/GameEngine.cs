using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AspWebFormsLearning
{
    [Serializable]
    public class GameEngine
    {
        public List<QA> _tasks = new List<QA>();

        public bool PeopleHelpUsed { get; private set; }
        public bool FriendHelpUsed { get; private set; }
        public bool FiftyFiftyUsed { get; private set; }

        public int CurrentTask { get; private set; }
        public int Attempts { get; private set; }
        public string[] AnswerVariants { get; private set; }



        public GameEngine()
        {
            PeopleHelpUsed = false;
            FriendHelpUsed = false;
            FiftyFiftyUsed = false;

            AnswerVariants = new string[4];
            Attempts = 3;
        }

        public bool CheckAnswer(string answer)
        {
            if (_tasks[CurrentTask].Answer == answer)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool SpendAttemp()
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

            AnswerVariants[0] = GetCurrentTask().Answer;
            AnswerVariants[1] = GetCurrentTask().WrongAnswers[0];
            AnswerVariants[2] = GetCurrentTask().WrongAnswers[1];
            AnswerVariants[3] = GetCurrentTask().WrongAnswers[2];
        }

        public QA GetCurrentTask()
        {
            return _tasks[CurrentTask];
        }

        public void NextTask()
        {
            if ((CurrentTask + 1) < _tasks.Count)
            {
                CurrentTask++;
                AnswerVariants[0] = GetCurrentTask().Answer;
                AnswerVariants[1] = GetCurrentTask().WrongAnswers[0];
                AnswerVariants[2] = GetCurrentTask().WrongAnswers[1];
                AnswerVariants[3] = GetCurrentTask().WrongAnswers[2];
                ShakeAnswers();
            }
            else
            {
                CurrentTask = 0;
                AnswerVariants[0] = GetCurrentTask().Answer;
                AnswerVariants[1] = GetCurrentTask().WrongAnswers[0];
                AnswerVariants[2] = GetCurrentTask().WrongAnswers[1];
                AnswerVariants[3] = GetCurrentTask().WrongAnswers[2];
                ShakeAnswers();
            }
        }

        public System.Drawing.Color[] PeopleHelp()
        {
            PeopleHelpUsed = true;

            System.Drawing.Color[] rating = new System.Drawing.Color[4];

            rating[0] = System.Drawing.Color.Red;
            rating[1] = System.Drawing.Color.Yellow;
            rating[2] = System.Drawing.Color.Green;
            rating[3] = System.Drawing.Color.GreenYellow;

            return RandomSort<System.Drawing.Color>(rating);
        }

        public int FriendHelp()
        {
            FriendHelpUsed = true;

            return (new Random()).Next(0, 4);
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