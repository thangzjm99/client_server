using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ban_Hang_Dien_Tu_CNWeb.Common;
using Ban_Hang_Dien_Tu_CNWeb.DAO;
using Ban_Hang_Dien_Tu_CNWeb.Models;
namespace Ban_Hang_Dien_Tu_CNWeb.Controllers
{
    public class UserController : Controller
    {
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
            return Redirect("~/Page/Product");
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if(ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.username, model.password);
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
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khoá.");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng.");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn không có quyền đăng nhập.");
                }
                else if (result == -4)
                {
                    return Redirect("~/Products/Index");
                }
                else
                {
                    ModelState.AddModelError("", "đăng nhập không đúng.");
                }
            }
            return View(model);
        }
        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if(ModelState.IsValid)
            {
                var dao = new UserDao();
                if(dao.CheckUserDao(model.username))
                {
                    ModelState.AddModelError("", "Username has already existed");
                }
                else if(dao.CheckEmail(model.email))
                {
                    ModelState.AddModelError("", "Email has already existed");
                }
                else
                {
                    var user = new Customer();
                    user.name = model.name;
                    user.username = model.username;
                    user.password = model.password;
                    user.phone = model.phone;
                    user.email = model.email;
                    user.address = model.address;
                    user.created_at = DateTime.Now;
                    user.status = true;
                    var result = dao.Insert(user);
                    if(result>0)
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

       
    }
}