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


            var model = new ProductDao().Report_all();
			
			return View(model);
        }
    }
}