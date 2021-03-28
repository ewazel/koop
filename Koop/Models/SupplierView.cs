﻿using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class SupplierView
    {
        public Guid? SupplierId { get; set; }
        public string SupplierName { get; set; }
        public string SupplierAbbr { get; set; }
        public string Description { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Picture { get; set; }
        public DateTime? OrderClosingDate { get; set; }
        public Guid? OproId { get; set; }
        public string Opro { get; set; }
    }
}
