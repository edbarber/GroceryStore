using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.WebUtilities;
using WebApp.ViewModels.Error;

namespace WebApp.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult Index()
        {
            return View(new IndexViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult ErrorCode()
        {
            int errorCode = HttpContext.Response.StatusCode;

            return View(new ErrorCodeViewModel
            {
                ErrorCode = errorCode,
                Meaning = ReasonPhrases.GetReasonPhrase(errorCode)
            });
        }
    }
}