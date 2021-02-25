namespace BanDoNoiThat.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Import")]
    public partial class Import
    {
        public long id { get; set; }

        public long? id_product { get; set; }

        public long? id_productionCompany { get; set; }

        public double? import_price { get; set; }

        public long? quantity { get; set; }

        public DateTime? created_at { get; set; }

        public virtual Product Product { get; set; }

        public virtual ProductionCompany ProductionCompany { get; set; }
    }
}
