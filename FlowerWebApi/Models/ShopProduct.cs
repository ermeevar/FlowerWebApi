namespace FlowerWebApi.Models
{
    public class ShopProduct
    {
        public int Id { get; set; }
        public bool IsEmpty { get; set; }
        public int StoreProductId { get; set; }
        public int ShopId { get; set; }

        public virtual StoreProduct StoreProduct { get; set; }
        public virtual Shop Shop { get; set; }
    }
}
