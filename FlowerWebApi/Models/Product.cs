namespace FlowerWebApi.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public byte[] Picture { get; set; }
        public double Cost { get; set; }
        public int ProductCategoryId { get; set; }
        public int StoreId { get; set; }
    }
}
