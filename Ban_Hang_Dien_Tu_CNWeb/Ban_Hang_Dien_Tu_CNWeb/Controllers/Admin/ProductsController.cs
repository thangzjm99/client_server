using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Ban_Hang_Dien_Tu_CNWeb.Models;

namespace Ban_Hang_Dien_Tu_CNWeb.Controllers.Admin
{
    public class ProductsController : Controller
    {
        private ModelDbContext db = new ModelDbContext();

      
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Category);


            return View(products.ToList());
        }

      


        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

       
        public ActionResult Create()
        {
            ViewBag.category_id = new SelectList(db.Categories, "id", "name");
            return View();
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,code,category_id,name,slug,overview,image,description,detail,price,unit,sale,star,is_stock,is_active,created_at")] Product product, HttpPostedFileBase imageFile)
        {
            if (ModelState.IsValid)
            {

                string fileName = Path.GetFileNameWithoutExtension(imageFile.FileName);
                string extension = Path.GetExtension(imageFile.FileName);
                string filePath = Path.Combine(Server.MapPath("~/Images"), fileName);
                filePath = filePath + extension;
                imageFile.SaveAs(filePath);
                product.image = fileName + extension; 
                product.created_at = DateTime.Now;
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.category_id = new SelectList(db.Categories, "id", "name", product.category_id);
            return View(product);
        }

       
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.category_id = new SelectList(db.Categories, "id", "name", product.category_id);
            return View(product);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,code,category_id,name,slug,overview,image,description,detail,price,unit,sale,star,is_stock,is_active,created_at")] Product product,HttpPostedFileBase imageFile)
        {


            if (imageFile != null && imageFile.ContentLength > 0)
            {

                if (product.image != null)
                {
                    string filePathOld = Path.Combine(Server.MapPath("~/Images"), product.image);
                    System.IO.File.Delete(filePathOld);
                }


                string fileName = Path.GetFileNameWithoutExtension(imageFile.FileName);
                string extension = Path.GetExtension(imageFile.FileName);
                string filePathNew = Path.Combine(Server.MapPath("~/Images"), fileName);
                filePathNew = filePathNew + extension;
                imageFile.SaveAs(filePathNew);
                product.image = fileName + extension;
            }


            if (ModelState.IsValid)
            {

                db.Entry(product).State = EntityState.Modified;
                if (imageFile == null)
                {
                    db.Entry(product).Property(m => m.image).IsModified = false;
                }
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.category_id = new SelectList(db.Categories, "id", "name", product.category_id);
            return View(product);
        }

        
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

     
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
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
