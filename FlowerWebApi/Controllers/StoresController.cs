using FlowerWebApi.Models;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace FlowerWebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class StoresController:Controller
    {
        private readonly FlowerDBContext _database;

        public StoresController(FlowerDBContext context)
        {
            this._database = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Store>> GetStore()
        {
            return await _database.Stores.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Store>> GetStore(int id)
        {
            Store store = await _database.Stores.FindAsync(id);

            if (store == null)
            {
                return NotFound();
            }

            return store;
        }

        [HttpPost]
        public async Task<ActionResult> PostStore(Store store)
        {
            if (store == null)
            {
                return BadRequest();
            }

            _database.Stores.Add(store);
            await _database.SaveChangesAsync();

            return Accepted();
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> PutStore(int id, Store store)
        {
            if (id != store.Id)
            {
                return BadRequest();
            }

            Store _store = await _database.Stores.FindAsync(id);
            if (_store == null)
            {
                return NotFound();
            }

            _database.Entry(store).State = EntityState.Modified;
            await _database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> DeleteStore(int id)
        {
            Store store = await _database.Stores.FindAsync(id);
            if (store == null)
            {
                return NotFound();
            }

            _database.Stores.Remove(store);
            await _database.SaveChangesAsync();

            return NoContent();
        }

    }
}
