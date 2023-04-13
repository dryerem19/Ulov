namespace Ulov.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Windows;
    using System.Windows.Media;
    using System.Windows.Media.Animation;

    [Table("Product")]
    public partial class Product
    {
        [Key]
        [StringLength(100)]
        public string Articul { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public int UnitId { get; set; }

        [Column(TypeName = "money")]
        public decimal Cost { get; set; }

        public int MaxDiscount { get; set; }

        public int ManufacturerId { get; set; }

        public int SupplierId { get; set; }

        public int CategoryId { get; set; }

        public int CurrentDiscount { get; set; }

        public int StorageCount { get; set; }

        [Required]
        [StringLength(200)]
        public string Description { get; set; }

        public byte[] Image { get; set; }

        public virtual Category Category { get; set; }

        public virtual Manufacturer Manufacturer { get; set; }

        public virtual Supplier Supplier { get; set; }

        public virtual Unit Unit { get; set; }

        [NotMapped]
        public decimal DiscountCost => Cost - (Cost / 100) * CurrentDiscount;

        [NotMapped]
        public Visibility DiscountCostVisible => CurrentDiscount == 0 ? Visibility.Collapsed : Visibility.Visible;

        [NotMapped]
        public SolidColorBrush DiscountBackground 
        {
            get
            {
                if (CurrentDiscount >= 15)
                {
                    var color = (Color)ColorConverter.ConvertFromString("#7fff00");
                    return new SolidColorBrush(color);
                }

                return new SolidColorBrush(Colors.White);
            }
        }
    }
}
