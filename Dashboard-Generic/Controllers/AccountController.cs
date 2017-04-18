using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Dashboard.Controllers {
    public class AccountController : Controller {
        // GET: Account
        public ActionResult Index() {
            return RedirectToAction("Login");
        }

        public ActionResult Login() {
            ViewBag.result = true;
            return View();
        }

        [HttpPost][ValidateAntiForgeryToken][ValidateInput(false)]
        public ActionResult Login(string username, string password) {
            if (username.ToLower().Equals("admin") && password.ToLower().Equals("admin")) {
                Session["UserID"] = 1;
                return RedirectToAction("Index", "Home");
            } else {
                ViewBag.result = false;
                return View();
            }
        }

        public ActionResult Logout() {
            if (Session["UserID"] == null) {
                return RedirectToAction("Login");
            }
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            return View("Login");
        }
    }
}
