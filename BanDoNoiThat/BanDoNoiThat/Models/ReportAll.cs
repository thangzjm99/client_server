using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanDoNoiThat.Models
{
    public class ReportAll
    {
        public string code { get; set; }
        public double? import_price { get; set; }
        public long? import_quantity { get; set; }
        public string name { get; set; }
        public long? sell_amount { get; set; }
        public double? sell_price { get; set; }

    }
}