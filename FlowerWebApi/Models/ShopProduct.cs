namespace FlowerWebApi.Models
{
    public class ShopProduct
    {
        public int Id { get; set; }
        public bool IsEmpty { get; set; }
        public int StoreProductId { get; set; }
        public int ShopId { get; set; }
    }
}
