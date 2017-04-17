using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Dashboard.App_Start {
    public class SessionExpireAttribute : ActionFilterAttribute {
        public override void OnActionExecuting(ActionExecutingContext filterContext) {
            HttpContext ctx = HttpContext.Current;
            // check  sessions here
            if (HttpContext.Current.Session["UserID"] == null) {
                filterContext.Result = new RedirectResult("../../");
                return;
            }
            base.OnActionExecuting(filterContext);
        }
    }
}