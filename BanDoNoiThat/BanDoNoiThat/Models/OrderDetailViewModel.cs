using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanDoNoiThat.Models
{
    public class OrderDetailViewModel
    {
        public Order Orders { get; set; }
        public List<Order_detail> Order_Details { get; set; }

    }
}