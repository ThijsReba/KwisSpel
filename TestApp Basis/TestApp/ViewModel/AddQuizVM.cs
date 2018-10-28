using GalaSoft.MvvmLight.Command;
using System.Windows.Input;
using GalaSoft.MvvmLight;
using TestApp.Model;

namespace TestApp.ViewModel
{
    public class AddQuizVM : ViewModelBase
    {
        private QuizListVM _quizList;

        public QuizVM Quiz { get; set; }

        public ICommand AddQuizCommand { get; set; }

        public AddQuizVM(QuizListVM quizList)
        {
            this._quizList = quizList;
            this.Quiz = new QuizVM();
            AddQuizCommand = new RelayCommand(AddQuiz, CanAddQuiz);
        }

        private void AddQuiz()
        {
            _quizList.Quizes.Add(Quiz);

            using (var context = new QuizDatabaseEntities())
            {
                context.Quizs.Add(Quiz.ToModel());
                context.SaveChanges();
            }

            _quizList.HideAddQuiz();
        }

        public bool CanAddQuiz()
        {
            return true;
        }
    }
}