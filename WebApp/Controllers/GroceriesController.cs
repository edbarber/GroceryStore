using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace WebApp.Controllers
{
    public class GroceriesController : Controller
    {
        private readonly IHttpClientFactory _clientFactory;

        public GroceriesController(IHttpClientFactory clientFactory)
        {
            _clientFactory = clientFactory;
        }

        public async Task<IActionResult> Index(int categoryId)
        {
            HttpClient client = _clientFactory.CreateClient("API");
            HttpResponseMessage response = await client.GetAsync($"api/groceries/categorized/{categoryId}");

            if (!response.IsSuccessStatusCode)
            {
                return StatusCode((int)response.StatusCode);
            }
            else
            {
                IEnumerable<Grocery> groceries = await response.Content.ReadAsAsync<IEnumerable<Grocery>>();
                response = await client.GetAsync($"api/categories/{categoryId}");

                if (response.IsSuccessStatusCode)
                {
                    ViewData["Title"] = (await response.Content.ReadAsAsync<Category>()).Name;
                }

                return View(groceries);
            }
        }
    }
}