using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using System.Collections.ObjectModel;
using System.Linq;
using TestApp.View;
using System.Windows.Input;
using System.Data.Entity;
using TestApp.Model;

namespace TestApp.ViewModel
{
    public class QuizListVM : ViewModelBase
    {
        public ObservableCollection<QuizVM> Quizes { get; set; }

        private QuizManagementWindow _quizManagementWindow;
        private AddQuizWindow _addQuizWindow;
        private QuestionManagementWindow _questionManagementWindow;
        private CategoryManagementWindow _categoryManagementWindow;
        private QuizVM _selectedQuiz;

        public ICommand ShowAddQuizCommand { get; set; }
        public ICommand ShowQuizManagementCommand { get; set; }
        public ICommand ShowEditQuizCommand { get; set; }
        public ICommand DeleteQuizCommand { get; set; }

        public ICommand ShowQuestionManagementCommand { get; set; }
        public ICommand ShowCategoryManagementCommand { get; set; }

        public QuizListVM()
        {
            using (var context = new QuizDatabaseEntities())
            {
                var quizs = context.Quizs
                    .Include("Questions")
                    .ToList()
                    .Select(a => new QuizVM(a));

                Quizes = new ObservableCollection<QuizVM>(quizs);
            }

            ShowQuizManagementCommand = new RelayCommand(ShowQuizManagement, CanShowQuizManagement);

            ShowAddQuizCommand = new RelayCommand(ShowAddQuiz, CanShowAddQuiz);
            ShowEditQuizCommand = new RelayCommand(ShowEditQuizWindow);
            DeleteQuizCommand = new RelayCommand(DeleteQuiz);

            ShowQuestionManagementCommand = new RelayCommand(ShowQuestionManagement, CanShowQuestionManagement);
            ShowCategoryManagementCommand = new RelayCommand(ShowCategoryManagement, CanShowCategoryManagement);
        }

        public QuizVM SelectedQuiz
        {
            get { return _selectedQuiz; }
            set
            {
                _selectedQuiz = value;
                base.RaisePropertyChanged();
            }
        }

        public void ShowQuizManagement()
        {
            _quizManagementWindow = new QuizManagementWindow();
            _quizManagementWindow.Show();
        }

        public bool CanShowQuizManagement()
        {
            return _quizManagementWindow != null ? !_quizManagementWindow.IsVisible : true;
        }

        public void ShowEditQuizWindow()
        {
            var editQuiz = new EditQuizWindow();
            editQuiz.Show();
        }

        public void ShowAddQuiz()
        {
            _addQuizWindow = new AddQuizWindow();
            _addQuizWindow.Show();
        }

        public bool CanShowAddQuiz()
        {
            return _addQuizWindow != null ? !_addQuizWindow.IsVisible : true;
        }

        public void HideAddQuiz()
        {
            _addQuizWindow.Close();
        }

        public void DeleteQuiz()
        {
            using (var context = new QuizDatabaseEntities())
            {
                var quiz = SelectedQuiz.ToModel();
                //Even aan entity framework laten weten dat we dingen hebben aangepast!
                context.Entry(quiz).State = EntityState.Deleted;
                //context.Quizs.Remove(quiz);
                context.SaveChanges();
            }
            Quizes.Remove(SelectedQuiz);
        }

        public void ShowQuestionManagement()
        {
            _questionManagementWindow = new QuestionManagementWindow();
            _questionManagementWindow.Show();
        }

        public bool CanShowQuestionManagement()
        {
            return _questionManagementWindow != null ? !_questionManagementWindow.IsVisible : true;
        }

        public void ShowCategoryManagement()
        {
            _categoryManagementWindow = new CategoryManagementWindow();
            _categoryManagementWindow.Show();
        }

        public bool CanShowCategoryManagement()
        {
            return _categoryManagementWindow != null ? !_categoryManagementWindow.IsVisible : true;
        }

    }
}
