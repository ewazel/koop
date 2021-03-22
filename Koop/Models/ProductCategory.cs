using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class ProductCategory
    {
        public long ProductCategoryId { get; set; }
        public long ProductId { get; set; }
        public long CategoryId { get; set; }

        public virtual Category Category { get; set; }
        public virtual Product Product { get; set; }
    }
}
