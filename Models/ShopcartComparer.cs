
namespace BlazorApp2.Models
{
    public class ShopcartComparer : IComparer<Shopcart>
    {
        public int Compare(Shopcart? x, Shopcart? y)
        {
        if (x == null && y == null)
            return 0;
        if (x == null ) return -1; 
        if (y == null ) return 1;
        return x.Id.CompareTo(y.Id);
        }
    }
}
