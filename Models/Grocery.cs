﻿using System;
using System.Collections.Generic;

namespace Models
{
    public partial class Grocery
    {
        public Grocery()
        {
            Stock = new HashSet<Stock>();
        }

        public int GroceryId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public decimal? Weight { get; set; }
        public int? ConversionId { get; set; }
        public string ImageUrl { get; set; }
        public string Description { get; set; }
        public string ImageAlt { get; set; }
        public int CategoryId { get; set; }

        public Category Category { get; set; }
        public Conversion Conversion { get; set; }
        public ICollection<Stock> Stock { get; set; }
    }
}
