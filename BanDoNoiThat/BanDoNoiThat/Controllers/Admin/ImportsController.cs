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
    public class ImportsController : Controller
    {
        private Model1 db = new Model1();

        // GET: Imports
        public ActionResult Index()
        {
            var imports = db.Imports.Include(i => i.Product).Include(i => i.ProductionCompany);
            return View(imports.ToList());
        }

        // GET: Imports/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Import import = db.Imports.Find(id);
            if (import == null)
            {
                return HttpNotFound();
            }
            return View(import);
        }

        // GET: Imports/Create
        public ActionResult Create()
        {
            ViewBag.id_product = new SelectList(db.Products, "id", "name");
            ViewBag.id_productionCompany = new SelectList(db.ProductionCompanies, "id", "name");
            return View();
        }

        // POST: Imports/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,id_product,id_productionCompany,import_price,quantity,created_at")] Import import)
        {
            if (ModelState.IsValid)
            {
                db.Imports.Add(import);
                import.created_at = DateTime.Now;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_product = new SelectList(db.Products, "id", "name", import.id_product);
            ViewBag.id_productionCompany = new SelectList(db.ProductionCompanies, "id", "name", import.id_productionCompany);
            return View(import);
        }

        // GET: Imports/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Import import = db.Imports.Find(id);
            if (import == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_product = new SelectList(db.Products, "id", "name", import.id_product);
            ViewBag.id_productionCompany = new SelectList(db.ProductionCompanies, "id", "name", import.id_productionCompany);
            return View(import);
        }

        // POST: Imports/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,id_product,id_productionCompany,import_price,quantity,created_at")] Import import)
        {
            if (ModelState.IsValid)
            {
                db.Entry(import).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_product = new SelectList(db.Products, "id", "name", import.id_product);
            ViewBag.id_productionCompany = new SelectList(db.ProductionCompanies, "id", "name", import.id_productionCompany);
            return View(import);
        }

        // GET: Imports/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Import import = db.Imports.Find(id);
            if (import == null)
            {
                return HttpNotFound();
            }
            return View(import);
        }

        // POST: Imports/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Import import = db.Imports.Find(id);
            db.Imports.Remove(import);
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
