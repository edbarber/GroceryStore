using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [Route("api/[controller]")]
    public class GroceriesController : Controller
    {
        private readonly GroceryStoreContext _context;

        public GroceriesController(GroceryStoreContext context)
        {
            _context = context;
        }

        // GET: api/groceries/categorized/5
        [HttpGet("categorized/{categoryId:int}")]
        public async Task<ActionResult<IEnumerable<Grocery>>> GetByCategoryAsync(int categoryId)
        {
            List<Grocery> groceries = await _context.Grocery.Include(g => g.Stock).Include(g => g.Conversion).Where(g => g.CategoryId == categoryId).ToListAsync();

            if (!groceries.Any())
            {
                return NotFound();
            }
            else
            {
                return groceries;
            }
        }
    }
}