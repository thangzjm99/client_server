namespace Ban_Hang_Dien_Tu_CNWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order_detail
    {
        public long id { get; set; }

        public long? order_id { get; set; }

        public long? product_id { get; set; }

        public long? amount { get; set; }

        public double? total_price { get; set; }

        public DateTime? created_at { get; set; }

        public virtual Order Order { get; set; }

        public virtual Product Product { get; set; }
    }
}
