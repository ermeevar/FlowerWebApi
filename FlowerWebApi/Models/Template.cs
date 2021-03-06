﻿namespace FlowerWebApi.Models
{
    public class Template
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int? TemplateCategoryId { get; set; }
        public int? StoreId { get; set; }
        public byte[] Picture { get; set; }
        public double? Cost { get; set; }
    }
}
