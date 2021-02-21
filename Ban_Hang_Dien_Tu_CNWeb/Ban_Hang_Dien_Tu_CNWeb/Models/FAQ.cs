namespace Ban_Hang_Dien_Tu_CNWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FAQ")]
    public partial class FAQ
    {
        public long id { get; set; }

        [StringLength(255)]
        public string question { get; set; }

        [StringLength(255)]
        public string answer { get; set; }

        public DateTime? created_at { get; set; }
    }
}
