using TestApp.Model;

namespace TestApp.ViewModel
{
    public class CategoryVM
    {
        private Category _category;

        public CategoryVM()
        {
            this._category = new Category();
        }

        public CategoryVM(Category _category)
        {
            this._category = _category;
        }

        public string CategoryName
        {
            get { return _category.CategoryName; }
            set
            {
                _category.CategoryName = value;
            }
        }

        internal Category ToModel()
        {
            return _category;
        }
    }
}