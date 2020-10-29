using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ShopProductsController : ControllerBase
    {
        private readonly FlowerDBContext database;

        public ShopProductsController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ShopProduct>>> GetShopProducts()
        {
            return await database.ShopProducts.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ShopProduct>> GetShopProduct(int id)
        {
            var shopProduct = await database.ShopProducts.FindAsync(id);

            if (shopProduct == null)
            {
                return NotFound();
            }

            return shopProduct;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutShopProduct(int id, ShopProduct shopProduct)
        {
            if (id != shopProduct.Id)
            {
                return BadRequest();
            }

            database.Entry(shopProduct).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<ShopProduct>> PostShopProduct(ShopProduct shopProduct)
        {
            database.ShopProducts.Add(shopProduct);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<ShopProduct>> DeleteShopProduct(int id)
        {
            var shopProduct = await database.ShopProducts.FindAsync(id);
            if (shopProduct == null)
            {
                return NotFound();
            }

            database.ShopProducts.Remove(shopProduct);
            await database.SaveChangesAsync();

            return shopProduct;
        }
    }
}
