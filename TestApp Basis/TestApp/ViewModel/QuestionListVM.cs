using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;
using TestApp.Model;

namespace TestApp.ViewModel
{
    public class QuestionListVM : ViewModelBase
    {
        public ObservableCollection<QuestionVM> Questions { get; set; }

        public ICommand ShowEditQuestionCommand { get; set; }

        private AddQuestionWindow _addQuestionWindow;
        private QuestionVM _selectedQuestion;

        public ICommand ShowAddQuestionCommand { get; set; }

        public QuestionListVM()
        {
            using (var context = new QuizDatabaseEntities())
            {
                var questions = context.Questions
                    .Include("Category")
                    .ToList()
                    .Select(e => new QuestionVM(e));

                Questions = new ObservableCollection<QuestionVM>(questions);
            }

            ShowAddQuestionCommand = new RelayCommand(ShowAddQuestion, CanShowAddQuestion);
            ShowEditQuestionCommand = new RelayCommand(ShowEditQuestionWindow);
        }

        public QuestionVM SelectedQuestion
        {
            get { return _selectedQuestion; }
            set
            {
                _selectedQuestion = value;
                base.RaisePropertyChanged();
            }
        }

        public void ShowEditQuestionWindow()
        {
            var editQuestion = new EditQuestionWindow();
            editQuestion.Show();
        }

        public void ShowAddQuestion()
        {
            _addQuestionWindow = new AddQuestionWindow();
            _addQuestionWindow.Show();
        }

        public bool CanShowAddQuestion()
        {
            return _addQuestionWindow != null ? !_addQuestionWindow.IsVisible : true;
        }

        public void HideAddQuestion()
        {
            _addQuestionWindow.Close();
        }
    }
}
