using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Ban_Hang_Dien_Tu_CNWeb.Models;

namespace Ban_Hang_Dien_Tu_CNWeb.DAO
{
    public class OrderDetailDao
    {
        ModelDbContext db = null;
        public OrderDetailDao()
        {
            db = new ModelDbContext();
        }

        public bool Insert(Order_detail detail)
        {
            try
            {
                db.Order_detail.Add(detail);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }

        public List<Order_detail> TakeOrderDetail(long?  orderid)
        {
            return db.Order_detail.Where(x => x.order_id == orderid).ToList();
        }
    }
}