using GalaSoft.MvvmLight.Command;
using System.Windows.Input;
using GalaSoft.MvvmLight;
using TestApp.Model;

namespace TestApp.ViewModel
{
    public class AddCategoryVM : ViewModelBase
    {
        private CategoryListVM _categoryList;

        public CategoryVM Category { get; set; }

        public ICommand AddCategoryCommand { get; set; }

        public AddCategoryVM(CategoryListVM categoryList)
        {
            this._categoryList = categoryList;
            this.Category = new CategoryVM();
            AddCategoryCommand = new RelayCommand(AddCategory, CanAddCategory);
        }

        private void AddCategory()
        {
            _categoryList.Categories.Add(Category);

            using (var context = new QuizDatabaseEntities())
            {
                context.Categories.Add(Category.ToModel());
                context.SaveChanges();
            }

            _categoryList.HideAddCategory();
        }

        public bool CanAddCategory()
        {
            return true;
        }
    }
}