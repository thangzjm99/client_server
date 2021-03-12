using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanDoNoiThat.Models
{
    public class ImportReport
    {
        public string name { get; set; }

        public string email { get; set; }

        public string phone { get; set; }

        public long? import_quantity { get; set; }

        public double? import_price { get; set; }

    }
}