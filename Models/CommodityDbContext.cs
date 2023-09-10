using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace BlazorApp2.Models;

public partial class CommodityDbContext : DbContext
{
    public CommodityDbContext()
    {
    }

    public CommodityDbContext(DbContextOptions<CommodityDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Commodity> Commodities { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<Shopcart> Shopcarts { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost\\SQLEXPRESS;Database=CommodityDB;Trusted_Connection=True;Encrypt=True;TrustServerCertificate=True;");
	
	protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Commodity>(entity =>
        {
            entity.ToTable("Commodity");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name");
            entity.Property(e => e.Photoref)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("photoref");
            entity.Property(e => e.Price).HasColumnName("price");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.ToTable("Order");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.OrderTime).HasColumnType("datetime");
        });

        modelBuilder.Entity<Shopcart>(entity =>
        {
            entity.ToTable("Shopcart");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.CommodityId).HasColumnName("CommodityID");
            entity.Property(e => e.UserId).HasColumnName("UserID");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Balance).HasColumnName("balance");
            entity.Property(e => e.Password)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.Username)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("USERname");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
