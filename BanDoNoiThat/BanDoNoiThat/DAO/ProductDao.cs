using BanDoNoiThat.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace BanDoNoiThat.DAO
{
    public class ProductDao
    {
        Model1 db = null;
        public ProductDao()
        {
            db = new Model1();
        }
        public List<Product> TakeProduct()
        {
            return db.Products.Where(x => x.id_category == 1).ToList();
        }
        public List<Product> TakeProduct2()
        {
            return db.Products.Where(x => x.id_category == 2).ToList();
        }
        public List<Product> TakeProduct3()
        {
            return db.Products.Where(x => x.id_category == 3).ToList();
        }
        public List<Product> TakeProduct4()
        {
            return db.Products.Where(x => x.id_category == 4).ToList();
        }
        public List<Product> NewArrival(int top)
        {
            return db.Products.OrderByDescending(x => x.created_at).Take(top).ToList();
        }
        public List<Product> BestSeller(int top)
        {
            return db.Products.OrderByDescending(x => x.price).Take(top).ToList();
        }
        public List<Product> FeatureProduct(int top)
        {
            return db.Products.OrderByDescending(x => x.star).Take(top).ToList();
        }
        public Product ViewDetail(long id)
        {
            return db.Products.Find(id);
        }
    }

}