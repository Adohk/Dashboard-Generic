using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using static Dashboard.App_Start.HashClass;
using Dashboard.App_Start;


namespace Dashboard.Controllers {
    //[Authorize]
    public class HomeController : Controller {

        // GET: Home
        [AllowAnonymous][AccessValidator]
        public ActionResult Index() {
            return View();
        }

        [AccessValidator]
        public ActionResult BlankPage() {
            return View();
        }

        [AccessValidator]
        public ActionResult ThemeChanger(string selection) {
            var userCookie = new HttpCookie("Theme", selection);
            HttpContext.Response.Cookies.Add(userCookie);

            return View("Index");
        }

    }
}