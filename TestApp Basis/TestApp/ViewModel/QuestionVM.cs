using TestApp.Model;

namespace TestApp.ViewModel
{
    public class QuestionVM
    {
        private Question _question;

        public QuestionVM()
        {
            this._question = new Question();
        }

        public QuestionVM(Question _question)
        {
            this._question = _question;
        }

        public int QuestionId
        {
            get { return _question.QuestionId; }
            set
            {
                _question.QuestionId = value;
            }
        }

        public string Description
        {
            get { return _question.Description; }
            set
            {
                _question.Description = value;
            }
        }

        public string CategoryName
        {
            get { return _question.CategoryName; }
            set
            {
                _question.CategoryName = value;

            }

        }

        internal Question ToModel()
        {
            return _question;
        }
    }
}