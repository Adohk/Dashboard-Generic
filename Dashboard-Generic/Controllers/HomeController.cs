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
        //private AuraInventarioProtoDBEntities db = new AuraInventarioProtoDBEntities();

        // GET: Home
        [AllowAnonymous]
        [AccessValidator]
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

        public ActionResult Login() {
            ViewBag.result = true;
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(true)]
        public ActionResult Login(string username, string password) {
            if (username.ToLower().Equals("admin") && password.ToLower().Equals("admin")) {
                Session["UserID"] = 1;
                return RedirectToAction("Index");
            } else {
                ViewBag.result = false;
                return View();
            }
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Login(LoginViewModel objLogin) {
        //    if (ModelState.IsValid) {
        //        try {
        //            string salt = (from n in db.LOGIN where objLogin.NOMBRE == n.NOMBRE select n.SALT).First().ToString();
        //            string passtohash = objLogin.PASS + salt;
        //            objLogin.PASS = CreateHash(passtohash);

        //            var obj = db.LOGIN.Where(a => a.NOMBRE.Equals(objLogin.NOMBRE) && a.PASS.Equals(objLogin.PASS) && a.ESTADO.Equals("Activo")).FirstOrDefault();
        //            if (obj != null) {
        //                Session["UserID"] = obj.ID.ToString();
        //                Session["UserName"] = obj.NOMBRE.ToString();
        //                Session["UserRole"] = obj.ROL.ToString();
        //                //return RedirectToAction("Index");
        //                return View("Index");
        //            }
        //        } catch (Exception) {
        //            ViewBag.error = "Error, Datos invalidos.";
        //            return View("Index");
        //        }
        //    }
        //    var errors = ModelState.Values.SelectMany(v => v.Errors);
        //    ViewBag.error = "Error, Datos invalidos.";
        //    //return RedirectToAction("Index");
        //    return View("Index");
        //}

        public ActionResult Logout() {
            if (Session["UserID"] == null) {
                return RedirectToAction("Login");
            }

            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            return View("Login");
            //return RedirectToRoute("/");
            //return View("Index");
        }

        public ActionResult NotFound(string aspxerrorpath) {
            if (Session["UserID"] == null) {
                return RedirectToAction("Login");
            } else {
                return View("404");
            }
        }

        public ActionResult UnAuthorized(string aspxerrorpath) {
            if (Session["UserID"] == null) {
                return RedirectToAction("Login");
            } else {
                return View("401");
            }
        }

        public ActionResult ServerError() {
            return View("500");
        }

        //public ActionResult NotFound(string aspxerrorpath) {
        //    if (!string.IsNullOrWhiteSpace(aspxerrorpath))
        //        return RedirectToAction("NotFound");

        //    return View();
        //}
    }
}