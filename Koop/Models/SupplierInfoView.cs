using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class SupplierInfoView
    {
        public string SupplierName { get; set; }
        public string SupplierAbbr { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public DateTime? OrderClosingDate { get; set; }
        public string Opro { get; set; }
    }
}
