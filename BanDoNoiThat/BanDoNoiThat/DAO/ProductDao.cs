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

       // public List<ReportAll> Report_all()
       // {
       //     var result = from Product in db.Products
       //                  from a in (
       //                      (from Order_detail in db.Order_detail
       //                       group Order_detail by new
       //                       {
       //                           Order_detail.product_id
       //                       } into g
       //                       select new
       //                       {
       //                           g.Key.product_id,
       //                           sell_amount = g.Sum(p => p.amount),
       //                           sell_price = (double?)g.Sum(p => p.total_price)
       //                       }))
       //                  from b in (
       //                      (from Import in db.Imports
       //                       group Import by new
       //                       {
       //                           Import.id_product
       //                       } into g
       //                       select new
       //                       {
       //                           g.Key.id_product,
       //                           import_quantity = g.Sum(p => p.quantity),
       //                           import_price = (double?)g.Sum(p => p.import_price * (double)p.quantity)
       //                       }))
       //                  where
       //                    Product.id == a.product_id &&
       //                    Product.id == b.id_product
       //                  select new ReportAll
       //                  {
       //                      code = Product.code,
       //                      name = Product.name,
       //                      sell_amount = a.sell_amount,
       //                      sell_price = a.sell_price,
       //                      import_quantity = b.import_quantity,
       //                      import_price = b.import_price
       //                  };
       //     return result.ToList();
       // }

       // public List<ImportReport> Import_Report(DateTime start, DateTime end)
       // {
       //     var result = from ProductionCompany in db.ProductionCompanies
       //                  from A in (
       //                      (from Import in db.Imports
       //                       where
       //Import.created_at >= start && Import.created_at <= end
       //                       group Import by new
       //                       {
       //                           Import.id_productionCompany
       //                       } into g
       //                       select new
       //                       {
       //                           g.Key.id_productionCompany,
       //                           import_quantity = g.Sum(p => p.quantity),
       //                           import_price = (double?)g.Sum(p => p.import_price * (double)p.quantity)
       //                       }))
       //                  where
       //                    ProductionCompany.id == A.id_productionCompany
       //                  select new ImportReport
       //                  {
       //                     name= ProductionCompany.name,
       //                     email= ProductionCompany.email,
       //                     phone= ProductionCompany.phone,
       //                     import_quantity= A.import_quantity,
       //                     import_price= A.import_price
       //                  };

       //     return result.ToList();



       // }
    }

}