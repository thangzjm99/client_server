﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows;
using BanDoNoiThat.Common;
using BanDoNoiThat.DAO;
using BanDoNoiThat.Models;
namespace BanDoNoiThat.Controllers
{
    public class UserController : Controller
    {
        private Model1 db = new Model1();
        // GET: User
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            Session[CommonConstants.CartSession] = null;
            return Redirect("~/Page/Product");
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.username, Common.Encryptor.MD5Hash(model.password));
                if (result == 1)
                {
                    var user = dao.GetById(model.username);
                    var userSession = new UserLogin();
                    userSession.UserName = user.username;
                    userSession.UserID = user.id;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return Redirect("~/Page/Product");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Your account doesn't exist");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Your account is locked");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Your password is wrong");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Your account doesn't have this permission");
                }
                else if (result == -4)
                {
                    return Redirect("~/Products/Index");
                }
                else
                {
                    ModelState.AddModelError("", "Wrong sign in");
                }
            }
            return View(model);
        }
        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (dao.CheckUserDao(model.username))
                {
                    ModelState.AddModelError("", "Username has already existed");
                }
                else if (dao.CheckEmail(model.email))
                {
                    ModelState.AddModelError("", "Email has already existed");
                }
                else
                {
                    var user = new Customer();
                    user.name = model.name;
                    user.username = model.username;
                    user.password = Common.Encryptor.MD5Hash(model.password);
                    user.phone = model.phone;
                    user.email = model.email;
                    user.address = model.address;
                    user.created_at = DateTime.Now;
                    user.status = true;
                    var result = dao.Insert(user);
                    if (result > 0)
                    {
                        ViewBag.Success = "Registed Successfully";
                        model = new RegisterModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Registed Fail");
                    }

                }

            }


            return View(model);

        }

        public ActionResult ChangeUserInformation(long? id)
        {
            var usersession = (UserLogin)Session[BanDoNoiThat.Common.CommonConstants.USER_SESSION];
            Customer customer = db.Customers.Find(usersession.UserID);
            ViewBag.Password = customer.password;
            ViewBag.Name = customer.name;
            ViewBag.Address = customer.address;
            ViewBag.Phone = customer.phone;
            ViewBag.Email = customer.email;
            return View();
        }
        [HttpPost]
        public ActionResult ChangeUserInformation()
        {
            var usersession = (UserLogin)Session[BanDoNoiThat.Common.CommonConstants.USER_SESSION];
            Customer customer = db.Customers.Find(usersession.UserID);
            ViewBag.Password = customer.password;
            ViewBag.Name = customer.name;
            ViewBag.Address = customer.address;
            ViewBag.Phone = customer.phone;
            ViewBag.Email = customer.email;

            string password = Request.Form["Password"].ToString();
            string confirmpassword = Request.Form["ConfirmPassword"].ToString();
            string name = Request.Form["NameUser"];
            string address = Request.Form["Address"];
            string phone = Request.Form["Phone"];
            string email = Request.Form["Email"];
            if (password == "" && confirmpassword == "")
            {
                customer.name = name;
                customer.address = address;
                customer.phone = phone;
                customer.email = email;
                ViewBag.Success = "Changed Successfully";
                db.SaveChanges();
                return View();
            }
            else if ((password != confirmpassword) || confirmpassword == "" || password == "")
            {
                MessageBox.Show("Please check your password and confirm your password");

                return View();
            }
            else if (Common.Encryptor.MD5Hash(password) == customer.password)
            {
                MessageBox.Show("Your new password is similar as your old password ");
                return View();

            }
            else
            {
                
                customer.password = Common.Encryptor.MD5Hash(password);
                customer.name = name;
                customer.address = address;
                customer.phone = phone;
                customer.email = email;

                db.SaveChanges();
                ViewBag.Success = "Changed Successfully";
                return View();
            }



        }
    }
}