﻿using Microsoft.EntityFrameworkCore;
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
        public DbSet<Bouquet> Bouquets { get; set; }
        public DbSet<BouquetProduct> BouquetProducts { get; set; }
        public DbSet<TemplateCategory> TemplateCategories { get; set; }
        public DbSet<Template> Templates { get; set; }

        public FlowerDBContext(DbContextOptions<FlowerDBContext> options)
            : base(options)
        {
        }
    }
}
