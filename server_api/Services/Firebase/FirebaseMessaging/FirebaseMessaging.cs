using FirebaseAdmin.Messaging;

namespace schedule_plus.Services.Firebase.FirebaseMessaging;

public interface IFirebaseMessagingService
{
    public Task<string?> SendMessage(Notification notification , string token);
    
}

public class FirebaseMessagingService : IFirebaseMessagingService
{
    private readonly FirebaseAdmin.Messaging.FirebaseMessaging _firebaseMessagingInstance =
        FirebaseAdmin.Messaging.FirebaseMessaging.DefaultInstance;

    public async Task<string?> SendMessage(Notification notification , string token)
    {
        var message = new Message()
        {
            Data = new Dictionary<string, string>(),
            Notification = new FirebaseAdmin.Messaging.Notification()
            {
                Body = notification.Body,
                Title = notification.Title,
            },
            Token = token
        };
        
        var response = await _firebaseMessagingInstance.SendAsync(
            message
        );

        // Response is a message ID string.
        Console.WriteLine("Successfully sent message: " + response);
        return response;
    }
    
    // Every mobile device has identifier save it . It allows to 
    // send push it device directly . 
    // public async Task SaveFcmToken(string token)
    // {
    //     
    // }
}