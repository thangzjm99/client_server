using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BanDoNoiThat.Models;

namespace BanDoNoiThat.DAO
{
    public class OrderDetailDao
    {
        Model1 db = null;
        public OrderDetailDao()
        {
            db = new Model1();
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