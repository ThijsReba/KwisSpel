using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using TestApp.View;
using TestApp.Model;
using System.Data.Entity;
using System.Linq;
using System.Windows.Input;

namespace TestApp.ViewModel
{
    public class EditQuizVM : ViewModelBase
    {
        public QuizVM Quiz { get; set; }

        public ICommand SaveCommand { get; set; }

        public EditQuizVM(QuizVM selectedQuiz)
        {
            this.Quiz = selectedQuiz;
            //Een relay command met een Window als parameter! Super handig :)
            SaveCommand = new RelayCommand<EditQuizWindow>(Save);
        }

        private void Save(EditQuizWindow window)
        {
            using (var context = new QuizDatabaseEntities())
            {
                Quiz quiz = context.Quizs.Where(q => q.QuizId == Quiz.QuizId).First();
                quiz.Description = Quiz.Description;

                context.Entry(quiz).State = EntityState.Modified;
                context.SaveChanges();
            }
            window.Hide();
        }
    }
}
