using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Ban_Hang_Dien_Tu_CNWeb
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
              name: "Cart",
              url: "gio-hang",
              defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
              namespaces: new[] { "Ban_Hang_Dien_Tu_CNWeb.Controllers" }
          );
            routes.MapRoute(
             name: "Login",
             url: "dang-nhap",
             defaults: new { controller = "User", action = "Login", id = UrlParameter.Optional },
             namespaces: new[] { "Ban_Hang_Dien_Tu_CNWeb.Controllers" }
         );
            routes.MapRoute(
              name: "Register",
              url: "dang-ky",
              defaults: new { controller = "User", action = "Register", id = UrlParameter.Optional },
              namespaces: new[] { "Ban_Hang_Dien_Tu_CNWeb.Controllers" }
          );
            routes.MapRoute(
             name: "Payment",
             url: "thanh-toan",
             defaults: new { controller = "Cart", action = "Payment", id = UrlParameter.Optional },
             namespaces: new[] { "Ban_Hang_Dien_Tu_CNWeb.Controllers" }
         );
            routes.MapRoute(
               name: "Add Cart",
               url: "them-gio-hang",
               defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional },
               namespaces: new[] { "Ban_Hang_Dien_Tu_CNWeb.Controllers" }
           );
            routes.MapRoute(
               name: "Payment Success",
               url: "hoan-thanh",
               defaults: new { controller = "Cart", action = "Success", id = UrlParameter.Optional },
               namespaces: new[] { "Ban_Hang_Dien_Tu_CNWeb.Controllers" }
           );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Page", action = "Product", id = UrlParameter.Optional }
            );
           
        }
    }
}
