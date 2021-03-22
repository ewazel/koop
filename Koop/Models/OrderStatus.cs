using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class OrderStatus
    {
        public OrderStatus()
        {
            OrderedItems = new HashSet<OrderedItem>();
        }

        public long OrderStatusId { get; set; }
        public string OrderStatusName { get; set; }

        public virtual ICollection<OrderedItem> OrderedItems { get; set; }
    }
}
