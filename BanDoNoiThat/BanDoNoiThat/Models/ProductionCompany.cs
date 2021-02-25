namespace BanDoNoiThat.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductionCompany")]
    public partial class ProductionCompany
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductionCompany()
        {
            Imports = new HashSet<Import>();
        }

        public long id { get; set; }

        [StringLength(225)]
        public string name { get; set; }

        [StringLength(225)]
        public string email { get; set; }

        [Column(TypeName = "text")]
        public string address { get; set; }

        [StringLength(225)]
        public string phone { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Import> Imports { get; set; }
    }
}
