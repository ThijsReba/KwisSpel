using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using TestApp.View;
using System.Data.Entity;
using System.Windows.Input;
using TestApp.Model;

namespace TestApp.ViewModel
{
    public class EditCategoryVM : ViewModelBase
    {

        public CategoryVM Category { get; set; }

        public ICommand SaveCommand { get; set; }

        public EditCategoryVM(CategoryVM selectedCategory)
        {
            this.Category = selectedCategory;
            //Een relay command met een Window als parameter! Super handig :)
            SaveCommand = new RelayCommand<EditCategoryWindow>(Save);
        }

        private void Save(EditCategoryWindow window)
        {
            using (var context = new QuizDatabaseEntities())
            {
                var category = Category.ToModel();
                //Even aan entity framework laten weten dat we dingen hebben aangepast!
                context.Entry(category).State = EntityState.Modified;
                context.SaveChanges();
            }

            window.Hide();
        }
    }
}
