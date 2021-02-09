namespace FlowerWebApi.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Surname { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public byte[] Picture { get; set; }
        public int AccountId { get; set; }
    }
}
