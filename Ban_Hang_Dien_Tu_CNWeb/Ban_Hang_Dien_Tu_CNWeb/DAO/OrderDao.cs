using Ban_Hang_Dien_Tu_CNWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Ban_Hang_Dien_Tu_CNWeb.DAO
{
    public class OrderDao
    {
        ModelDbContext db = null;
        public OrderDao()
        {
            db = new ModelDbContext();
        }

        public long Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.id;
        }
    }
}