using GalaSoft.MvvmLight.Command;
using System.Windows.Input;
using GalaSoft.MvvmLight;
using TestApp.Model;

namespace TestApp.ViewModel
{
    public class AddQuestionVM : ViewModelBase
    {
        private QuestionListVM _questionList;
        public QuestionVM Question { get; set; }

        public CategoryListVM AvailableCategories { get; set; }
        public string SelectedCategory { get; set; }
        
        public ICommand AddQuestionCommand { get; set; }

        public AddQuestionVM(QuestionListVM questionList)
        {
            this._questionList = questionList;
            AvailableCategories = new CategoryListVM();

            this.Question = new QuestionVM();
            AddQuestionCommand = new RelayCommand(AddQuestion, CanAddQuestion);
        }

        private void AddQuestion()
        {

            _questionList.Questions.Add(Question);

            using (var context = new QuizDatabaseEntities())
            {
                context.Questions.Add(Question.ToModel());
                context.SaveChanges();
            }

            _questionList.HideAddQuestion();
        }

        public bool CanAddQuestion()
        {
            return true;
        }

    }
}