using Microsoft.EntityFrameworkCore;
using System;

namespace FlowerWebApi.Models
{
    public class FlowerDBContext : DbContext, IDisposable
    {
        public DbSet<Account> Accounts { get; set; }
        public DbSet<Store> Stores { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Shop> Shops { get; set; }
        public DbSet<ShopProduct> ShopProducts { get; set; }
        public DbSet<StoreProduct> StoreProducts { get; set; }
        public DbSet<User> Users { get; set; }

        public FlowerDBContext(DbContextOptions<FlowerDBContext> options)
            : base(options)
        {
        }
    }
}
