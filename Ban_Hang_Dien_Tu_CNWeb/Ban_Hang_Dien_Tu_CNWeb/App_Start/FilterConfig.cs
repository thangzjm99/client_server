using System.Web;
using System.Web.Mvc;

namespace Ban_Hang_Dien_Tu_CNWeb
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
