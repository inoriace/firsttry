namespace BlazorApp2.Models
{
    public class UserIdComparer:IComparer<User>
    {
        public int Compare(User? x, User? y)
        {
            if (x == null && y == null) return 0;
            if (x == null) return -1;
            if (y == null) return 1;
            return x.Id.CompareTo(y.Id);
        }
    }
}
