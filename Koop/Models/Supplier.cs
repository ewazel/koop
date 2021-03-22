using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class Supplier
    {
        public Supplier()
        {
            Products = new HashSet<Product>();
        }

        public long SupplierId { get; set; }
        public string SupplierName { get; set; }
        public string SupplierAbbr { get; set; }
        public string Description { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Picture { get; set; }
        public DateTime? OrderClosingDate { get; set; }
        public long OproId { get; set; }

        public virtual Cooperator Opro { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
