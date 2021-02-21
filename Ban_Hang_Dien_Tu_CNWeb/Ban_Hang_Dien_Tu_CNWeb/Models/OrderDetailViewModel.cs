using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ban_Hang_Dien_Tu_CNWeb.Models
{
    public class OrderDetailViewModel
    {
        public Order Orders { get; set; }
        public List<Order_detail> Order_Details { get; set; }

    }
}