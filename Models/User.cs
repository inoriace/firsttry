using System;
using System.Collections.Generic;

namespace BlazorApp2.Models;

public partial class User
{
    public int Id { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public int Balance { get; set; }
}
