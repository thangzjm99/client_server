namespace Ban_Hang_Dien_Tu_CNWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Banner")]
    public partial class Banner
    {
        public long id { get; set; }

        [Column(TypeName = "text")]
        public string name { get; set; }
    }
}
