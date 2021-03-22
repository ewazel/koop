using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class AvailableQuantity
    {
        public long AvailableQuantityId { get; set; }
        public long ProductId { get; set; }
        public int Quantity { get; set; }

        public virtual Product Product { get; set; }
    }
}
