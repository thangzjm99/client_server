namespace Ban_Hang_Dien_Tu_CNWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            Order_detail = new HashSet<Order_detail>();
        }

        public long id { get; set; }

        [StringLength(10)]
        public string code { get; set; }

        public long? category_id { get; set; }

        [StringLength(255)]
        public string name { get; set; }

        [StringLength(255)]
        public string slug { get; set; }

        [StringLength(255)]
        public string overview { get; set; }

        [Column(TypeName = "text")]
        public string image { get; set; }

        [StringLength(255)]
        public string description { get; set; }

        [StringLength(255)]
        public string detail { get; set; }

        public double? price { get; set; }

        [StringLength(255)]
        public string unit { get; set; }

        public double? sale { get; set; }

        public double? star { get; set; }

        public bool? is_stock { get; set; }

        public bool? is_active { get; set; }

        public DateTime? created_at { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order_detail> Order_detail { get; set; }
    }
}
