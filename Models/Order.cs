using System;
using System.Collections.Generic;

namespace BlazorApp2.Models;

public partial class Order
{
    public int Id { get; set; }

    public int CommodityId { get; set; }

    public DateTime OrderTime { get; set; }

    public int UserId { get; set; }
}
