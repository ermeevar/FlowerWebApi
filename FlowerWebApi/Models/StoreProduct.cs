namespace FlowerWebApi.Models
{
    public class StoreProduct
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public byte[] Picture { get; set; }
        public double Cost { get; set; }
        public int CategoryId { get; set; }
        public int StoreId { get; set; }
    }
}
