namespace schedule_plus.Utils.Client;

public abstract class IHttpClientFactory(HttpClient httpClient)
{
    public HttpClient HttpClient = httpClient;
}

public class HttpClientFactory() : IHttpClientFactory(
    new HttpClient(
        handler: new HttpClientHandler()
    )
);