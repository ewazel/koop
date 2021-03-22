using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class Basket
    {
        public long BasketId { get; set; }
        public long? CoopId { get; set; }

        public virtual Cooperator Coop { get; set; }
    }
}
