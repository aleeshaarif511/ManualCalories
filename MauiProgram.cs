using IMS_CGM_Mobile_App.Repositories;
using IMS_CGM_Mobile_App.ViewModels;


namespace IMS_CGM_Mobile_App;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
            });


        builder.Services.AddSingleton<App>();

        builder.Services.AddSingleton<AppDbContext>();
        builder.Services.AddScoped<IHealthEntryRepository, HealthEntryRepository>();
        builder.Services.AddTransient<ManualHealthInputViewModel>();

        return builder.Build();
    }
}
