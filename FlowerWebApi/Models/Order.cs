using System;

namespace FlowerWebApi.Models
{
    public class Order
    {
        public int Id { get; set; }
        public DateTime Start { get; set; }
        public DateTime Finish { get; set; }
        public bool IsRandom { get; set; }
        public double Cost { get; set; }
        public int? UserId { get; set; }
        public int? OrderStatusId { get; set; }
        public int? ShopId { get; set; }
        public int? BouquetId { get; set; }
        public int? TemplateId { get; set; }
    }
}
