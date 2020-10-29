using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoreProductsController : ControllerBase
    {
        private readonly FlowerDBContext database;

        public StoreProductsController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<StoreProduct>>> GetStoreProducts()
        {
            return await database.StoreProducts.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<StoreProduct>> GetStoreProduct(int id)
        {
            var storeProduct = await database.StoreProducts.FindAsync(id);

            if (storeProduct == null)
            {
                return NotFound();
            }

            return storeProduct;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutStoreProduct(int id, StoreProduct storeProduct)
        {
            if (id != storeProduct.Id)
            {
                return BadRequest();
            }

            database.Entry(storeProduct).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<StoreProduct>> PostStoreProduct(StoreProduct storeProduct)
        {
            database.StoreProducts.Add(storeProduct);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<StoreProduct>> DeleteStoreProduct(int id)
        {
            var storeProduct = await database.StoreProducts.FindAsync(id);
            if (storeProduct == null)
            {
                return NotFound();
            }

            database.StoreProducts.Remove(storeProduct);
            await database.SaveChangesAsync();

            return storeProduct;
        }
    }
}
