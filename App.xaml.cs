using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using Ulov.Infrastructure;

namespace Ulov
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public App()
        {
            try
            {
                Helper.Database = new Entities.ApplicationDatabase();
            }
            catch (Exception ex)
            {
                Helper.ShowError(ex.Message);
            }
        }
    }
}
