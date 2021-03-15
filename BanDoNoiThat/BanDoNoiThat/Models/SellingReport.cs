using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanDoNoiThat.Models
{
    public class SellingReport
    {
        public string name { get; set; }

        public string code { get; set; }

        public long? selling_amount { get; set; }

        public double? selling_price { get; set; }
    }
}