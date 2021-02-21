using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Ban_Hang_Dien_Tu_CNWeb.Models;
using Ban_Hang_Dien_Tu_CNWeb.Common;
using Ban_Hang_Dien_Tu_CNWeb.DAO;

namespace Ban_Hang_Dien_Tu_CNWeb.Controllers.Client
{
    public class PageController : Controller
    {
        // GET: Page
      
        private ModelDbContext dbModel = new ModelDbContext();
        public ActionResult Index()
        {
            var ProductDao = new ProductDao();
            ViewBag.Laptop = ProductDao.TakeProduct();
            ViewBag.Cat2 = ProductDao.TakeProduct2();
            ViewBag.Cat3 = ProductDao.TakeProduct3();
            ViewBag.Cat4 = ProductDao.TakeProduct4();
            ViewBag.NewArrival = ProductDao.NewArrival(6);
            ViewBag.BestSeller = ProductDao.BestSeller(6);
            ViewBag.FeatureProduct = ProductDao.FeatureProduct(6);
            return View();
        }

        public ActionResult AboutUs()
        {
            return View();
        }

        public ActionResult BlogList()
        {
            return View();
        }

        public ActionResult BlogDetail()
        {
            return View();
        }

        public ActionResult CheckOut()
        {
            return View();
        }

        public ActionResult Compare()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult FaQ()
        {
            return View();
        }

        public ActionResult Login(string username,string password)
        {

            if(username == "admin" && password =="123")
            {
               return Redirect("~/Products/Index");

            }

            else
            {
                return View();
            }
         
        }

        public ActionResult Register()
        {
            return View();

        }

        [ChildActionOnly]
        public PartialViewResult HeaderCart()
        {
            var cart = Session[CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;

            }
            return PartialView(list);

        }

        [HttpPost]
        public ActionResult Register(string first_name, string last_name, string email, string password)
        {
            ViewBag.first_name = first_name;
            ViewBag.last_name = last_name;
            ViewBag.email = "hello";
            ViewBag.pasword = password;

            return RedirectToAction("Login");
        }

        public ActionResult Category(int id)
        {
                List<Category> categoryList = dbModel.Categories.ToList();
                ViewBag.categoryList = categoryList;
                List<Product> productList = dbModel.Products.Where(x => x.category_id == id).ToList();
                ViewBag.productList = productList;
                return View();
            
        }

        public ActionResult Cart()
        {

            return View();


        }
        public ActionResult ProductDeTail(int id)
        {
            List<Category> categoryList = dbModel.Categories.ToList();
            ViewBag.categoryList = categoryList;
            Product product = dbModel.Products.Where(x => x.id == id).FirstOrDefault();
            ViewBag.productName = product.name;
            ViewBag.productOverview = product.overview;
            ViewBag.productPrice = product.price;
            ViewBag.productSale = product.sale;
            ViewBag.productSale = product.sale;
            ViewBag.productImage = product.image;
            ViewBag.productDescription = product.description;
            ViewBag.productDetail = product.detail;
            ViewBag.productStock = product.is_stock;
            ViewBag.productUnit = product.unit;
            ViewBag.productId = product.id;
            ViewBag.productAmount = product.unit;

            List<Product> sameProductList = dbModel.Products.Where(x => x.category_id == product.category_id).ToList();
            ViewBag.sameProductList = sameProductList;
            return View();
        }

        public ActionResult Product(string searchKey,string searchBy)
        {

            var products = dbModel.Products.Include(x => x.Category);
            if (!String.IsNullOrEmpty(searchKey))
            {
                if (searchBy == "all")
                {
                    return View(products.Where(b => b.name.Contains(searchKey) || searchKey == null).ToList());

                }
                

                else
                {
                    return View(products.ToList());
                }
            }
            return View(products.ToList());
            

        }

    }
}