using IMS_CGM_Mobile_App.Models;
using Microsoft.EntityFrameworkCore;

namespace IMS_CGM_Mobile_App.Repositories;

public interface IHealthEntryRepository
{
    Task AddEntryAsync(HealthEntry entry);
    Task<List<HealthEntry>> GetAllEntriesAsync();
}

public class HealthEntryRepository : IHealthEntryRepository
{
    private readonly AppDbContext _context;

    public HealthEntryRepository(AppDbContext context)
    {
        _context = context ?? throw new ArgumentNullException(nameof(context));
    }

    public async Task AddEntryAsync(HealthEntry entry)
    {
        _context.HealthEntries.Add(entry);
        await _context.SaveChangesAsync();
    }

    public async Task<List<HealthEntry>> GetAllEntriesAsync()
    {
        return await _context.HealthEntries.OrderByDescending(e => e.TimeStamp).ToListAsync();
    }
}
