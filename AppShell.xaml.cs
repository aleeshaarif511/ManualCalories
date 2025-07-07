using IMS_CGM_Mobile_App.Views;
using IMS_CGM_Mobile_App.ViewModels;

namespace IMS_CGM_Mobile_App;

public partial class App : Application
{
    public App()
    {
        InitializeComponent();
        MainPage = new NavigationPage(new ManualHealthInputPage(new ManualHealthInputViewModel()));
    }
}
