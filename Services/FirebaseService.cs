using System.Text;
using System.Text.Json;
using IMS_CGM_Mobile_App.Models;

namespace IMS_CGM_Mobile_App.Services;

public class FirebaseService
{
    private readonly string _firebaseUrl = "https://ims-cgm-app-default-rtdb.firebaseio.com/healthEntries.json";

    public async Task AddHealthEntryAsync(HealthEntry entry)
    {
        var json = JsonSerializer.Serialize(entry);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        using var client = new HttpClient();
        await client.PostAsync(_firebaseUrl, content);
    }
}
