using Firebase.Database;
using Firebase.Database.Query;
using IMS_CGM_Mobile_App.Models;

namespace IMS_CGM_Mobile_App.Repositories;

public interface IHealthEntryRepository
{
    Task AddEntryAsync(HealthEntry entry);
    Task<List<HealthEntry>> GetAllEntriesAsync();
}

public class HealthEntryRepository : IHealthEntryRepository
{
    private readonly FirebaseClient _client = new FirebaseClient("https://ims-cgm-app-default-rtdb.firebaseio.com/");

    public async Task AddEntryAsync(HealthEntry entry)
    {
        await _client.Child("healthEntries").PostAsync(entry);
    }

    public async Task<List<HealthEntry>> GetAllEntriesAsync()
    {
        var entries = await _client.Child("healthEntries").OnceAsync<HealthEntry>();
        return entries.Select(e => e.Object).ToList();
    }
}
