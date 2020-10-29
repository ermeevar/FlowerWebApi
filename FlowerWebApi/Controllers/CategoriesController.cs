using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly FlowerDBContext database;

        public CategoriesController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Category>>> GetCategories()
        {
            return await database.Categories.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Category>> GetCategory(int id)
        {
            var category = await database.Categories.FindAsync(id);

            if (category == null)
            {
                return NotFound();
            }

            return category;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutCategory(int id, Category category)
        {
            if (id != category.Id)
            {
                return BadRequest();
            }

            database.Entry(category).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<Category>> PostCategory(Category category)
        {
            database.Categories.Add(category);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Category>> DeleteCategory(int id)
        {
            var category = await database.Categories.FindAsync(id);
            if (category == null)
            {
                return NotFound();
            }

            database.Categories.Remove(category);
            await database.SaveChangesAsync();

            return category;
        }
    }
}
