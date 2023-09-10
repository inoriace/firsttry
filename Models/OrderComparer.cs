namespace BlazorApp2.Models
{
	public class OrderComparer:IComparer<Order>
	{
		public int Compare(Order? o1, Order? o2) 
		{
			if (o1 == null && o2 == null) return 0;
			if(o1 == null ) return -1; 
			if(o2 == null ) return 1;
			return o1.Id.CompareTo(o2.Id);
		}
	}
}
