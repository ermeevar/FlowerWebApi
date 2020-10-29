namespace FlowerWebApi.Models
{
    public class Shop
    {
        public int Id { get; set; }
        public string Address { get; set; }
        public int StoreId { get; set; }

        public virtual Store Store { get; set; }
    }
}
