﻿using System;

namespace FlowerWebApi.Models
{
    public class Store
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public byte[] Picture { get; set; }
        public long FirstPhone { get; set; }
        public Nullable<long> SecondPhone { get; set; }
    }
}
