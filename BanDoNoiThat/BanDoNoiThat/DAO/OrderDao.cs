using BanDoNoiThat.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace BanDoNoiThat.DAO
{
    public class OrderDao
    {
        Model1 db = null;
        public OrderDao()
        {
            db = new Model1();
        }

        public long Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.id;
        }
    }
}