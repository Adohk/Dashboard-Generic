using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Dashboard.Controllers {
    public class ErrorController : Controller {
        // GET: Error
        public ActionResult Index() {
            return RedirectToAction("NotFound");
        }

        public ActionResult NotFound(string aspxerrorpath) {
            if (Session["UserID"] == null) {
                return RedirectToAction("Login", "Account");
            } else {
                return View("404");
            }
        }

        public ActionResult UnAuthorized(string aspxerrorpath) {
            if (Session["UserID"] == null) {
                return RedirectToAction("Login", "Account");
            } else {
                return View("401");
            }
        }

        public ActionResult ServerError() {
            return View("500");
        }

    }
}