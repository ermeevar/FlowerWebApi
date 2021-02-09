using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlowerWebApi.Models;

namespace FlowerWebApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AccountsController : Controller
    {
        private readonly FlowerDBContext database;

        public AccountsController(FlowerDBContext context)
        {
            database = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Account>> GetAccounts()
        {
            return await database.Accounts.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Account>> GetAccount(int id)
        {
            var account = await database.Accounts.FindAsync(id);

            if (account == null)
            {
                return NotFound();
            }

            return account;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutAccount(int id, Account account)
        {
            if (id != account.Id)
            {
                return BadRequest();
            }

            database.Entry(account).State = EntityState.Modified;
            await database.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult> PostAccount(Account account)
        {
            database.Accounts.Add(account);
            await database.SaveChangesAsync();

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteAccount(int id)
        {
            var account = await database.Accounts.FindAsync(id);
            if (account == null)
            {
                return NotFound();
            }

            database.Accounts.Remove(account);
            await database.SaveChangesAsync();

            return NoContent();
        }
    }
}
