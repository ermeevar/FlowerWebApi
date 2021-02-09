namespace FlowerWebApi.Models
{
    public class Bouquet
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Cost { get; set; }
        public int StoreId { get; set; }
        public int UserId { get; set; }
    }
}
