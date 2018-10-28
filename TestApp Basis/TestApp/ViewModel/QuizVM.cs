using GalaSoft.MvvmLight;
using System.Collections.Generic;
using System.Linq;
using TestApp.Model;

namespace TestApp.ViewModel
{
    public class QuizVM : ViewModelBase
    {
        private Quiz _quiz;

        public QuizVM()
        {
            this._quiz = new Quiz();
        }

        public QuizVM(Quiz _quiz)
        {
            this._quiz = _quiz;
        }

        public int Id
        {
            get { return _quiz.QuizId; }
            set
            {
                _quiz.QuizId = value;

            }
        }

        public string Description
        {
            get { return _quiz.Description; }
            set
            {
                _quiz.Description = value;
            }
        }

        public int QuizId
        {
            get { return _quiz.QuizId; }
            set
            {
                _quiz.QuizId = value;
            }
        }

        public List<Question> QuestionsFromThisQuiz
        {
            get { return _quiz.Questions.ToList(); }

        }

        internal Quiz ToModel()
        {
            return _quiz;
        }
    }
}