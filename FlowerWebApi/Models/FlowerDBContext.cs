using Microsoft.EntityFrameworkCore;
using System;

namespace FlowerWebApi.Models
{
    public class FlowerDBContext:DbContext,IDisposable
    {
        public DbSet<Store> Stores { get; set; }

        public FlowerDBContext(DbContextOptions<FlowerDBContext> options)
            : base(options)
        {
        }
    }
}
