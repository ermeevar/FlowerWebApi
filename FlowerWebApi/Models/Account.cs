namespace FlowerWebApi.Models
{
    public class Account
    {
        public int Id { get; set; }
        public string Login { get; set; }
        public string  PasswordHash { get; set; }
        public string  Salt { get; set; }
        public string Role { get; set; }
    }
}
