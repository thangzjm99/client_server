namespace BanDoNoiThat.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Import> Imports { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Order_detail> Order_detail { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductionCompany> ProductionCompanies { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.slug)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Products)
                .WithOptional(e => e.Category)
                .HasForeignKey(e => e.id_category);

            modelBuilder.Entity<Customer>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.phone)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.address)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Orders)
                .WithOptional(e => e.Customer)
                .HasForeignKey(e => e.id_customer);

            modelBuilder.Entity<Order>()
                .Property(e => e.customer_name)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.address)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.phone)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.note)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.Order_detail)
                .WithOptional(e => e.Order)
                .HasForeignKey(e => e.order_id);

            modelBuilder.Entity<Product>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.slug)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.overview)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.image)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.detail)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.unit)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.Imports)
                .WithOptional(e => e.Product)
                .HasForeignKey(e => e.id_product)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Product>()
                .HasMany(e => e.Order_detail)
                .WithOptional(e => e.Product)
                .HasForeignKey(e => e.product_id);

            modelBuilder.Entity<ProductionCompany>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<ProductionCompany>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<ProductionCompany>()
                .Property(e => e.address)
                .IsUnicode(false);

            modelBuilder.Entity<ProductionCompany>()
                .Property(e => e.phone)
                .IsUnicode(false);

            modelBuilder.Entity<ProductionCompany>()
                .HasMany(e => e.Imports)
                .WithOptional(e => e.ProductionCompany)
                .HasForeignKey(e => e.id_productionCompany)
                .WillCascadeOnDelete();
        }
    }
}
