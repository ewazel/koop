using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class Cooperator
    {
        public Cooperator()
        {
            Baskets = new HashSet<Basket>();
            Favorities = new HashSet<Favority>();
            OrderedItems = new HashSet<OrderedItem>();
            Suppliers = new HashSet<Supplier>();
            Works = new HashSet<Work>();
        }

        public long CoopId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Info { get; set; }
        public double? Debt { get; set; }
        public long FundId { get; set; }
        public long? FunctionId { get; set; }
        public byte? BasketId { get; set; }

        public virtual Function Function { get; set; }
        public virtual Fund Fund { get; set; }
        public virtual ICollection<Basket> Baskets { get; set; }
        public virtual ICollection<Favority> Favorities { get; set; }
        public virtual ICollection<OrderedItem> OrderedItems { get; set; }
        public virtual ICollection<Supplier> Suppliers { get; set; }
        public virtual ICollection<Work> Works { get; set; }
    }
}
