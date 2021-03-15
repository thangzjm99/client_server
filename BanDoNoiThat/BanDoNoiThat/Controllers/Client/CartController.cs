using BanDoNoiThat.Common;
using BanDoNoiThat.DAO;
using BanDoNoiThat.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Windows;

namespace BanDoNoiThat.Controllers.Client
{
    public class CartController : Controller
    {
        Model1 db = new Model1();
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index(string error_message)
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            ViewBag.Product = db.Products.ToList();
            ViewBag.ErrorMessage = error_message;
            return View(list);
        }


        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }

        public JsonResult Delete(long id)
        {
            var sessiongCart = (List<CartItem>)Session[CartSession];
            sessiongCart.RemoveAll(x => x.Product.id == id);
            Session[CartSession] = sessiongCart;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessiongCart = (List<CartItem>)Session[CartSession];
            foreach (var item in sessiongCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.id == item.Product.id);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;

                }
            }
            Session[CartSession] = sessiongCart;
            return Json(new
            {
                status = true
            });
        }
        public ActionResult AddItem(long productId, int quantity)
        {
            var product = new ProductDao().ViewDetail(productId);
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.id == productId))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.id == productId)
                        {
                            item.Quantity += quantity;

                        }
                    }
                }
                else
                {
                    //Tao ra Cart Item
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                //Gan vao Session
                Session[CartSession] = list;

            }
            else
            {
                //Tao ra doi tuong moi trong Cart Item
                var item = new CartItem();
                item.Product = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                //Gan vao Session
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Payment()
        {
            var usersession = (UserLogin)Session[BanDoNoiThat.Common.CommonConstants.USER_SESSION];
            if (usersession == null)
            {


            }
            else
            {
                Customer customer = db.Customers.Find(usersession.UserID);
                ViewBag.UserName = customer.name;
                ViewBag.UserPhone = customer.phone;
                ViewBag.UserAddress = customer.address;
                ViewBag.UserEmail = customer.email;

            }
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
                foreach(var item in list)
                {
                    var remain_quantity = db.Products.Find(item.Product.id).remain_quantity;
                    if (item.Quantity <= remain_quantity)
                    {
                    }
                    else
                    {
                        //MessageBox.Show("Please do not exceed the remaining quantity");
                        
                        return RedirectToAction("Index","Cart",new { error_message = "Please do not exceed the remaining quantity" });

                    }
                }    

            }
            
            return View(list);

        }

        [HttpPost]
        public ActionResult Payment(string shipName, string mobile, string address, string email)
        {
            double totalprice = Convert.ToDouble(Request.Form["totalprice"]);
            var order = new Order();
            var usersession = (UserLogin)Session[BanDoNoiThat.Common.CommonConstants.USER_SESSION];
            if (usersession == null)
            {


            }
            else
            {
                Customer customer = db.Customers.Find(usersession.UserID);
                order.id_customer = customer.id;
            }
            order.created_at = DateTime.Now;
            order.address = address;
            order.email = email;
            order.customer_name = shipName;
            order.phone = mobile;
            order.total_price = totalprice;
            try
            {

                var id = new OrderDao().Insert(order);
                var cart = (List<CartItem>)Session[CartSession];
                var detailDao = new OrderDetailDao();
                foreach (var item in cart)
                {
                    var remain_quantity = db.Products.Find(item.Product.id).remain_quantity;
                    if (item.Quantity <= remain_quantity)
                    {

                    }
                    else
                    {
                        MessageBox.Show("Please do not exceed the remaining quantity");
                        return RedirectToAction("Index");
                        
                    }
                }

                foreach (var item in cart)
                {
                    
                    var remain_quantity = db.Products.Find(item.Product.id).remain_quantity;
                    if(item.Quantity <= remain_quantity)
                    {
                        var orderDetail = new Order_detail();
                        orderDetail.created_at = DateTime.Now;
                        orderDetail.product_id = item.Product.id;
                        orderDetail.order_id = id;
                        orderDetail.total_price = item.Product.price*item.Quantity;
                        orderDetail.amount = item.Quantity;
                        detailDao.Insert(orderDetail);
                        db.Products.Find(item.Product.id).remain_quantity -= item.Quantity;
                        db.SaveChanges();
                    }
                    

                }




            }
            catch (Exception ex)
            {
                return Redirect("/loi-thanh-toan");
            }

            return Redirect("/hoan-thanh");

        }

        public ActionResult Success()
        {
            return View();
        }
    }
}