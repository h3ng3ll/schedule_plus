using FirebaseAdmin.Messaging;

namespace schedule_plus.Services.Firebase.FirebaseMessaging;

public interface IFirebaseMessagingService
{
    public Task<string?> SendMessage(Notification notification);
    public Task SaveFcmToken(string token);

}

public class FirebaseMessagingService : IFirebaseMessagingService
{
    private readonly FirebaseAdmin.Messaging.FirebaseMessaging _firebaseMessagingInstance =
        FirebaseAdmin.Messaging.FirebaseMessaging.DefaultInstance;

    public async Task<string?> SendMessage(Notification notification)
    {
        // Particular device
        var token =
            "d0mCRb5GQxuuhRNiw1UEjo:APA91bH51eDBjI-e5fLC3mA2s8J0WuEwz6ABS-RFP6eHPr3KJUy0X7LxdoDkKlKUXW4r4-fi2X09IY4Pe3ZGJ-luWqRoqIf8sr7D8TsWzi1H051arAytwPA";
        
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

    public async Task SaveFcmToken(string token)
    {
        
    }
}