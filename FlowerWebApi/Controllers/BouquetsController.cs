using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BouquetsController : Controller
    {
        private readonly FlowerDBContext database;

        public BouquetsController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Bouquet>> GetBouquets()
        {
            return await database.Bouquets.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Bouquet>> GetBouquet(int id)
        {
            var bouquet = await database.Bouquets.FindAsync(id);

            if (bouquet == null)
            {
                return NotFound();
            }

            return bouquet;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutBouquet(int id, Bouquet bouquet)
        {
            if (id != bouquet.Id)
            {
                return BadRequest();
            }

            database.Entry(bouquet).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult> PostBouquet(Bouquet bouquet)
        {
            database.Bouquets.Add(bouquet);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteBouquet(int id)
        {
            var bouquet = await database.Bouquets.FindAsync(id);
            if (bouquet == null)
            {
                return NotFound();
            }

            database.Bouquets.Remove(bouquet);
            await database.SaveChangesAsync();

            return NoContent();
        }
    }
}
