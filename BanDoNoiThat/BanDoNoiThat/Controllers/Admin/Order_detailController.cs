using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BanDoNoiThat.Models;

namespace BanDoNoiThat.Controllers.Admin
{
    public class Order_detailController : Controller
    {
        private Model1 db = new Model1();

        // GET: Order_detail
        public ActionResult Index()
        {
            var order_detail = db.Order_detail.Include(o => o.Order).Include(o => o.Product);
            return View(order_detail.ToList());
        }

        // GET: Order_detail/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order_detail order_detail = db.Order_detail.Find(id);
            if (order_detail == null)
            {
                return HttpNotFound();
            }
            return View(order_detail);
        }

        // GET: Order_detail/Create
        public ActionResult Create()
        {
            ViewBag.order_id = new SelectList(db.Orders, "id", "customer_name");
            ViewBag.product_id = new SelectList(db.Products, "id", "name");
            return View();
        }

        // POST: Order_detail/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,order_id,product_id,amount,total_price,created_at")] Order_detail order_detail)
        {
            if (ModelState.IsValid)
            {
                db.Order_detail.Add(order_detail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.order_id = new SelectList(db.Orders, "id", "customer_name", order_detail.order_id);
            ViewBag.product_id = new SelectList(db.Products, "id", "name", order_detail.product_id);
            return View(order_detail);
        }

        // GET: Order_detail/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order_detail order_detail = db.Order_detail.Find(id);
            if (order_detail == null)
            {
                return HttpNotFound();
            }
            ViewBag.order_id = new SelectList(db.Orders, "id", "customer_name", order_detail.order_id);
            ViewBag.product_id = new SelectList(db.Products, "id", "name", order_detail.product_id);
            return View(order_detail);
        }

        // POST: Order_detail/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,order_id,product_id,amount,total_price,created_at")] Order_detail order_detail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order_detail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.order_id = new SelectList(db.Orders, "id", "customer_name", order_detail.order_id);
            ViewBag.product_id = new SelectList(db.Products, "id", "name", order_detail.product_id);
            return View(order_detail);
        }

        // GET: Order_detail/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order_detail order_detail = db.Order_detail.Find(id);
            if (order_detail == null)
            {
                return HttpNotFound();
            }
            return View(order_detail);
        }

        // POST: Order_detail/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Order_detail order_detail = db.Order_detail.Find(id);
            db.Order_detail.Remove(order_detail);
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
