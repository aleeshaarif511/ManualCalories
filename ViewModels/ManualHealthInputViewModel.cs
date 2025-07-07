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

    public event PropertyChangedEventHandler? PropertyChanged;

    public ManualHealthInputViewModel()
    {
        SaveEntryCommand = new Command(async () => await SaveEntryAsync());
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
        Entries.Add(entry);

        // Reset for new entry
        CurrentEntry = new HealthEntry();
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(CurrentEntry)));
    }
}
