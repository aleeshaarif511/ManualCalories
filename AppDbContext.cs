using IMS_CGM_Mobile_App.Models;
using Microsoft.EntityFrameworkCore;

namespace IMS_CGM_Mobile_App;

public class AppDbContext : DbContext
{
    public DbSet<HealthEntry> HealthEntries => Set<HealthEntry>();

    private readonly string _dbPath;

    public AppDbContext()
    {
        var folder = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
        _dbPath = Path.Combine(folder, "ims_cgm.db");
        Database.EnsureCreated();
    }

    protected override void OnConfiguring(DbContextOptionsBuilder options)
    {
        options.UseSqlite($"Filename={_dbPath}");
    }
}
