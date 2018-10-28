using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using System.Data.Entity;
using System.Windows.Input;
using System.Linq;
using TestApp.Model;

namespace TestApp.ViewModel
{
    public class EditQuestionVM : ViewModelBase
    {
        public QuestionVM Question { get; set; }
        public CategoryListVM AvailableCategories { get; set; }
        public string SelectedCategory { get; set; }

        public ICommand SaveCommand { get; set; }

        public EditQuestionVM(QuestionVM selectedQuestion)
        {
            this.Question = selectedQuestion;
            AvailableCategories = new CategoryListVM();

            SaveCommand = new RelayCommand<EditQuestionWindow>(Save);
        }

        private void Save(EditQuestionWindow window)
        {

            using (var context = new QuizDatabaseEntities())
            {
                Question question = context.Questions.Where(q => q.QuestionId == Question.QuestionId).First();
                question.CategoryName = Question.CategoryName;
                question.Description = Question.Description;

                context.Entry(question).State = EntityState.Modified;
                context.SaveChanges();
            }
            window.Hide();
        }
    }
}
