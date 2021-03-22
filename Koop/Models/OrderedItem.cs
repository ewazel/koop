using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class OrderedItem
    {
        public long OrderedItemId { get; set; }
        public long OrderId { get; set; }
        public long ProductId { get; set; }
        public long CoopId { get; set; }
        public long OrderStatusId { get; set; }
        public int Quantity { get; set; }

        public virtual Cooperator Coop { get; set; }
        public virtual Order Order { get; set; }
        public virtual OrderStatus OrderStatus { get; set; }
        public virtual Product Product { get; set; }
    }
}
