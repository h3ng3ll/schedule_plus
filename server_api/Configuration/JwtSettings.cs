namespace server_api.Configuration;

public class JwtSettings
{
    public string Audience { get; set; }
    public string Issuer { get; set; }
    public string SecretKey { get; set; }
}