using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BanDoNoiThat.Models;
using BanDoNoiThat.DAO;

namespace BanDoNoiThat.Controllers.Admin
{
    public class ReportController : Controller
    {
        // GET: Report
        private Model1 db = new Model1();
        public ActionResult Index()
        {


            var model = new ReportDao().Report_all();
            ViewBag.ImportReport = TempData["import_report"];
            ViewBag.SellingReport = TempData["selling_report"];
            return View(model);

        }
        [HttpPost]
        
        public ActionResult ImportReport()
        {

            DateTime start_date =DateTime.Parse(Request.Form["ImportStartDate"].ToString());
            DateTime end_date = DateTime.Parse(Request.Form["ImportEndDate"].ToString());
            var import_report = new ReportDao();
            TempData["import_report"]  = import_report.Import_Report(start_date,end_date);
            return RedirectToAction("Index","Report");
        }

        public ActionResult SellingReport()
        {

            DateTime start_date = DateTime.Parse(Request.Form["SellingStartDate"].ToString());
            DateTime end_date = DateTime.Parse(Request.Form["SellingEndDate"].ToString());
            var selling_report = new ReportDao();
            TempData["selling_report"] = selling_report.Selling_Report(start_date, end_date);
            return RedirectToAction("Index", "Report");
        }
    }
}