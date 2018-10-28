using CommonServiceLocator;
using GalaSoft.MvvmLight.Ioc;

namespace TestApp.ViewModel
{
    public class ViewModelLocator
    {
        public ViewModelLocator()
        {
            ServiceLocator.SetLocatorProvider(() => SimpleIoc.Default);

            SimpleIoc.Default.Register<MainViewModel>();
            SimpleIoc.Default.Register<QuizListVM>();
            SimpleIoc.Default.Register<QuestionListVM>();
            SimpleIoc.Default.Register<CategoryListVM>();
        }

        public MainViewModel Main
        {
            get
            {
                return ServiceLocator.Current.GetInstance<MainViewModel>();
            }
        }

        public QuizListVM QuizList
        {
            get
            {
                return ServiceLocator.Current.GetInstance<QuizListVM>();
            }
        }

        public EditQuizVM UpdateQuiz
        {
            get
            {
                return new EditQuizVM(QuizList.SelectedQuiz);
            }
        }

        public AddQuizVM AddQuiz
        {
            get
            {
                return new AddQuizVM(this.QuizList);
            }
        }

        public QuestionListVM QuestionList
        {
            get
            {
                return ServiceLocator.Current.GetInstance<QuestionListVM>();
            }
        }

        public AddQuestionVM AddQuestion
        {
            get
            {
                return new AddQuestionVM(this.QuestionList);
            }
        }

        public EditQuestionVM UpdateQuestion
        {
            get
            {
                return new EditQuestionVM(QuestionList.SelectedQuestion);
            }
        }


        public CategoryListVM CategoryList
        {
            get
            {
                return ServiceLocator.Current.GetInstance<CategoryListVM>();
            }
        }

        public EditCategoryVM UpdateCategory
        {
            get
            {
                return new EditCategoryVM(CategoryList.SelectedCategory);
            }
        }

        public AddCategoryVM AddCategory
        {
            get
            {
                return new AddCategoryVM(this.CategoryList);
            }
        }


        public static void Cleanup()
        {
            // TODO Clear the ViewModels
        }
    }
}