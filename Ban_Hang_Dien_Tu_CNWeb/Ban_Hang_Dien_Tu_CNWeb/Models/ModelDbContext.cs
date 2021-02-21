namespace Ban_Hang_Dien_Tu_CNWeb.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ModelDbContext : DbContext
    {
        public ModelDbContext()
            : base("name=ModelDbContext2")
        {
        }

        public virtual DbSet<Banner> Banners { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<FAQ> FAQs { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Order_detail> Order_detail { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Slider> Sliders { get; set; }
        public virtual DbSet<Staff> Staffs { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Banner>()
                .Property(e => e.name)
                .IsUnicode(false);

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
                .Property(e => e.created_at)
                .IsFixedLength();

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Products)
                .WithOptional(e => e.Category)
                .HasForeignKey(e => e.category_id);

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
                .HasForeignKey(e => e.customer_id);

            modelBuilder.Entity<FAQ>()
                .Property(e => e.question)
                .IsUnicode(false);

            modelBuilder.Entity<FAQ>()
                .Property(e => e.answer)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.code)
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
                .HasMany(e => e.Order_detail)
                .WithOptional(e => e.Product)
                .HasForeignKey(e => e.product_id);

            modelBuilder.Entity<Slider>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Slider>()
                .Property(e => e.created_at)
                .IsFixedLength();

            modelBuilder.Entity<Staff>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.phone)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.address)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.created_at)
                .IsFixedLength();

            modelBuilder.Entity<Staff>()
                .HasMany(e => e.Orders)
                .WithOptional(e => e.Staff)
                .HasForeignKey(e => e.staff_id);
        }

        public System.Data.Entity.DbSet<Ban_Hang_Dien_Tu_CNWeb.Models.LoginModel> LoginModels { get; set; }
    }
}
