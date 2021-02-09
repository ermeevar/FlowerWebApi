using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class TemplatesController : Controller
    {
        private readonly FlowerDBContext database;

        public TemplatesController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Template>> GetTemplates()
        {
            return await database.Templates.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Template>> GetTemplate(int id)
        {
            var template = await database.Templates.FindAsync(id);

            if (template == null)
            {
                return NotFound();
            }

            return template;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutTemplate(int id, Template template)
        {
            if (id != template.Id)
            {
                return BadRequest();
            }

            database.Entry(template).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult> PostTemplate(Template template)
        {
            database.Templates.Add(template);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteTemplate(int id)
        {
            var template = await database.Templates.FindAsync(id);
            if (template == null)
            {
                return NotFound();
            }

            database.Templates.Remove(template);
            await database.SaveChangesAsync();

            return NoContent();
        }
    }
}
