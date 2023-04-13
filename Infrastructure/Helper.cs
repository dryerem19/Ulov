using System.Windows;
using Ulov.Entities;

namespace Ulov.Infrastructure
{
    public static class Helper
    {
        public static ApplicationDatabase Database;

        public static void ShowError(string message)
        {
            MessageBox.Show($"Ошибка: {message}", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
