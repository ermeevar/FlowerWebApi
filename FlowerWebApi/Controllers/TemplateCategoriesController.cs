using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class TemplateCategoriesController : Controller
    {
        private readonly FlowerDBContext database;

        public TemplateCategoriesController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<IEnumerable<TemplateCategory>> GetTemplateCategories()
        {
            return await database.TemplateCategories.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<TemplateCategory>> GetTemplateCategory(int id)
        {
            var templateCategory = await database.TemplateCategories.FindAsync(id);

            if (templateCategory == null)
            {
                return NotFound();
            }

            return templateCategory;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutTemplateCategory(int id, TemplateCategory templateCategory)
        {
            if (id != templateCategory.Id)
            {
                return BadRequest();
            }

            database.Entry(templateCategory).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult> PostTemplateCategory(TemplateCategory templateCategory)
        {
            database.TemplateCategories.Add(templateCategory);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteTemplateCategory(int id)
        {
            var templateCategory = await database.TemplateCategories.FindAsync(id);
            if (templateCategory == null)
            {
                return NotFound();
            }

            database.TemplateCategories.Remove(templateCategory);
            await database.SaveChangesAsync();

            return NoContent();
        }
    }
}
