using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Millionaire.Entities;

namespace Millionaire.Repository
{
    public interface ITaskRepository
    {
        IEnumerable<QA> GetQuestions();
    }
}
