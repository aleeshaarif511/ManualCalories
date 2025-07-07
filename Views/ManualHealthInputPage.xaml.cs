using IMS_CGM_Mobile_App.ViewModels;

namespace IMS_CGM_Mobile_App.Views;

public partial class ManualHealthInputPage : ContentPage
{
    public ManualHealthInputPage(ManualHealthInputViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm;
    }
}
