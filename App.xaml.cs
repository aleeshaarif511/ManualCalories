namespace IMS_CGM_Mobile_App;
using IMS_CGM_Mobile_App.ViewModels;

public partial class App : Application
{
   public App(IServiceProvider serviceProvider)
{
    InitializeComponent();
    var vm = serviceProvider.GetService<ManualHealthInputViewModel>();
    MainPage = new NavigationPage(new Views.ManualHealthInputPage(vm));
}

}
