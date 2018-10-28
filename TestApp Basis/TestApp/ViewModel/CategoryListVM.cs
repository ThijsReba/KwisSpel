using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using System.Collections.ObjectModel;
using System.Linq;
using TestApp.View;
using TestApp.Model;
using System.Windows.Input;
using System.Data.Entity;

namespace TestApp.ViewModel
{
    public class CategoryListVM : ViewModelBase
    {
        public ObservableCollection<CategoryVM> Categories { get; set; }

        private CategoryManagementWindow _categoryManagementWindow;
        private AddCategoryWindow _addCategoryWindow;

        private CategoryVM _selectedCategory;

        public ICommand ShowAddCategoryCommand { get; set; }
        public ICommand ShowCategoryManagementCommand { get; set; }
        public ICommand ShowEditCategoryCommand { get; set; }
        public ICommand DeleteCategoryCommand { get; set; }


        public CategoryListVM()
        {
            using (var context = new QuizDatabaseEntities())
            {
                var categories = context.Categories
                    .ToList()
                    .Select(a => new CategoryVM(a));

                Categories = new ObservableCollection<CategoryVM>(categories);
            }

            ShowCategoryManagementCommand = new RelayCommand(ShowCategoryManagement, CanShowCategoryManagement);

            ShowAddCategoryCommand = new RelayCommand(ShowAddCategory, CanShowAddCategory);
            ShowEditCategoryCommand = new RelayCommand(ShowEditCategoryWindow);
            DeleteCategoryCommand = new RelayCommand(DeleteCategory);
        }

        public CategoryVM SelectedCategory
        {
            get { return _selectedCategory; }
            set
            {
                _selectedCategory = value;
                base.RaisePropertyChanged();
            }
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

        public void ShowEditCategoryWindow()
        {
            var editCategory = new EditCategoryWindow();
            editCategory.Show();
        }

        public void ShowAddCategory()
        {
            _addCategoryWindow = new AddCategoryWindow();
            _addCategoryWindow.Show();
        }

        public bool CanShowAddCategory()
        {
            return _addCategoryWindow != null ? !_addCategoryWindow.IsVisible : true;
        }

        public void HideAddCategory()
        {
            _addCategoryWindow.Close();
        }

        public void DeleteCategory()
        {

            using (var context = new QuizDatabaseEntities())
            {
                var category = SelectedCategory.ToModel();
                //Even aan entity framework laten weten dat we dingen hebben aangepast!
                context.Entry(category).State = EntityState.Deleted;
                context.SaveChanges();

            }
            Categories.Remove(SelectedCategory);
        }
    }
}
