using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows.Input;
using IMS_CGM_Mobile_App.Models;
using IMS_CGM_Mobile_App.Services;

namespace IMS_CGM_Mobile_App.ViewModels;

public class ManualHealthInputViewModel : INotifyPropertyChanged
{
    private readonly FirebaseService _firebaseService = new FirebaseService();

    public HealthEntry CurrentEntry { get; set; } = new HealthEntry();
    public ObservableCollection<HealthEntry> Entries { get; set; } = new();

    public ICommand SaveEntryCommand { get; }
    public ICommand ShowEntryDetailCommand { get; }

    public event PropertyChangedEventHandler? PropertyChanged;

    public ManualHealthInputViewModel()
    {
        SaveEntryCommand = new Command(async () => await SaveEntryAsync());
        ShowEntryDetailCommand = new Command<HealthEntry>(ShowEntryDetail);
        _ = LoadEntriesAsync();
    }

    public async Task SaveEntryAsync()
    {
        var entry = new HealthEntry
        {
            Type = CurrentEntry.Type,
            Details = CurrentEntry.Details,
            Value = CurrentEntry.Value,
            Notes = CurrentEntry.Notes,
            TimeStamp = DateTime.Now.ToString()
        };

        await _firebaseService.AddHealthEntryAsync(entry);
        await LoadEntriesAsync();

        // Reset for new entry
        CurrentEntry = new HealthEntry();
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(CurrentEntry)));
    }

    public async Task LoadEntriesAsync()
    {
        var loaded = await _firebaseService.GetHealthEntriesAsync();
        Entries.Clear();
        foreach (var e in loaded)
            Entries.Add(e);
    }

    private void ShowEntryDetail(HealthEntry entry)
    {
        // TODO: Implement a popup or navigation to a detail page
        // For now, display an alert (if using Shell or pass callback to View)
    }
}
