using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShopsController : ControllerBase
    {
        private readonly FlowerDBContext database;

        public ShopsController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Shop>>> GetShops()
        {
            return await database.Shops.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Shop>> GetShop(int id)
        {
            var shop = await database.Shops.FindAsync(id);

            if (shop == null)
            {
                return NotFound();
            }

            return shop;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutShop(int id, Shop shop)
        {
            if (id != shop.Id)
            {
                return BadRequest();
            }

            database.Entry(shop).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<Shop>> PostShop(Shop shop)
        {
            database.Shops.Add(shop);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Shop>> DeleteShop(int id)
        {
            var shop = await database.Shops.FindAsync(id);
            if (shop == null)
            {
                return NotFound();
            }

            database.Shops.Remove(shop);
            await database.SaveChangesAsync();

            return shop;
        }
    }
}
