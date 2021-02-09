using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BouquetProductsController : Controller
    {
        private readonly FlowerDBContext database;

        public BouquetProductsController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<IEnumerable<BouquetProduct>> GetBouquetProducts()
        {
            return await database.BouquetProducts.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<BouquetProduct>> GetBouquetProduct(int id)
        {
            var bouquetProduct = await database.BouquetProducts.FindAsync(id);

            if (bouquetProduct == null)
            {
                return NotFound();
            }

            return bouquetProduct;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutBouquetProduct(int id, BouquetProduct bouquetProduct)
        {
            if (id != bouquetProduct.Id)
            {
                return BadRequest();
            }

            database.Entry(bouquetProduct).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult> PostBouquetProduct(BouquetProduct bouquetProduct)
        {
            database.BouquetProducts.Add(bouquetProduct);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteBouquetProduct(int id)
        {
            var bouquetProduct = await database.BouquetProducts.FindAsync(id);
            if (bouquetProduct == null)
            {
                return NotFound();
            }

            database.BouquetProducts.Remove(bouquetProduct);
            await database.SaveChangesAsync();

            return NoContent();
        }
    }
}
