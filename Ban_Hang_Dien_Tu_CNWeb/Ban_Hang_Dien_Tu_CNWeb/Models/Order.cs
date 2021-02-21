namespace Ban_Hang_Dien_Tu_CNWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            Order_detail = new HashSet<Order_detail>();
        }

        public long id { get; set; }

        [StringLength(255)]
        public string code { get; set; }

        public long? customer_id { get; set; }

        public long? staff_id { get; set; }

        [StringLength(255)]
        public string address { get; set; }

        [StringLength(255)]
        public string phone { get; set; }

        [StringLength(255)]
        public string email { get; set; }

        public double? total_price { get; set; }

        [StringLength(255)]
        public string note { get; set; }

        public int? status { get; set; }

        public DateTime? created_at { get; set; }

        public virtual Customer Customer { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order_detail> Order_detail { get; set; }

        public virtual Staff Staff { get; set; }
    }
}
