using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Data;
using Models;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [Route("api/[controller]")]
    public class CategoriesController : Controller
    {
        private readonly GroceryStoreContext _context;

        public CategoriesController(GroceryStoreContext context)
        {
            _context = context;
        }

        // GET: api/categories
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Category>>> GetAsync()
        {
            return await _context.Category.Include(g => g.Grocery).Where(c => c.Grocery.Count > 0).ToListAsync();
        }

        // GET: api/categories/5
        [HttpGet("{id:int}")]
        public ActionResult<Category> GetCategory(int id)
        {
            Category category = _context.Category.Find(id);

            if (category == null)
            {
                return NotFound();
            }
            else
            {
                return category;
            }
        }
    }
}