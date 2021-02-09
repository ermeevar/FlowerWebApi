using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class OrderStatusesController : Controller
    {
        private readonly FlowerDBContext database;

        public OrderStatusesController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<IEnumerable<OrderStatus>> GetOrderStatuses()
        {
            return await database.OrderStatuses.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<OrderStatus>> GetOrderStatus(int id)
        {
            var orderStatus = await database.OrderStatuses.FindAsync(id);

            if (orderStatus == null)
            {
                return NotFound();
            }

            return orderStatus;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutOrderStatus(int id, OrderStatus orderStatus)
        {
            if (id != orderStatus.Id)
            {
                return BadRequest();
            }

            database.Entry(orderStatus).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult> PostOrderStatus(OrderStatus orderStatus)
        {
            database.OrderStatuses.Add(orderStatus);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteOrderStatus(int id)
        {
            var orderStatus = await database.OrderStatuses.FindAsync(id);
            if (orderStatus == null)
            {
                return NotFound();
            }

            database.OrderStatuses.Remove(orderStatus);
            await database.SaveChangesAsync();

            return NoContent();
        }
    }
}
