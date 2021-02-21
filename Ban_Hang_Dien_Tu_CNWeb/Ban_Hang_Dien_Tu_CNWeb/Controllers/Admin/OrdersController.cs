using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Ban_Hang_Dien_Tu_CNWeb.Models;
using Ban_Hang_Dien_Tu_CNWeb.DAO;

namespace Ban_Hang_Dien_Tu_CNWeb.Controllers.Admin
{
    public class OrdersController : Controller
    {
        private ModelDbContext db = new ModelDbContext();

      
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.Staff);
            return View(orders.ToList());
        }

        
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            var orderDetailDao = new OrderDetailDao();
            ViewBag.TakeOrderDetail = orderDetailDao.TakeOrderDetail(id);



           
            
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        
        public ActionResult Create()
        {
            ViewBag.customer_id = new SelectList(db.Customers, "id", "name");
            ViewBag.staff_id = new SelectList(db.Staffs, "id", "name");
            return View();
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,code,customer_id,staff_id,address,phone,email,total_price,note,status,created_at")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Orders.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.customer_id = new SelectList(db.Customers, "id", "name", order.customer_id);
            ViewBag.staff_id = new SelectList(db.Staffs, "id", "name", order.staff_id);
            return View(order);
        }

      
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.customer_id = new SelectList(db.Customers, "id", "name", order.customer_id);
            ViewBag.staff_id = new SelectList(db.Staffs, "id", "name", order.staff_id);
            return View(order);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,code,customer_id,staff_id,address,phone,email,total_price,note,status,created_at")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.customer_id = new SelectList(db.Customers, "id", "name", order.customer_id);
            ViewBag.staff_id = new SelectList(db.Staffs, "id", "name", order.staff_id);
            return View(order);
        }

       
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

       
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
