using System.Text;
using System.Text.Json;
using IMS_CGM_Mobile_App.Models;

namespace IMS_CGM_Mobile_App.Services;

public class FirebaseService
{
    private readonly string _firebaseUrl = "https://ims-cgm-app-default-rtdb.firebaseio.com/healthEntries.json";

    public async Task AddHealthEntryAsync(HealthEntry entry)
    {
        Console.WriteLine("[Firebase] Attempting to connect and insert data...");
        try
        {
            var json = JsonSerializer.Serialize(entry);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            using var client = new HttpClient();
            var response = await client.PostAsync(_firebaseUrl, content);

            if (response.IsSuccessStatusCode)
            {
                Console.WriteLine("[Firebase] Data successfully inserted into Firebase Realtime Database.");
            }
            else
            {
                Console.WriteLine($"[Firebase] Failed to insert data. Status: {response.StatusCode}, Reason: {response.ReasonPhrase}");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"[Firebase] Exception occurred: {ex.Message}");
        }
    }
}
