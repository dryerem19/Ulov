using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Ulov.Entities;
using Ulov.Infrastructure;

namespace Ulov
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class CatalogWindow : Window
    {
        private string _search;

        public CatalogWindow()
        {
            InitializeComponent();

            foreach (var file in Directory.GetFiles(@"C:\Users\dryerem19\Desktop\Товар_import"))
            {
                var filename = Path.GetFileNameWithoutExtension(file);
                foreach (var product in Helper.Database.Product.ToList())
                {
                    if (product.Articul == filename)
                    {
                        product.Image = File.ReadAllBytes(file);
                    }
                }
            }

            Update();
        }

        private void Update()
        {
            try
            {
                if (ProductListView != null)
                {
                    var products = Helper.Database.Product.ToList();

                    CommonCountRows.Content = products.Count;
                    SortSearch(ref products);
                    SortDiscount(ref products);
                    SortCost(ref products);
                    CurrentCountRows.Content = products.Count;

                    ProductListView.ItemsSource = products;
                }
            }
            catch (Exception ex)
            {
                Helper.ShowError(ex.Message);
            }
        }

        void SortDiscount(ref List<Product> products)
        {
            var combobox = SortByDiscountComboBox;
            if (combobox != null)
            {
                var index = combobox.SelectedIndex;
                switch (index)
                {
                    case 0:
                        return;
                    case 1:
                        products = products.Where(x => x.CurrentDiscount <= 10).ToList();
                        break;
                    case 2:
                        products = products.Where(x => x.CurrentDiscount >= 10 && x.CurrentDiscount <= 15).ToList();
                        break;
                    case 3:
                        products = products.Where(x => x.CurrentDiscount >= 15).ToList();
                        break;
                    default:
                        return;
                }
            }
        }

        void SortSearch(ref List<Product> products)
        {
            if (string.IsNullOrEmpty(_search))
            {
                return;
            }

            products = products.Where(x =>
            {
                var search = _search.ToLower().Trim();
                var name = x.Name.ToLower().Trim();
                return name.Contains(search);
            }).ToList();
        }

        void SortCost(ref List<Product> products) 
        {
            var combobox = SortByCostComboBox;
            products = combobox.SelectedIndex == 0 ? 
                products.OrderBy(x => x.Cost).ToList() :
                products.OrderByDescending(x => x.Cost).ToList();
        }

        private void OnSearchTextBoxChanged(object sender, TextChangedEventArgs e)
        {
            var searchTextBox = sender as TextBox;
            if (searchTextBox != null)
            {
                _search = searchTextBox.Text;
            }

            Update();
        }

        private void OnDiscountComboBoxSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void OnCostComboBoxSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void OnExitButtonClick(object sender, RoutedEventArgs e)
        {
            var result = MessageBox.Show("Вы уверены?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                Application.Current.Shutdown();
            }
        }
    }
}
