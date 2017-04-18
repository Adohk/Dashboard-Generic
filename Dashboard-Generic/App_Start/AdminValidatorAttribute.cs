using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Dashboard.App_Start {
    public class AdminValidatorAttribute : ActionFilterAttribute {
        public override void OnActionExecuting(ActionExecutingContext filterContext) {
            HttpContext ctx = HttpContext.Current;
            // check  sessions here
            if (HttpContext.Current.Session["UserRole"].ToString() != "Admin") {
                filterContext.Result = new RedirectResult("Error/UnAuthorized");
                return;
            }
            base.OnActionExecuting(filterContext);
        }
    }
}