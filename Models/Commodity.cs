using System;
using System.Collections.Generic;

namespace BlazorApp2.Models;

public partial class Commodity
{
    public int Id { get; set; }

    public string? Photoref { get; set; }

    public string? Name { get; set; }

    public int Price { get; set; }
}
